import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class UserManager {
  MethodChannel _channel;
  late OnUserListener userListener;

  UserManager(this._channel);

  /// Observe user info changes
  /// 用户资料改变监听
  Future setUserListener(OnUserListener listener) {
    this.userListener = listener;
    return _channel.invokeMethod('setUserListener', _buildParam({}));
  }

  /// Query user information
  /// 获取用户资料
  Future<List<UserInfo>> getUsersInfo({
    required List<String> uidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getUsersInfo',
              _buildParam({
                'uidList': uidList,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => UserInfo.fromJson(v)));

  /// Get the information of the currently logged in user
  /// 获取当前登录用户的信息
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

  /// Modify current user info
  /// 修改当前登录用户资料
  Future<String?> setSelfInfo({
    String? nickname,
    String? faceURL,
    int? gender,
    int? appMangerLevel,
    String? phoneNumber,
    int? birth,
    String? email,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setSelfInfo',
          _buildParam({
            // 'userID': userID,
            'nickname': nickname,
            'faceURL': faceURL,
            'gender': gender,
            'appMangerLevel': appMangerLevel,
            'phoneNumber': phoneNumber,
            'birth': birth,
            'email': email,
            'ex': ex,
            'operationID': Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "userManager";
    return param;
  }
}
