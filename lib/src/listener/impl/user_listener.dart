import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnUserListener extends UserListener {
  Function(UserInfo info)? onSelfInfoUpdated;

  OnUserListener({this.onSelfInfoUpdated});

  @override
  void selfInfoUpdated(UserInfo info) {
    onSelfInfoUpdated?.call(info);
  }
}
