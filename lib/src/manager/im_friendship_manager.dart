import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class FriendshipManager {
  MethodChannel _channel;
  late OnFriendshipListener friendshipListener;

  FriendshipManager(this._channel);

  /// Set up a friend relationship listener
  /// 好友关系监听
  Future setFriendshipListener(OnFriendshipListener listener) {
    this.friendshipListener = listener;
    return _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  /// Get friend info by user id
  /// 查询好友信息
  Future<List<UserInfo>> getFriendsInfo({
    required List<String> uidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getFriendsInfo',
              _buildParam({
                "uidList": uidList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// Send an friend application
  /// 发送一个好友请求
  Future<dynamic> addFriend({
    required String uid,
    String? reason,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'addFriend',
          _buildParam({
            "toUserID": uid,
            "reqMsg": reason,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Get someone's request to add me as a friend
  /// 获取别人加我为好友的申请
  Future<List<FriendApplicationInfo>> getRecvFriendApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getRecvFriendApplicationList',
              _buildParam({
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)));

  /// Get friend requests from me
  /// 获取我发出的好友申请
  Future<List<FriendApplicationInfo>> getSendFriendApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getSendFriendApplicationList',
              _buildParam({
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)));

  /// Find all friends including those who have been added to the blacklist
  /// 获取好友列表包含已拉入黑名单的好友
  Future<List<UserInfo>> getFriendList({String? operationID}) => _channel
      .invokeMethod(
          'getFriendList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// Find all friends including those who have been added to the blacklist
  /// 获取好友列表
  Future<List<dynamic>> getFriendListMap({String? operationID}) => _channel
      .invokeMethod(
          'getFriendList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toListMap(value));

  /// Modify friend remark name
  /// 设置好友备注
  Future<dynamic> setFriendRemark({
    required String uid,
    required String remark,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setFriendRemark',
          _buildParam({
            'toUserID': uid,
            'remark': remark,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Add friends to blacklist
  /// 加入黑名单
  Future<dynamic> addBlacklist({
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'addBlacklist',
          _buildParam({
            "uid": uid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Find all blacklist
  /// 获取黑名单列表
  Future<List<UserInfo>> getBlacklist({String? operationID}) => _channel
      .invokeMethod(
          'getBlacklist',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// Remove from blacklist
  /// 从黑名单移除
  Future<dynamic> removeBlacklist({
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'removeBlacklist',
          _buildParam({
            "uid": uid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Determine if there is a friendship by userId
  /// 检查友好关系
  Future<List<FriendshipInfo>> checkFriend({
    required List<String> uidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'checkFriend',
              _buildParam({
                'uidList': uidList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (v) => FriendshipInfo.fromJson(v)));

  /// Dissolve friendship from friend list
  /// 删除好友
  Future<dynamic> deleteFriend({
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteFriend',
          _buildParam({
            "uid": uid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Accept application of be friend
  /// 接受好友请求
  Future<dynamic> acceptFriendApplication({
    required String uid,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'acceptFriendApplication',
          _buildParam({
            "toUserID": uid,
            "handleMsg": handleMsg,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Refuse application of be friend
  /// 拒绝好友请求
  Future<dynamic> refuseFriendApplication({
    required String uid,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'refuseFriendApplication',
          _buildParam({
            "toUserID": uid,
            "handleMsg": handleMsg,
            "operationID": Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "friendshipManager";
    return param;
  }
}
