import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

import '../models/update_req.dart';

class FriendshipManager {
  MethodChannel _channel;
  late OnFriendshipListener listener;

  FriendshipManager(this._channel);

  /// Friend Relationship Listener
  Future setFriendshipListener(OnFriendshipListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  /// Query Friend Information
  /// [userIDList] List of user IDs
  Future<List<FriendInfo>> getFriendsInfo({
    required List<String> userIDList,
    bool filterBlack = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getFriendsInfo',
              _buildParam({
                "userIDList": userIDList,
                'filterBlack': filterBlack,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)));

  /// Send a Friend Request, the other party needs to accept the request to become friends.
  /// [userID] User ID to be invited
  /// [reason] Remark description
  Future<dynamic> addFriend({
    required String userID,
    String? reason,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'addFriend',
          _buildParam({
            "toUserID": userID,
            "reqMsg": reason,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Get Friend Requests Sent to Me
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsRecipient({String? operationID}) => _channel
      .invokeMethod(
          'getFriendApplicationListAsRecipient',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)));

  /// Get Friend Requests Sent by Me
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsApplicant({String? operationID}) => _channel
      .invokeMethod(
          'getFriendApplicationListAsApplicant',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)));

  /// Get Friend List, including friends who have been put into the blacklist
  Future<List<FriendInfo>> getFriendList({
    String? operationID,
    bool filterBlack = false,
  }) =>
      _channel
          .invokeMethod(
              'getFriendList',
              _buildParam({
                'filterBlack': filterBlack,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)));

  Future<List<FriendInfo>> getFriendListPage({
    bool filterBlack = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getFriendListPage',
              _buildParam({
                'offset': offset,
                'count': count,
                'filterBlack': filterBlack,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)));

  /// Get Friend List, including friends who have been put into the blacklist (returns a map)
  Future<List<dynamic>> getFriendListMap({String? operationID}) => _channel
      .invokeMethod(
          'getFriendList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toListMap(value));

  Future<List<dynamic>> getFriendListPageMap({
    bool filterBlack = false,
    String? operationID,
    int offset = 0,
    int count = 40,
  }) =>
      _channel
          .invokeMethod(
              'getFriendListPage',
              _buildParam({
                'offset': offset,
                'count': count,
                'filterBlack': filterBlack,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toListMap(value));

  /// Set Friend's Remark
  /// [userID] Friend's userID
  /// [remark] Friend's remark
  @Deprecated('Use [updateFriends] instead')
  Future<dynamic> setFriendRemark({
    required String userID,
    required String remark,
    String? operationID,
  }) {
    final req = UpdateFriendsReq(friendUserIDs: [userID], remark: remark);

    return updateFriends(req, operationID: operationID);
  }

  /// Add to Blacklist
  /// [userID] Friend's ID to be added to the blacklist
  Future<dynamic> addBlacklist({
    required String userID,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'addBlacklist',
          _buildParam({
            "userID": userID,
            "ex": ex,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Get Blacklist
  Future<List<BlacklistInfo>> getBlacklist({String? operationID}) => _channel
      .invokeMethod(
          'getBlacklist',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => BlacklistInfo.fromJson(v)));

  /// Remove from Blacklist
  /// [userID] User ID
  Future<dynamic> removeBlacklist({
    required String userID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'removeBlacklist',
          _buildParam({
            "userID": userID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Check Friendship Status
  /// [userIDList] List of user IDs
  Future<List<FriendshipInfo>> checkFriend({
    required List<String> userIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'checkFriend',
              _buildParam({
                'userIDList': userIDList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => FriendshipInfo.fromJson(v)));

  /// Delete Friend
  /// [userID] User ID
  Future<dynamic> deleteFriend({
    required String userID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteFriend',
          _buildParam({
            "userID": userID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Accept Friend Request
  /// [userID] User ID
  /// [handleMsg] Remark description
  Future<dynamic> acceptFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'acceptFriendApplication',
          _buildParam({
            "toUserID": userID,
            "handleMsg": handleMsg,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Reject Friend Request
  /// [userID] User ID
  /// [handleMsg] Remark description
  Future<dynamic> refuseFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'refuseFriendApplication',
          _buildParam({
            "toUserID": userID,
            "handleMsg": handleMsg,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Search for Friends
  /// [keywordList] Search keywords, currently supports only one keyword search, cannot be empty
  /// [isSearchUserID] Whether to search for friend IDs with keywords (note: cannot be false at the same time), defaults to false if empty
  /// [isSearchNickname] Whether to search by nickname with keywords, defaults to false if empty
  /// [isSearchRemark] Whether to search by remark name with keywords, defaults to false if empty
  Future<List<SearchFriendsInfo>> searchFriends({
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchNickname = false,
    bool isSearchRemark = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchFriends',
              _buildParam({
                'searchParam': {
                  'keywordList': keywordList,
                  'isSearchUserID': isSearchUserID,
                  'isSearchNickname': isSearchNickname,
                  'isSearchRemark': isSearchRemark,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (map) => SearchFriendsInfo.fromJson(map)));

  @Deprecated('Use [updateFriends] instead')
  Future setFriendsEx(
    List<String> friendIDs, {
    String? ex,
    String? operationID,
  }) {
    final req = UpdateFriendsReq(friendUserIDs: friendIDs, ex: ex);

    return updateFriends(req, operationID: operationID);
  }

  Future<dynamic> updateFriends(
    UpdateFriendsReq updateFriendsReq, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'updateFriends',
            _buildParam({
              'req': updateFriendsReq.toJson(),
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => value);
  }

  static Map _buildParam(Map<String, dynamic> param) {
    param["ManagerName"] = "friendshipManager";
    param = Utils.cleanMap(param);

    return param;
  }
}
