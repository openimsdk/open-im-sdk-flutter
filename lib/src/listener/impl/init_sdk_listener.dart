import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnInitSDKListener implements InitSDKListener {
  Function(int? code, String? errorMsg)? connectFailed;
  Function()? connectSuccess;
  Function()? connecting;
  Function()? kickedOffline;
  Function(UserInfo info)? selfInfoUpdated;
  Function()? userSigExpired;

  OnInitSDKListener({
    this.connectFailed,
    this.connectSuccess,
    this.connecting,
    this.kickedOffline,
    this.selfInfoUpdated,
    this.userSigExpired,
  });

  @override
  void onConnectFailed(int? code, String? errorMsg) {
    if (null != connectFailed) connectFailed!(code, errorMsg);
  }

  @override
  void onConnectSuccess() {
    if (null != connectSuccess) connectSuccess!();
  }

  @override
  void onConnecting() {
    if (null != connecting) connecting!.call();
  }

  @override
  void onKickedOffline() {
    if (null != kickedOffline) kickedOffline!();
  }

  @override
  void onSelfInfoUpdated(UserInfo info) {
    if (null != selfInfoUpdated) selfInfoUpdated!(info);
  }

  @override
  void onUserSigExpired() {
    if (null != userSigExpired) userSigExpired!();
  }
}
