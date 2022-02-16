import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';
import 'package:flutter_openim_sdk/src/listener/connect_listener.dart';

class OnConnectListener extends ConnectListener {
  Function(int? code, String? errorMsg)? onConnectFailed;
  Function()? onConnectSuccess;
  Function()? onConnecting;
  Function()? onKickedOffline;
  Function()? onUserSigExpired;

  OnConnectListener({
    this.onConnectFailed,
    this.onConnectSuccess,
    this.onConnecting,
    this.onKickedOffline,
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
  void userSigExpired() {
    if (null != onUserSigExpired) onUserSigExpired!();
  }
}
