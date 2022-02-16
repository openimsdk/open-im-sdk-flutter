import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';
import 'package:flutter_openim_sdk/src/manager/im_user_manager.dart';

class IMManager {
  MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late UserManager userManager;

  // late OfflinePushManager offlinePushManager;
  // late SignalingManager signalingManager;
  late ConnectListener _connectListener;
  late String uid;
  late UserInfo uInfo;
  bool isLogined = false;

  IMManager(this._channel) {
    conversationManager = ConversationManager(_channel);
    friendshipManager = FriendshipManager(_channel);
    messageManager = MessageManager(_channel);
    groupManager = GroupManager(_channel);
    userManager = UserManager(_channel);
    // offlinePushManager = OfflinePushManager(_channel);
    // signalingManager = SignalingManager(_channel);
    _addNativeCallback(_channel);
  }

  void _addNativeCallback(MethodChannel _channel) {
    _channel.setMethodCallHandler((call) {
      try {
        log('Flutter : $call');
        if (call.method == ListenerType.connectListener) {
          String type = call.arguments['type'];
          switch (type) {
            case 'onConnectFailed':
              int? errCode = call.arguments['errCode'];
              String? errMsg = call.arguments['errMsg'];
              _connectListener.connectFailed(errCode, errMsg);
              break;
            case 'onConnecting':
              _connectListener.connecting();
              break;
            case 'onConnectSuccess':
              _connectListener.connectSuccess();
              break;
            case 'onKickedOffline':
              _connectListener.kickedOffline();
              break;
            case 'onUserSigExpired':
              _connectListener.userSigExpired();
              break;
          }
        } else if (call.method == ListenerType.userListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSelfInfoUpdated':
              uInfo = UserInfo.fromJson(_formatJson(data));
              userManager.userListener.selfInfoUpdated(uInfo);
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onGroupApplicationAccepted':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupApplicationAccepted(i);
              break;
            case 'onGroupApplicationAdded':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupApplicationAdded(i);
              break;
            case 'onGroupApplicationDeleted':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupApplicationDeleted(i);
              break;
            case 'onGroupApplicationRejected':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupApplicationRejected(i);
              break;
            case 'onGroupInfoChanged':
              final i = GroupInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupInfoChanged(i);
              break;
            case 'onGroupMemberAdded':
              final i = GroupMembersInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupMemberAdded(i);
              break;
            case 'onGroupMemberDeleted':
              final i = GroupMembersInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupMemberDeleted(i);
              break;
            case 'onGroupMemberInfoChanged':
              final i = GroupMembersInfo.fromJson(_formatJson(data));
              groupManager.groupListener.groupMemberInfoChanged(i);
              break;
            case 'onJoinedGroupAdded':
              final i = GroupInfo.fromJson(_formatJson(data));
              groupManager.groupListener.joinedGroupAdded(i);
              break;
            case 'onJoinedGroupDeleted':
              final i = GroupInfo.fromJson(_formatJson(data));
              groupManager.groupListener.joinedGroupDeleted(i);
              break;
            case 'onReceiveJoinGroupApplicationAdded':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.receiveJoinGroupApplicationAdded(i);
              break;
            case 'onReceiveJoinGroupApplicationDeleted':
              final i = GroupApplicationInfo.fromJson(_formatJson(data));
              groupManager.groupListener.receiveJoinGroupApplicationDeleted(i);
              break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          var id = call.arguments['data']['id'];
          switch (type) {
            case 'onRecvNewMessage':
              var value = call.arguments['data']['newMessage'];
              var msg = Message.fromJson(_formatJson(value));
              messageManager.advancedMsgListener.recvNewMessage(msg);
              break;
            case 'onRecvMessageRevoked':
              var value = call.arguments['data']['revokedMessage'];
              messageManager.advancedMsgListener.recvMessageRevoked(value);
              break;
            case 'onRecvC2CReadReceipt':
              var value = call.arguments['data']['haveReadMessage'];
              var l = _formatJson(value) as List;
              var list = l.map((e) => HaveReadInfo.fromJson(e)).toList();
              messageManager.advancedMsgListener.recvC2CReadReceipt(list);
              break;
          }
        } else if (call.method == ListenerType.msgSendProgressListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          String msgID = data['clientMsgID'] ?? '';
          int progress = data['progress'] ?? 100;
          switch (type) {
            case 'onProgress':
              messageManager.msgSendProgressListener?.progress(
                msgID,
                progress,
              );
              break;
          }
        } else if (call.method == ListenerType.conversationListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSyncServerStart':
              conversationManager.conversationListener.syncServerStart();
              break;
            case 'onSyncServerFinish':
              conversationManager.conversationListener.syncServerFinish();
              break;

            case 'onSyncServerFailed':
              conversationManager.conversationListener.syncServerFailed();
              break;
            case 'onNewConversation':
              List<ConversationInfo> list = List.empty(growable: true);
              if (null != data) {
                list = (_formatJson(data) as List)
                    .map((e) => ConversationInfo.fromJson(e))
                    .toList();
              }
              conversationManager.conversationListener.newConversation(list);
              break;
            case 'onConversationChanged':
              List<ConversationInfo> list = List.empty(growable: true);
              if (null != data) {
                list = (_formatJson(data) as List)
                    .map((e) => ConversationInfo.fromJson(e))
                    .toList();
              }
              conversationManager.conversationListener
                  .conversationChanged(list);
              break;
            case 'onTotalUnreadMessageCountChanged':
              conversationManager.conversationListener
                  .totalUnreadMessageCountChanged(data ?? 0);
              break;
          }
        } else if (call.method == ListenerType.friendListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];

          switch (type) {
            case 'onBlacklistAdded':
              final u = BlacklistInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.blacklistAdded(u);
              break;
            case 'onBlacklistDeleted':
              final u = BlacklistInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.blacklistDeleted(u);
              break;
            case 'onFriendApplicationAccepted':
              final u = FriendApplicationInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendApplicationAccepted(u);
              break;
            case 'onFriendApplicationAdded':
              final u = FriendApplicationInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendApplicationAdded(u);
              break;
            case 'onFriendApplicationDeleted':
              final u = FriendApplicationInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendApplicationDeleted(u);
              break;
            case 'onFriendApplicationListRejected':
              final u = FriendApplicationInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendApplicationRejected(u);
              break;
            case 'onFriendInfoChanged':
              final u = FriendInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendInfoChanged(u);
              break;
            case 'onFriendAdded':
              final u = FriendInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendAdded(u);
              break;
            case 'onFriendDeleted':
              final u = FriendInfo.fromJson(_formatJson(data));
              friendshipManager.friendshipListener.friendDeleted(u);
              break;
          }
        }
      } catch (err) {
        print(
            "回调失败了，数据类型异常。$err ${call.method} ${call.arguments['type']} ${call.arguments['data']}");
      }
      return Future.value(null);
    });
  }

  /// Initialize SDK
  ///
  /// [platform] Refer to [IMPlatform]
  /// [apiAddr] Api server ip address
  /// [wsAddr] WebSocket ip address
  /// [dataDir] Data storage directory
  /// 初始化SDK
  /// [platform] 平台编号[IMPlatform]
  /// [apiAddr]    SDK api地址
  /// [wsAddr]     SDK websocket地址
  /// [dataDir]   SDK数据库存储目录
  Future<dynamic> initSDK({
    required int platform,
    required String apiAddr,
    required String wsAddr,
    required String dataDir,
    required ConnectListener listener,
    int logLevel = 6,
    String? objectStorage,
    String? operationID,
  }) {
    _connectListener = listener;
    return _channel.invokeMethod(
        'initSDK',
        _buildParam(
          {
            "platform": platform,
            "api_addr": apiAddr,
            "ws_addr": wsAddr,
            "data_dir": dataDir,
            "log_level": logLevel,
            "object_storage": objectStorage,
            "operationID": _checkOperationID(operationID),
          },
        ));
  }

  @deprecated
  Future<dynamic> unInitSDK() {
    return _channel.invokeMethod('unInitSDK', _buildParam({}));
  }

  /// Login sdk
  /// 登录
  Future<UserInfo> login({
    required String uid,
    required String token,
    String? operationID,
  }) async {
    await _channel.invokeMethod(
      'login',
      _buildParam({
        'uid': uid,
        'token': token,
        'operationID': _checkOperationID(operationID),
      }),
    );
    this.isLogined = true;
    this.uid = uid;
    this.uInfo = await userManager.getSelfUserInfo();
    return uInfo;
  }

  /// Logout sdk
  /// 登出
  Future<dynamic> logout({String? operationID}) async {
    var value = await _channel.invokeMethod(
        'logout',
        _buildParam({
          'operationID': _checkOperationID(operationID),
        }));
    this.isLogined = false;
    return value;
  }

  ///
  Future<int?> getLoginStatus() =>
      _channel.invokeMethod<int>('getLoginStatus', _buildParam({}));

  /// Current user id
  /// 获取当前登录用户id
  Future<String> getLoginUserID() async => uid;

  /// Current user info
  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async => uInfo;

  static Map _buildParam(Map param) {
    param["ManagerName"] = "imManager";
    return param;
  }

  static dynamic _formatJson(value) => jsonDecode(_printValue(value));

  static String _printValue(value) {
    return value;
  }

  static String _checkOperationID(String? obj) {
    return obj ?? DateTime.now().millisecondsSinceEpoch.toString();
  }
}
