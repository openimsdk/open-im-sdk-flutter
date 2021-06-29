import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/listener/friendship_listener.dart';
import 'package:flutter_openim_sdk/models/user_info.dart';

class FriendshipManager {
  MethodChannel _channel;
  late FriendshipListener friendshipListener;

  FriendshipManager(this._channel);

  void setFriendshipListener(FriendshipListener listener) {
    this.friendshipListener = listener;
    _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  Future<List<UserInfo>> getFriendsInfo({required List<String> uidList}) {
    return _channel
        .invokeMethod('getFriendsInfo', _buildParam({"uidList": uidList}))
        .then((value) => _toList(value));
  }

  Future<dynamic> addFriend({required String uid, required String reason}) {
    return _channel.invokeMethod(
        'addFriend', _buildParam({"uid": uid, "reqMessage": reason}));
  }

  Future<List<UserInfo>> getFriendApplicationList() {
    return _channel
        .invokeMethod('getFriendApplicationList', _buildParam({}))
        .then((value) => _toList(value));
  }

  Future<List<UserInfo>> getFriendList() {
    return _channel
        .invokeMethod('getFriendList', _buildParam({}))
        .then((value) => _toList(value));
  }

  Future<dynamic> setFriendInfo({required UserInfo info}) {
    return _channel.invokeMethod('setFriendInfo', _buildParam(info.toJson()));
  }

  Future<dynamic> addToBlackList({required String uid}) {
    return _channel.invokeMethod('addToBlackList', _buildParam({"uid": uid}));
  }

  Future<List<UserInfo>> getBlackList() {
    return _channel
        .invokeMethod('getBlackList', _buildParam({}))
        .then((value) => _toList(value));
  }

  Future<dynamic> deleteFromBlackList({required String uid}) {
    return _channel.invokeMethod(
        'deleteFromBlackList', _buildParam({"uid": uid}));
  }

  Future<List<UserInfo>> checkFriend(List<String> uidList) {
    return _channel
        .invokeMethod('checkFriend', _buildParam({'uidList': uidList}))
        .then((value) => _toList(value));
  }

  Future<dynamic> deleteFromFriendList({required String uid}) {
    return _channel.invokeMethod(
        'deleteFromFriendList', _buildParam({"uid": uid}));
  }

  Future<dynamic> acceptFriendApplication({required String uid}) {
    return _channel.invokeMethod(
        'acceptFriendApplication', _buildParam({"uid": uid}));
  }

  Future<dynamic> refuseFriendApplication({required String uid}) {
    return _channel.invokeMethod(
        'refuseFriendApplication', _buildParam({"uid": uid}));
  }

  Future<dynamic> forceSyncFriendApplication() {
    return _channel.invokeMethod('forceSyncFriendApplication', _buildParam({}));
  }

  Future<dynamic> forceSyncFriend() {
    return _channel.invokeMethod('forceSyncFriend', _buildParam({}));
  }

  Future<dynamic> forceSyncBlackList() {
    return _channel.invokeMethod('forceSyncBlackList', _buildParam({}));
  }

  ///@nodoc
  static Map _buildParam(Map param) {
    param["ManagerName"] = "friendshipManager";
    return param;
  }

  static List<UserInfo> _toList(String? value) {
    var list = _formatJson(value);
    if (null == list) return <UserInfo>[];
    return (list as List).map((e) => UserInfo.fromJson(e)).toList();
  }

  static UserInfo _toObj(String value) => UserInfo.fromJson(_formatJson(value));

  ///@nodoc
  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
