import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/enum/listener_type.dart';
import 'package:flutter_openim_sdk/listener/int_sdk_listener.dart';
import 'package:flutter_openim_sdk/manager/im_conversation_manager.dart';
import 'package:flutter_openim_sdk/manager/im_friendship_manager.dart';
import 'package:flutter_openim_sdk/manager/im_group_manager.dart';
import 'package:flutter_openim_sdk/manager/im_message_manager.dart';
import 'package:flutter_openim_sdk/manager/im_offline_push_manager.dart';
import 'package:flutter_openim_sdk/manager/im_signaling_manager.dart';
import 'package:flutter_openim_sdk/models/conversation_info.dart';
import 'package:flutter_openim_sdk/models/message.dart';
import 'package:flutter_openim_sdk/models/user_info.dart';

class IMManager {
  MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late OfflinePushManager offlinePushManager;
  late SignalingManager signalingManager;
  late InitSDKListener _initSDKListener;

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
        /*if (call.method == ListenerType.simpleMsgListener) {
          var args = call.arguments;
          var data = args['data'];
          String type = args['type'];
          switch (type) {
            case 'onRecvC2CCustomMessage':
              break;
            case 'onRecvC2CTextMessage':
              break;
            case 'onRecvGroupCustomMessage':
              break;
            case 'onRecvGroupTextMessage':
              break;
          }
        } else */
        if (call.method == ListenerType.initSDKListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSelfInfoUpdated':
              var u = UserInfo.fromJson(_formatJson(data));
              _initSDKListener.onSelfInfoUpdated(u);
              break;
            case 'onConnectFailed':
              int? errCode = call.arguments['errCode'];
              String? errMsg = call.arguments['errMsg'];
              _initSDKListener.onConnectFailed(errCode, errMsg);
              break;
            case 'onConnecting':
              _initSDKListener.onConnecting();
              break;
            case 'onConnectSuccess':
              _initSDKListener.onConnectSuccess();
              break;
            case 'onKickedOffline':
              _initSDKListener.onKickedOffline();
              break;
            case 'onUserSigExpired':
              _initSDKListener.onUserSigExpired();
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          var args = call.arguments;
          String type = args['type'];
          Map<String, dynamic> params = args['data'] == null
              ? new Map<String, dynamic>()
              : new Map<String, dynamic>.from(args['data']);

          String groupID = params['groupID'] == null ? '' : params['groupID'];
          String opReason =
              params['opReason'] == null ? '' : params['opReason'];
          bool isAgreeJoin =
              params['isAgreeJoin'] == null ? false : params['isAgreeJoin'];
          String customData =
              params['customData'] == null ? '' : params['customData'];

          Map<String, String> groupAttributeMap =
              params['groupAttributeMap'] == null
                  ? new Map<String, String>()
                  : new Map<String, String>.from(params['groupAttributeMap']);

          List<Map<String, dynamic>> memberListMap =
              params['memberList'] == null
                  ? List.empty(growable: true)
                  : List.from(params['memberList']);

          List<Map<String, dynamic>> groupMemberChangeInfoListMap =
              params['groupMemberChangeInfoList'] == null
                  ? List.empty(growable: true)
                  : List.from(params['groupMemberChangeInfoList']);

          List<Map<String, dynamic>> groupChangeInfoListMap =
              params['groupChangeInfoList'] == null
                  ? List.empty(growable: true)
                  : List.from(params['groupChangeInfoList']);

          switch (type) {
            case 'onMemberEnter':
              break;
            case 'onMemberLeave':
              break;
            case 'onMemberInvited':
              break;
            case 'onMemberKicked':
              break;
            case 'onMemberInfoChanged':
              break;
            case 'onGroupCreated':
              break;
            case 'onGroupDismissed':
              break;
            case 'onGroupRecycled':
              break;
            case 'onGroupInfoChanged':
              break;
            case 'onReceiveJoinApplication':
              break;
            case 'onApplicationProcessed':
              break;
            case 'onGrantAdministrator':
              break;
            case 'onRevokeAdministrator':
              break;
            case 'onQuitFromGroup':
              break;
            case 'onReceiveRESTCustomData':
              break;
            case 'onGroupAttributeChanged':
              break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          var id = call.arguments['data']['id'];
          var msg =
              Message.fromJson(_formatJson(call.arguments['data']['message']));
          switch (type) {
            case 'onRecvNewMessage':
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.onRecvNewMessage(msg);
                }
              }
              break;
            case 'onRecvMessageRevoked':
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.onRecvMessageRevoked(msg);
                }
              }
              break;
            case 'onRecvC2CReadReceipt':
              for (var listener in messageManager.advancedMsgListeners) {
                if (listener.id == id) {
                  listener.onRecvC2CReadReceipt(msg);
                }
              }
              break;
          }
        } else if (call.method == ListenerType.messageProgressListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          String msgID = data['clientMsgID'] ?? '';
          int progress = data['progress'] ?? 100;
          switch (type) {
            case 'onProgress':
              messageManager.msgSendProgressListener?.onProgress(
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
              conversationManager.conversationListener.onSyncServerStart();
              break;
            case 'onSyncServerFinish':
              conversationManager.conversationListener.onSyncServerFinish();
              break;

            case 'onSyncServerFailed':
              conversationManager.conversationListener.onSyncServerFailed();
              break;
            case 'onNewConversation':
              List<ConversationInfo> list = List.empty(growable: true);
              if (null != data) {
                list = (_formatJson(data) as List)
                    .map((e) => ConversationInfo.fromJson(e))
                    .toList();
              }
              conversationManager.conversationListener.onNewConversation(list);
              break;
            case 'onConversationChanged':
              List<ConversationInfo> list = List.empty(growable: true);
              if (null != data) {
                list = (_formatJson(data) as List)
                    .map((e) => ConversationInfo.fromJson(e))
                    .toList();
              }
              conversationManager.conversationListener
                  .onConversationChanged(list);
              break;
            case 'onTotalUnreadMessageCountChanged':
              conversationManager.conversationListener
                  .onTotalUnreadMessageCountChanged(data ?? 0);
              break;
          }
        } else if (call.method == ListenerType.friendListener) {
          // int errCode = call.arguments['errCode'];
          // String errMsg = call.arguments['errMsg'];
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onBlackListAdd':
              friendshipManager.friendshipListener.onBlackListAdd(data);
              break;
            case 'onBlackListDeleted':
              friendshipManager.friendshipListener.onBlackListDeleted(data);
              break;
            case 'onFriendApplicationListAccept':
              friendshipManager.friendshipListener
                  .onFriendApplicationListAccept(data);
              break;
            case 'onFriendApplicationListAdded':
              friendshipManager.friendshipListener
                  .onFriendApplicationListAdded(data);
              break;
            case 'onFriendApplicationListDeleted':
              friendshipManager.friendshipListener
                  .onFriendApplicationListDeleted(data);
              break;
            case 'onFriendApplicationListReject':
              friendshipManager.friendshipListener
                  .onFriendApplicationListReject(data);
              break;
            case 'onFriendInfoChanged':
              friendshipManager.friendshipListener.onFriendInfoChanged(data);
              break;
            case 'onFriendListAdded':
              friendshipManager.friendshipListener.onFriendListAdded(data);
              break;
            case 'onFriendListDeleted':
              friendshipManager.friendshipListener.onFriendListDeleted(data);
              break;
          }
        }
        /*else if (call.method == 'logFromSwift') {
          var data = call.arguments["data"];
          var msg = call.arguments["msg"];
        } else if (call.method == ListenerType.signalingListener) {
          var args = call.arguments;
          String type = args['type'];
          Map<String, dynamic> params = args['data'];
          String inviteID =
              params['inviteID'] == null ? '' : params['inviteID'];
          String inviter = params['inviter'] == null ? '' : params['inviter'];
          String groupID = params['groupID'] == null ? '' : params['groupID'];
          List<String>? inviteeList = params['inviteeList'] == null
              ? null
              : List.from(params['inviteeList']);
          String data = params['data'] == null ? '' : params['data'];
          String invitee = params['invitee'] == null ? '' : params['invitee'];

          switch (type) {
            case 'onReceiveNewInvitation':
              break;
            case 'onInviteeAccepted':
              break;
            case 'onInviteeRejected':
              break;
            case 'onInvitationCancelled':
              break;
            case 'onInvitationTimeout':
              break;
          }
        }*/
      } catch (err) {
        print(
            "回调失败了，数据类型异常。$err ${call.method} ${call.arguments['type']} ${call.arguments['data']}");
      }
      return Future.value(null);
    });
  }

  Future<dynamic> initSDK({
    required int platform,
    required String ipApi,
    required String ipWs,
    required String dbPath,
    required InitSDKListener listener,
  }) {
    _initSDKListener = listener;
    return _channel.invokeMethod(
      'initSDK',
      _buildParam(
        {"platform": platform, "ipApi": ipApi, "ipWs": ipWs, "dbDir": dbPath},
      ),
    );
  }

  Future<dynamic> unInitSDK() {
    return _channel.invokeMethod('unInitSDK', _buildParam({}));
  }

  Future<dynamic> login({required String uid, required String token}) {
    return _channel.invokeMethod(
      'login',
      _buildParam({'uid': uid, 'token': token}),
    );
  }

  Future<dynamic> logout() {
    return _channel.invokeMethod('logout', _buildParam({}));
  }

  Future<int?> getLoginStatus() {
    return _channel.invokeMethod<int>('getLoginStatus', _buildParam({}));
  }

  Future<String?> getLoginUid() {
    return _channel.invokeMethod<String>('getLoginUid', _buildParam({}));
  }

  Future<String?> setSelfInfo(UserInfo info) {
    return _channel.invokeMethod('setSelfInfo', _buildParam(info.toJson()));
    // .then((value) => UserInfo.fromJson(value));
  }

  Future<List<UserInfo>> getUsersInfo(List<String> uidList) {
    return _channel
        .invokeMethod('getUsersInfo', _buildParam({'uidList': uidList}))
        .then((value) => _toList(value));
  }

  Future<dynamic> forceSyncLoginUerInfo(List<String> uidList) {
    return _channel.invokeMethod('forceSyncLoginUerInfo', _buildParam({}));
  }

  ///@nodoc
  static Map _buildParam(Map param) {
    param["ManagerName"] = "imManager";
    return param;
  }

  static List<UserInfo> _toList(String value) =>
      (_formatJson(value) as List).map((e) => UserInfo.fromJson(e)).toList();

  ///@nodoc
  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
