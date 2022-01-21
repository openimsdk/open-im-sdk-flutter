import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class IMManager {
  MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;

  // late OfflinePushManager offlinePushManager;
  // late SignalingManager signalingManager;
  late InitSDKListener _initSDKListener;
  late String uid;
  late UserInfo uInfo;
  bool isInitialized = false;
  bool isLogined = false;

  IMManager(this._channel) {
    conversationManager = ConversationManager(_channel);
    friendshipManager = FriendshipManager(_channel);
    messageManager = MessageManager(_channel);
    groupManager = GroupManager(_channel);
    // offlinePushManager = OfflinePushManager(_channel);
    // signalingManager = SignalingManager(_channel);
    _addNativeCallback(_channel);
  }

  void _addNativeCallback(MethodChannel _channel) {
    _channel.setMethodCallHandler((call) {
      try {
        log('Flutter : $call');
        if (call.method == ListenerType.initSDKListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSelfInfoUpdated':
              uInfo = UserInfo.fromJson(_formatJson(data));
              _initSDKListener.selfInfoUpdated(uInfo);
              break;
            case 'onConnectFailed':
              int? errCode = call.arguments['errCode'];
              String? errMsg = call.arguments['errMsg'];
              _initSDKListener.connectFailed(errCode, errMsg);
              break;
            case 'onConnecting':
              _initSDKListener.connecting();
              break;
            case 'onConnectSuccess':
              _initSDKListener.connectSuccess();
              break;
            case 'onKickedOffline':
              _initSDKListener.kickedOffline();
              break;
            case 'onUserSigExpired':
              _initSDKListener.userSigExpired();
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          var args = call.arguments;
          String type = args['type'];
          Map<dynamic, dynamic> map = args['data'];
          switch (type) {
            case 'onMemberEnter':
              groupManager.groupListener.memberEnter(
                map['groupId'],
                (_formatJson(map['memberList']) as List)
                    .map((e) => GroupMembersInfo.fromJson(e))
                    .toList(),
              );
              break;
            case 'onMemberLeave':
              groupManager.groupListener.memberLeave(
                map['groupId'],
                GroupMembersInfo.fromJson(_formatJson(map['member'])),
              );
              break;
            case 'onMemberInvited':
              groupManager.groupListener.memberInvited(
                map['groupId'],
                GroupMembersInfo.fromJson(_formatJson(map['opUser'])),
                (_formatJson(map['memberList']) as List)
                    .map((e) => GroupMembersInfo.fromJson(e))
                    .toList(),
              );
              break;
            case 'onMemberKicked':
              groupManager.groupListener.memberKicked(
                map['groupId'],
                GroupMembersInfo.fromJson(_formatJson(map['opUser'])),
                (_formatJson(map['memberList']) as List)
                    .map((e) => GroupMembersInfo.fromJson(e))
                    .toList(),
              );
              break;
            case 'onGroupCreated':
              groupManager.groupListener.groupCreated(
                map['groupId'],
              );
              break;
            case 'onGroupInfoChanged':
              groupManager.groupListener.groupInfoChanged(
                map['groupId'],
                GroupInfo.fromJson(_formatJson(map['groupInfo'])),
              );
              break;
            case 'onReceiveJoinApplication':
              groupManager.groupListener.receiveJoinApplication(
                map['groupId'],
                GroupMembersInfo.fromJson(_formatJson(map['member'])),
                map['opReason'],
              );
              break;
            case 'onApplicationProcessed':
              groupManager.groupListener.applicationProcessed(
                map['groupId'],
                GroupMembersInfo.fromJson(_formatJson(map['opUser'])),
                map['agreeOrReject'],
                map['opReason'],
              );
              break;
            // case 'onMemberInfoChanged':
            //   break;
            // case 'onGroupDismissed':
            //   break;
            // case 'onGroupRecycled':
            //   break;
            //
            // case 'onGrantAdministrator':
            //   break;
            // case 'onRevokeAdministrator':
            //   break;
            // case 'onQuitFromGroup':
            //   break;
            // case 'onReceiveRESTCustomData':
            //   break;
            // case 'onGroupAttributeChanged':
            //   break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          var id = call.arguments['data']['id'];
          switch (type) {
            case 'onRecvNewMessage':
              var value = call.arguments['data']['newMessage'];
              var msg = Message.fromJson(_formatJson(value));
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.recvNewMessage(msg);
                }
              }
              break;
            case 'onRecvMessageRevoked':
              var value = call.arguments['data']['revokedMessage'];
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.recvMessageRevoked(value);
                }
              }
              break;
            case 'onRecvC2CReadReceipt':
              var value = call.arguments['data']['haveReadMessage'];
              var l = _formatJson(value) as List;
              var list = l.map((e) => HaveReadInfo.fromJson(e)).toList();
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.recvC2CReadReceipt(list);
                }
              }
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
          UserInfo u = UserInfo.fromJson(_formatJson(data));
          switch (type) {
            case 'onBlackListAdd':
              friendshipManager.friendshipListener.blackListAdd(u);
              break;
            case 'onBlackListDeleted':
              friendshipManager.friendshipListener.blackListDeleted(u);
              break;
            case 'onFriendApplicationListAccept':
              friendshipManager.friendshipListener
                  .friendApplicationListAccept(u);
              break;
            case 'onFriendApplicationListAdded':
              friendshipManager.friendshipListener
                  .friendApplicationListAdded(u);
              break;
            case 'onFriendApplicationListDeleted':
              friendshipManager.friendshipListener
                  .friendApplicationListDeleted(u);
              break;
            case 'onFriendApplicationListReject':
              friendshipManager.friendshipListener
                  .friendApplicationListReject(u);
              break;
            case 'onFriendInfoChanged':
              friendshipManager.friendshipListener.friendInfoChanged(u);
              break;
            case 'onFriendListAdded':
              friendshipManager.friendshipListener.friendListAdded(u);
              break;
            case 'onFriendListDeleted':
              friendshipManager.friendshipListener.friendListDeleted(u);
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
  /// [ipApi] Api server ip address
  /// [ipWs] WebSocket ip address
  /// [dbPath] Data storage directory
  /// 初始化SDK
  /// [platform] 平台编号[IMPlatform]
  /// [ipApi]    SDK api地址
  /// [ipWs]     SDK websocket地址
  /// [dbPath]   SDK数据库存储目录
  Future<dynamic> initSDK({
    required int platform,
    required String ipApi,
    required String ipWs,
    required String dbPath,
    required InitSDKListener listener,
  }) {
    _initSDKListener = listener;
    return _channel
        .invokeMethod(
            'initSDK',
            _buildParam(
              {
                "platform": platform,
                "ipApi": ipApi,
                "ipWs": ipWs,
                "dbDir": dbPath
              },
            ))
        .then((value) => isInitialized = true);
  }

  @deprecated
  Future<dynamic> unInitSDK() {
    return _channel.invokeMethod('unInitSDK', _buildParam({})).then((value) {
      isInitialized = false;
      return value;
    });
  }

  /// Login sdk
  /// 登录
  Future<UserInfo> login({required String uid, required String token}) async {
    this.uid = uid;
    await _channel.invokeMethod(
      'login',
      _buildParam({'uid': uid, 'token': token}),
    );
    this.isLogined = true;
    this.uInfo = (await getUsersInfo([uid])).first;
    return uInfo;
  }

  /// Logout sdk
  /// 登出
  Future<dynamic> logout() async {
    var value = await _channel.invokeMethod('logout', _buildParam({}));
    this.isLogined = false;
    return value;
  }

  ///
  Future<int?> getLoginStatus() =>
      _channel.invokeMethod<int>('getLoginStatus', _buildParam({}));

  /// Current user id
  /// 获取当前登录用户id
  Future<String> getLoginUid() async => uid;

  /// Current user info
  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async => uInfo;

  /// Modify current user info
  /// 修改当前登录用户资料
  Future<String?> setSelfInfo(
          {String? name,
          String? icon,
          int? gender,
          String? mobile,
          String? birth,
          String? email,
          String? ex}) =>
      _channel.invokeMethod(
          'setSelfInfo',
          _buildParam({
            'uid': uid,
            'name': name,
            'icon': icon,
            'gender': gender,
            'mobile': mobile,
            'birth': birth,
            'email': email,
            'ex': ex,
          }));

  /// Query user information
  /// 查询用户信息
  Future<List<UserInfo>> getUsersInfo(List<String> uidList) => _channel
      .invokeMethod('getUsersInfo', _buildParam({'uidList': uidList}))
      .then((value) => _toList(value));

  ///
  Future enabledSDKLog({required bool enabled}) => _channel.invokeMethod(
      'setSdkLog', _buildParam({'sdkLog': enabled ? 0 : 1}));

  ///
  Future<dynamic> forceSyncLoginUerInfo(List<String> uidList) =>
      _channel.invokeMethod('forceSyncLoginUerInfo', _buildParam({}));

  ///
  // Future<dynamic> forceReConn() {
  //   return _channel.invokeMethod('forceReConn', _buildParam({}));
  // }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "imManager";
    return param;
  }

  static List<UserInfo> _toList(String value) =>
      (_formatJson(value) as List).map((e) => UserInfo.fromJson(e)).toList();

  static dynamic _formatJson(value) => jsonDecode(_printValue(value));

  static String _printValue(value) {
    return value;
  }
}
