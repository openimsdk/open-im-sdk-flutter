import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnUserListener {
  /// The information of the logged-in user has been updated
  Function(UserInfo info)? onSelfInfoUpdated;

  OnUserListener({this.onSelfInfoUpdated});

  /// 自身信息发送变化
  void selfInfoUpdated(UserInfo info) {
    onSelfInfoUpdated?.call(info);
  }
}
