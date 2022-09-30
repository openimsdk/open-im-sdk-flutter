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
  late SignalingManager signalingManager;
  late WorkMomentsManager workMomentsManager;
  late OrganizationManager organizationManager;

  late OnConnectListener _connectListener;
  late String uid;
  late UserInfo uInfo;
  bool isLogined = false;
  String? token;
  String? _objectStorage;

  IMManager(this._channel) {
    conversationManager = ConversationManager(_channel);
    friendshipManager = FriendshipManager(_channel);
    messageManager = MessageManager(_channel);
    groupManager = GroupManager(_channel);
    userManager = UserManager(_channel);
    // offlinePushManager = OfflinePushManager(_channel);
    signalingManager = SignalingManager(_channel);
    workMomentsManager = WorkMomentsManager(_channel);
    organizationManager = OrganizationManager(_channel);
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
              userManager.listener.selfInfoUpdated(uInfo);
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onGroupApplicationAccepted':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationAccepted(i);
              break;
            case 'onGroupApplicationAdded':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationAdded(i);
              break;
            case 'onGroupApplicationDeleted':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationDeleted(i);
              break;
            case 'onGroupApplicationRejected':
              final i = Utils.toObj(
                  data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationRejected(i);
              break;
            case 'onGroupInfoChanged':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.groupInfoChanged(i);
              break;
            case 'onGroupMemberAdded':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberAdded(i);
              break;
            case 'onGroupMemberDeleted':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberDeleted(i);
              break;
            case 'onGroupMemberInfoChanged':
              final i =
                  Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberInfoChanged(i);
              break;
            case 'onJoinedGroupAdded':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.joinedGroupAdded(i);
              break;
            case 'onJoinedGroupDeleted':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.joinedGroupDeleted(i);
              break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          // var id = call.arguments['data']['id'];
          switch (type) {
            case 'onRecvNewMessage':
              var value = call.arguments['data']['newMessage'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.msgListener.recvNewMessage(msg);
              break;
            case 'onRecvMessageRevoked':
              var msgID = call.arguments['data']['revokedMessage'];
              messageManager.msgListener.recvMessageRevoked(msgID);
              break;
            case 'onRecvC2CReadReceipt':
              var value = call.arguments['data']['c2cMessageReadReceipt'];
              var list =
                  Utils.toList(value, (map) => ReadReceiptInfo.fromJson(map));
              messageManager.msgListener.recvC2CMessageReadReceipt(list);
              break;
            case 'onRecvGroupReadReceipt':
              var value = call.arguments['data']['groupMessageReadReceipt'];
              var list =
                  Utils.toList(value, (map) => ReadReceiptInfo.fromJson(map));
              messageManager.msgListener.recvGroupMessageReadReceipt(list);
              break;
            case 'onNewRecvMessageRevoked':
              var value = call.arguments['data']['revokedMessageV2'];
              var info = Utils.toObj(value, (map) => RevokedInfo.fromJson(map));
              messageManager.msgListener.recvMessageRevokedV2(info);
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
              conversationManager.listener.syncServerStart();
              break;
            case 'onSyncServerFinish':
              conversationManager.listener.syncServerFinish();
              break;

            case 'onSyncServerFailed':
              conversationManager.listener.syncServerFailed();
              break;
            case 'onNewConversation':
              var list =
                  Utils.toList(data, (map) => ConversationInfo.fromJson(map));
              conversationManager.listener.newConversation(list);
              break;
            case 'onConversationChanged':
              var list =
                  Utils.toList(data, (map) => ConversationInfo.fromJson(map));
              conversationManager.listener.conversationChanged(list);
              break;
            case 'onTotalUnreadMessageCountChanged':
              conversationManager.listener
                  .totalUnreadMessageCountChanged(data ?? 0);
              break;
          }
        } else if (call.method == ListenerType.friendListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];

          switch (type) {
            case 'onBlacklistAdded':
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.listener.blacklistAdded(u);
              break;
            case 'onBlacklistDeleted':
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.listener.blacklistDeleted(u);
              break;
            case 'onFriendApplicationAccepted':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationAccepted(u);
              break;
            case 'onFriendApplicationAdded':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationAdded(u);
              break;
            case 'onFriendApplicationDeleted':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationDeleted(u);
              break;
            case 'onFriendApplicationRejected':
              final u = Utils.toObj(
                  data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationRejected(u);
              break;
            case 'onFriendInfoChanged':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendInfoChanged(u);
              break;
            case 'onFriendAdded':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendAdded(u);
              break;
            case 'onFriendDeleted':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendDeleted(u);
              break;
          }
        } else if (call.method == ListenerType.signalingListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          dynamic info;
          switch (type) {
            case 'onRoomParticipantConnected':
            case 'onRoomParticipantDisconnected':
              info = Utils.toObj(data, (map) => RoomCallingInfo.fromJson(map));
              break;
            default:
              info = Utils.toObj(data, (map) => SignalingInfo.fromJson(map));
              break;
          }
          switch (type) {
            case 'onInvitationCancelled':
              signalingManager.listener.invitationCancelled(info);
              break;
            case 'onInvitationTimeout':
              signalingManager.listener.invitationTimeout(info);
              break;
            case 'onInviteeAccepted':
              signalingManager.listener.inviteeAccepted(info);
              break;
            case 'onInviteeRejected':
              signalingManager.listener.inviteeRejected(info);
              break;
            case 'onReceiveNewInvitation':
              signalingManager.listener.receiveNewInvitation(info);
              break;
            case 'onInviteeAcceptedByOtherDevice':
              signalingManager.listener.inviteeAcceptedByOtherDevice(info);
              break;
            case 'onInviteeRejectedByOtherDevice':
              signalingManager.listener.inviteeRejectedByOtherDevice(info);
              break;
            case 'onHangUp':
              signalingManager.listener.hangup(info);
              break;
            case 'onRoomParticipantConnected':
              signalingManager.listener.roomParticipantConnected(info);
              break;
            case 'onRoomParticipantDisconnected':
              signalingManager.listener.roomParticipantDisconnected(info);
              break;
          }
        } else if (call.method == ListenerType.workMomentsListener) {
          String type = call.arguments['type'];
          switch (type) {
            case 'OnRecvNewNotification':
              workMomentsManager.listener.recvNewNotification();
              break;
          }
        } else if (call.method == ListenerType.organizationListener) {
          String type = call.arguments['type'];
          switch (type) {
            case 'onOrganizationUpdated':
              organizationManager.listener.organizationUpdated();
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

  /// 初始化SDK
  /// [platform]  平台编号[IMPlatform]
  /// [apiAddr]   SDK api地址
  /// [wsAddr]    SDK websocket地址
  /// [dataDir]   SDK数据库存储目录
  /// [objectStorage] 存储对象 cos/minio
  /// [logLevel] 日志 1不打印
  Future<dynamic> initSDK({
    required int platform,
    required String apiAddr,
    required String wsAddr,
    required String dataDir,
    required OnConnectListener listener,
    int logLevel = 6,
    String objectStorage = 'cos',
    String? encryptionKey,
    String? operationID,
  }) {
    this._connectListener = listener;
    this._objectStorage = objectStorage;
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
            "encryption_key": encryptionKey,
            "operationID": Utils.checkOperationID(operationID),
          },
        ));
  }

  /// 反初始化SDK
  Future<dynamic> unInitSDK() {
    return _channel.invokeMethod('unInitSDK', _buildParam({}));
  }

  /// 登录
  /// [uid] 用户id
  /// [token] 登录token，从业务服务器上获取
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
    this.token = token;
    this.uInfo = await userManager.getSelfUserInfo();
    return uInfo;
  }

  /// 登出
  Future<dynamic> logout({String? operationID}) async {
    var value = await _channel.invokeMethod(
        'logout',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }));
    this.isLogined = false;
    this.token = null;
    return value;
  }

  /// 获取登录状态
  Future<int?> getLoginStatus() =>
      _channel.invokeMethod<int>('getLoginStatus', _buildParam({}));

  /// 获取当前登录用户id
  Future<String> getLoginUserID() async => uid;

  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async => uInfo;

  /// 从后台回到前台立刻唤醒
  Future wakeUp({String? operationID}) => _channel.invokeMethod(
      'wakeUp',
      _buildParam({
        'operationID': Utils.checkOperationID(operationID),
      }));

  /// 上传图片到服务器
  /// [path] 图片路径
  /// [token] im token
  /// [objectStorage] 存储对象 cos/minio
  Future uploadImage({
    required String path,
    String? token,
    String? objectStorage,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'uploadImage',
          _buildParam({
            'path': path,
            'token': token ?? this.token,
            'obj': objectStorage ?? this._objectStorage,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 更新firebase客户端注册token
  /// [fcmToken] firebase token
  Future updateFcmToken({
    required String fcmToken,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'updateFcmToken',
          _buildParam({
            'fcmToken': fcmToken,
            'operationID': Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "imManager";
    return param;
  }
}
