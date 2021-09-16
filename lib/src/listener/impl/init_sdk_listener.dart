import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnInitSDKListener extends InitSDKListener {
  Function(int? code, String? errorMsg)? onConnectFailed;
  Function()? onConnectSuccess;
  Function()? onConnecting;
  Function()? onKickedOffline;
  Function(UserInfo info)? onSelfInfoUpdated;
  Function()? onUserSigExpired;

  OnInitSDKListener({
    this.onConnectFailed,
    this.onConnectSuccess,
    this.onConnecting,
    this.onKickedOffline,
    this.onSelfInfoUpdated,
    this.onUserSigExpired,
  });

  @override
  void connectFailed(int? code, String? errorMsg) {
    if (null != onConnectFailed) onConnectFailed!(code, errorMsg);
  }

  @override
  void connectSuccess() {
    if (null != onConnectSuccess) onConnectSuccess!();
  }

  @override
  void connecting() {
    if (null != onConnecting) onConnecting!.call();
  }

  @override
  void kickedOffline() {
    if (null != onKickedOffline) onKickedOffline!();
  }

  @override
  void selfInfoUpdated(UserInfo info) {
    if (null != onSelfInfoUpdated) onSelfInfoUpdated!(info);
  }

  @override
  void userSigExpired() {
    if (null != onUserSigExpired) onUserSigExpired!();
  }
}
