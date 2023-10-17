import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class UserManager {
  MethodChannel _channel;
  late OnUserListener listener;

  UserManager(this._channel);

  /// User profile change listener
  Future setUserListener(OnUserListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setUserListener', _buildParam({}));
  }

  /// Get user information
  /// [userIDList] List of user IDs
  Future<List<UserInfo>> getUsersInfo({
    required List<String> userIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getUsersInfo',
              _buildParam({
                'userIDList': userIDList,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// Get information of the currently logged-in user
  Future<UserInfo> getSelfUserInfo({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getSelfUserInfo',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => UserInfo.fromJson(map)));

  /// Modify the profile of the currently logged-in user
  /// [nickname] Nickname
  /// [faceURL] Profile picture
  /// [appManagerLevel]
  /// [ex] Additional fields
  Future<String?> setSelfInfo({
    String? nickname,
    String? faceURL,
    int? appManagerLevel,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setSelfInfo',
          _buildParam({
            // 'userID': userID,
            'nickname': nickname,
            'faceURL': faceURL,
            'appManagerLevel': appManagerLevel,
            'ex': ex,
            'operationID': Utils.checkOperationID(operationID),
          }));

  Future<List<UserStatusInfo>> subscribeUsersStatus(
    List<String> userIDs, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'subscribeUsersStatus',
            _buildParam({
              'userIDs': userIDs,
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  Future<List<UserStatusInfo>> unsubscribeUsersStatus(
    List<String> userIDs, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'unsubscribeUsersStatus',
            _buildParam({
              'userIDs': userIDs,
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  Future<List<UserStatusInfo>> getSubscribeUsersStatus({
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'getSubscribeUsersStatus',
            _buildParam({
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  Future<List<UserStatusInfo>> getUserStatus(
    List<String> userIDs, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'getUserStatus',
            _buildParam({
              'userIDs': userIDs,
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  Future<List<UserInfo>> getUsersInfoStranger(
    List<String> userIDs, {
    String? groupID,
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'getUsersInfoStranger',
            _buildParam({
              'userIDs': userIDs,
              'groupID': groupID,
              'operationID': Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => UserInfo.fromJson(map)));
  }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "userManager";
    return param;
  }
}
