import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class IMManager {
  MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late OfflinePushManager offlinePushManager;
  late SignalingManager signalingManager;
  late InitSDKListener _initSDKListener;
  late String uid;
  late UserInfo uInfo;
  bool isInitialized = false;

  IMManager(this._channel) {
    conversationManager = ConversationManager(_channel);
    friendshipManager = FriendshipManager(_channel);
    messageManager = MessageManager(_channel);
    groupManager = GroupManager(_channel);
    offlinePushManager = OfflinePushManager(_channel);
    signalingManager = SignalingManager(_channel);
    addNativeCallback(_channel);
  }

  void addNativeCallback(MethodChannel _channel) {
    _channel.setMethodCallHandler((call) {
      try {
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
          var value = call.arguments['data']['message'];
          switch (type) {
            case 'onRecvNewMessage':
              var msg = Message.fromJson(_formatJson(value));
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.recvNewMessage(msg);
                }
              }
              break;
            case 'onRecvMessageRevoked':
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.recvMessageRevoked(value);
                }
              }
              break;
            case 'onRecvC2CReadReceipt':
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

  /// init sdk
  ///
  /// @params platform[IMPlatform]
  /// @params ipApi: api server ip address
  /// @params ipWs: websocket ip address
  /// @params dbPath: data storage directory
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
        .then((value) {
      isInitialized = true;
      return value;
    });
  }

  ///
  Future<dynamic> unInitSDK() {
    return _channel.invokeMethod('unInitSDK', _buildParam({})).then((value) {
      isInitialized = false;
      return value;
    });
  }

  /// login sdk
  ///
  Future<dynamic> login({required String uid, required String token}) async {
    this.uid = uid;
    return _channel.invokeMethod(
      'login',
      _buildParam({'uid': uid, 'token': token}),
    );
  }

  ///
  Future<dynamic> logout() {
    return _channel.invokeMethod('logout', _buildParam({}));
  }

  ///
  Future<int?> getLoginStatus() {
    return _channel.invokeMethod<int>('getLoginStatus', _buildParam({}));
  }

  ///
  Future<String?> getLoginUid() {
    return Future.value(uid);
    // return _channel.invokeMethod<String>('getLoginUid', _buildParam({}));
  }

  ///
  Future<UserInfo> getLoginUserInfo() {
    return getUsersInfo([uid]).then((list) => uInfo = list[0]);
  }

  ///
  Future<String?> setSelfInfo(
      {required String uid,
      String? name,
      String? icon,
      int? gender,
      String? mobile,
      String? birth,
      String? email,
      String? ex}) {
    return _channel.invokeMethod(
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
    // .then((value) => UserInfo.fromJson(value));
  }

  ///
  Future<List<UserInfo>> getUsersInfo(List<String> uidList) {
    return _channel
        .invokeMethod('getUsersInfo', _buildParam({'uidList': uidList}))
        .then((value) => _toList(value));
  }

  ///
  Future<dynamic> forceSyncLoginUerInfo(List<String> uidList) {
    return _channel.invokeMethod('forceSyncLoginUerInfo', _buildParam({}));
  }

  ///
  Future<dynamic> forceReConn() {
    return _channel.invokeMethod('forceReConn', _buildParam({}));
  }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "imManager";
    return param;
  }

  static List<UserInfo> _toList(String value) =>
      (_formatJson(value) as List).map((e) => UserInfo.fromJson(e)).toList();

  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
