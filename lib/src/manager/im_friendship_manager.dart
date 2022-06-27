import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class FriendshipManager {
  MethodChannel _channel;
  late OnFriendshipListener listener;

  FriendshipManager(this._channel);

  /// 好友关系监听
  Future setFriendshipListener(OnFriendshipListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setFriendListener', _buildParam({}));
  }

  /// 查询好友信息
  /// [uidList] userID集合
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

  /// 发送一个好友请求，需要对方调用同意申请才能成为好友。
  /// [uid] 被邀请的用户ID
  /// [reason] 备注说明
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

  /// 获取好友列表，返回的列表包含了已拉入黑名单的好友
  Future<List<UserInfo>> getFriendList({String? operationID}) => _channel
      .invokeMethod(
          'getFriendList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// 获取好友列表，返回的列表包含了已拉入黑名单的好友
  Future<List<dynamic>> getFriendListMap({String? operationID}) => _channel
      .invokeMethod(
          'getFriendList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toListMap(value));

  /// 设置好友备注
  /// [uid] 好友的userID
  /// [remark] 好友的备注
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

  /// 加入黑名单
  /// [uid] 被加入黑名单的好友ID
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

  /// 获取黑名单列表
  Future<List<UserInfo>> getBlacklist({String? operationID}) => _channel
      .invokeMethod(
          'getBlacklist',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// 从黑名单移除
  /// [uid] 用户ID
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

  /// 检查友好关系
  /// [uidList] userID列表
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

  /// 删除好友
  /// [uid] 用户ID
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

  /// 接受好友请求
  /// [uid] 用户ID
  /// [handleMsg]备注说明
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

  /// 拒绝好友请求
  /// [uid] 用户ID
  /// [handleMsg]备注说明
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

  /// 查好友
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  /// [isSearchUserID] 是否以关键词搜索好友ID(注：不可以同时为false)，为空默认false
  /// [isSearchNickname] 是否以关键词搜索昵称，为空默认false
  /// [isSearchRemark] 是否以关键词搜索备注名，为空默认false
  Future<List<FriendInfo>> searchFriends({
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
          .then((value) =>
              Utils.toList(value, (map) => FriendInfo.fromJson(map)));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "friendshipManager";
    return param;
  }
}
