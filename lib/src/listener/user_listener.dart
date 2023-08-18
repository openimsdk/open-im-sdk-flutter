import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 当前用户资料监听
class OnUserListener {
  /// The information of the logged-in user has been updated
  Function(UserInfo info)? onSelfInfoUpdated;
  Function(UserStatusInfo info)? onUserStatusChanged;

  OnUserListener({this.onSelfInfoUpdated});

  /// 自身信息发送变化回调
  void selfInfoUpdated(UserInfo info) {
    onSelfInfoUpdated?.call(info);
  }

  void userStatusChanged(UserStatusInfo info) {
    onUserStatusChanged?.call(info);
  }
}
