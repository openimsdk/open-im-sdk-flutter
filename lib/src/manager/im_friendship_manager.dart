import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class FriendshipManager {
  MethodChannel _channel;
  late FriendshipListener friendshipListener;

  FriendshipManager(this._channel);

  /// listener[FriendshipListener]
  ///
  Future setFriendshipListener(FriendshipListener listener) {
    this.friendshipListener = listener;
    return _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  /// get friend info by userid
  ///
  Future<List<UserInfo>> getFriendsInfo({required List<String> uidList}) {
    return _channel
        .invokeMethod('getFriendsInfo', _buildParam({"uidList": uidList}))
        .then((value) => _toList(value));
  }

  /// send an friend application
  ///
  Future<dynamic> addFriend({required String uid, required String reason}) {
    return _channel.invokeMethod(
        'addFriend', _buildParam({"uid": uid, "reqMessage": reason}));
  }

  /// get all friend application
  /// including those initiated by you and sent to you by others
  Future<List<UserInfo>> getFriendApplicationList() {
    return _channel
        .invokeMethod('getFriendApplicationList', _buildParam({}))
        .then((value) => _toList(value));
  }

  /// find all friends
  ///
  Future<List<UserInfo>> getFriendList() {
    return _channel
        .invokeMethod('getFriendList', _buildParam({}))
        .then((value) => _toList(value));
  }

  Future<List<dynamic>> getFriendListMap() {
    return _channel
        .invokeMethod('getFriendList', _buildParam({}))
        .then((value) => _toListMap(value));
  }

  /// modify friend information, only [comment] can be modified
  ///
  Future<dynamic> setFriendInfo(
      {required String uid, required String comment}) {
    return _channel.invokeMethod(
        'setFriendInfo',
        _buildParam({
          'uid': uid,
          'comment': comment,
        }));
  }

  /// add to blacklist
  ///
  Future<dynamic> addToBlackList({required String uid}) {
    return _channel.invokeMethod('addToBlackList', _buildParam({"uid": uid}));
  }

  /// find all blacklist
  ///
  Future<List<UserInfo>> getBlackList() {
    return _channel
        .invokeMethod('getBlackList', _buildParam({}))
        .then((value) => _toList(value));
  }

  /// remove from blacklist
  ///
  Future<dynamic> deleteFromBlackList({required String uid}) {
    return _channel.invokeMethod(
        'deleteFromBlackList', _buildParam({"uid": uid}));
  }

  /// determine if there is a friendship by userId
  ///
  Future<List<UserInfo>> checkFriend(List<String> uidList) {
    return _channel
        .invokeMethod('checkFriend', _buildParam({'uidList': uidList}))
        .then((value) => _toList(value));
  }

  /// dissolve friendship from friend list
  ///
  Future<dynamic> deleteFromFriendList({required String uid}) {
    return _channel.invokeMethod(
        'deleteFromFriendList', _buildParam({"uid": uid}));
  }

  /// accept application of be friend
  ///
  Future<dynamic> acceptFriendApplication({required String uid}) {
    return _channel.invokeMethod(
        'acceptFriendApplication', _buildParam({"uid": uid}));
  }

  /// refuse application of be friend
  ///
  Future<dynamic> refuseFriendApplication({required String uid}) {
    return _channel.invokeMethod(
        'refuseFriendApplication', _buildParam({"uid": uid}));
  }

  ///
  ///
  Future<dynamic> forceSyncFriendApplication() {
    return _channel.invokeMethod('forceSyncFriendApplication', _buildParam({}));
  }

  ///
  ///
  Future<dynamic> forceSyncFriend() {
    return _channel.invokeMethod('forceSyncFriend', _buildParam({}));
  }

  ///
  Future<dynamic> forceSyncBlackList() {
    return _channel.invokeMethod('forceSyncBlackList', _buildParam({}));
  }

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

  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
