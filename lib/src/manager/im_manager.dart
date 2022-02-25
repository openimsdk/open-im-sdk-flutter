import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class IMManager {
  MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late UserManager userManager;

  // late OfflinePushManager offlinePushManager;
  // late SignalingManager signalingManager;
  late OnConnectListener _connectListener;
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
              uInfo = Utils.toObj(data, (map) => UserInfo.fromJson(map));
              userManager.userListener.selfInfoUpdated(uInfo);
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onGroupApplicationAccepted':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.groupListener.groupApplicationAccepted(i);
              break;
            case 'onGroupApplicationAdded':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.groupListener.groupApplicationAdded(i);
              break;
            case 'onGroupApplicationDeleted':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.groupListener.groupApplicationDeleted(i);
              break;
            case 'onGroupApplicationRejected':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.groupListener.groupApplicationRejected(i);
              break;
            case 'onGroupInfoChanged':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.groupListener.groupInfoChanged(i);
              break;
            case 'onGroupMemberAdded':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.groupListener.groupMemberAdded(i);
              break;
            case 'onGroupMemberDeleted':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.groupListener.groupMemberDeleted(i);
              break;
            case 'onGroupMemberInfoChanged':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.groupListener.groupMemberInfoChanged(i);
              break;
            case 'onJoinedGroupAdded':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.groupListener.joinedGroupAdded(i);
              break;
            case 'onJoinedGroupDeleted':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.groupListener.joinedGroupDeleted(i);
              break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          var id = call.arguments['data']['id'];
          switch (type) {
            case 'onRecvNewMessage':
              var value = call.arguments['data']['newMessage'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.advancedMsgListener.recvNewMessage(msg);
              break;
            case 'onRecvMessageRevoked':
              var value = call.arguments['data']['revokedMessage'];
              messageManager.advancedMsgListener.recvMessageRevoked(value);
              break;
            case 'onRecvC2CReadReceipt':
              var value = call.arguments['data']['haveReadMessage'];
              var list =
                  Utils.toList(value, (map) => ReadReceiptInfo.fromJson(map));
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
              var list =
                  Utils.toList(data, (map) => ConversationInfo.fromJson(map));
              conversationManager.conversationListener.newConversation(list);
              break;
            case 'onConversationChanged':
              var list =
                  Utils.toList(data, (map) => ConversationInfo.fromJson(map));
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
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.friendshipListener.blacklistAdded(u);
              break;
            case 'onBlacklistDeleted':
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.friendshipListener.blacklistDeleted(u);
              break;
            case 'onFriendApplicationAccepted':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.friendshipListener.friendApplicationAccepted(u);
              break;
            case 'onFriendApplicationAdded':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.friendshipListener.friendApplicationAdded(u);
              break;
            case 'onFriendApplicationDeleted':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.friendshipListener.friendApplicationDeleted(u);
              break;
            case 'onFriendApplicationListRejected':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.friendshipListener.friendApplicationRejected(u);
              break;
            case 'onFriendInfoChanged':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.friendshipListener.friendInfoChanged(u);
              break;
            case 'onFriendAdded':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.friendshipListener.friendAdded(u);
              break;
            case 'onFriendDeleted':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.friendshipListener.friendDeleted(u);
              break;
          }
        }
      } catch (err) {
        print(
            "回调失败了。$err ${call.method} ${call.arguments['type']} ${call.arguments['data']}");
      }
      return Future.value(null);
    });
  }

  /// Initialize SDK
  ///
  /// [platform]  platform number  [IMPlatform]
  /// [apiAddr]   api server ip address
  /// [wsAddr]    webSocket ip address
  /// [dataDir]   data storage directory
  ///
  /// 初始化SDK
  ///
  /// [platform]  平台编号[IMPlatform]
  /// [apiAddr]   SDK api地址
  /// [wsAddr]    SDK websocket地址
  /// [dataDir]   SDK数据库存储目录
  Future<dynamic> initSDK({
    required int platform,
    required String apiAddr,
    required String wsAddr,
    required String dataDir,
    required OnConnectListener listener,
    int logLevel = 6,
    String objectStorage = 'cos',
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
            "operationID": Utils.checkOperationID(operationID),
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
        'operationID': Utils.checkOperationID(operationID),
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
          'operationID': Utils.checkOperationID(operationID),
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
}
