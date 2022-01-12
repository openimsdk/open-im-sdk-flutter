import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class FriendshipManager {
  MethodChannel _channel;
  late FriendshipListener friendshipListener;

  FriendshipManager(this._channel);

  /// Set up a friend relationship listener
  /// 好友关系监听
  Future setFriendshipListener(FriendshipListener listener) {
    this.friendshipListener = listener;
    return _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  /// Get friend info by user id
  /// 查询好友信息
  Future<List<UserInfo>> getFriendsInfo({required List<String> uidList}) =>
      _channel
          .invokeMethod('getFriendsInfo', _buildParam({"uidList": uidList}))
          .then((value) => _toList(value));

  /// Send an friend application
  /// 发送一个好友请求
  Future<dynamic> addFriend({required String uid, required String reason}) =>
      _channel.invokeMethod(
          'addFriend', _buildParam({"uid": uid, "reqMessage": reason}));

  /// Get all friend application, sent to you by others
  /// 获取所有好友申请
  Future<List<UserInfo>> getFriendApplicationList() => _channel
      .invokeMethod('getFriendApplicationList', _buildParam({}))
      .then((value) => _toList(value));

  /// Find all friends including those who have been added to the blacklist
  /// 获取好友列表包含已拉入黑名单的好友
  Future<List<UserInfo>> getFriendList() => _channel
      .invokeMethod('getFriendList', _buildParam({}))
      .then((value) => _toList(value));

  /// Find all friends including those who have been added to the blacklist
  /// 获取好友列表
  Future<List<dynamic>> getFriendListMap() => _channel
      .invokeMethod('getFriendList', _buildParam({}))
      .then((value) => _toListMap(value));

  /// Modify friend information, only [comment] can be modified
  /// 设置好友备注
  Future<dynamic> setFriendInfo(
          {required String uid, required String comment}) =>
      _channel.invokeMethod(
          'setFriendInfo',
          _buildParam({
            'uid': uid,
            'comment': comment,
          }));

  /// Add friends to blacklist
  /// 加入黑名单
  Future<dynamic> addToBlackList({required String uid}) =>
      _channel.invokeMethod('addToBlackList', _buildParam({"uid": uid}));

  /// Find all blacklist
  /// 获取黑名单列表
  Future<List<UserInfo>> getBlackList() => _channel
      .invokeMethod('getBlackList', _buildParam({}))
      .then((value) => _toList(value));

  /// Remove from blacklist
  /// 从黑名单移除
  Future<dynamic> deleteFromBlackList({required String uid}) =>
      _channel.invokeMethod('deleteFromBlackList', _buildParam({"uid": uid}));

  /// Determine if there is a friendship by userId
  /// 检查友好关系
  Future<List<UserInfo>> checkFriend(List<String> uidList) => _channel
      .invokeMethod('checkFriend', _buildParam({'uidList': uidList}))
      .then((value) => _toList(value));

  /// Dissolve friendship from friend list
  /// 删除好友
  Future<dynamic> deleteFromFriendList({required String uid}) =>
      _channel.invokeMethod('deleteFromFriendList', _buildParam({"uid": uid}));

  /// Accept application of be friend
  /// 接受好友请求
  Future<dynamic> acceptFriendApplication({required String uid}) => _channel
      .invokeMethod('acceptFriendApplication', _buildParam({"uid": uid}));

  /// Refuse application of be friend
  /// 拒绝好友请求
  Future<dynamic> refuseFriendApplication({required String uid}) => _channel
      .invokeMethod('refuseFriendApplication', _buildParam({"uid": uid}));

  ///
  // Future<dynamic> forceSyncFriendApplication() {
  //   return _channel.invokeMethod('forceSyncFriendApplication', _buildParam({}));
  // }

  ///
  // Future<dynamic> forceSyncFriend() {
  //   return _channel.invokeMethod('forceSyncFriend', _buildParam({}));
  // }

  ///
  // Future<dynamic> forceSyncBlackList() {
  //   return _channel.invokeMethod('forceSyncBlackList', _buildParam({}));
  // }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "friendshipManager";
    return param;
  }

  static List<UserInfo> _toList(String? value) {
    var list = _formatJson(value);
    if (null == list) return <UserInfo>[];
    return (list as List).map((e) => UserInfo.fromJson(e)).toList();
  }

  static List<dynamic> _toListMap(String? value) {
    var list = _formatJson(value);
    return list;
  }

  // static UserInfo _toObj(String value) => UserInfo.fromJson(_formatJson(value));

  static dynamic _formatJson(value) => jsonDecode(_printValue(value));

  static String _printValue(value) {
    return value;
  }
}
