class OnConnectListener {
  /// SDK failed to connect to the server
  Function(int? code, String? errorMsg)? onConnectFailed;

  /// SDK has successfully connected to the server
  Function()? onConnectSuccess;

  /// SDK is connecting to the server
  Function()? onConnecting;

  /// The current user is kicked offline.
  /// At this time, the UI can prompt the user and call IMManager's login() function to log in again.
  Function()? onKickedOffline;

  ///  Ticket expired when online.
  ///  At this time, you need to generate a new userSig and call IMManager's login() function to log in again
  Function()? onUserSigExpired;

  OnConnectListener({
    this.onConnectFailed,
    this.onConnectSuccess,
    this.onConnecting,
    this.onKickedOffline,
    this.onUserSigExpired,
  });

  void connectFailed(int? code, String? errorMsg) {
    if (null != onConnectFailed) onConnectFailed!(code, errorMsg);
  }

  void connectSuccess() {
    if (null != onConnectSuccess) onConnectSuccess!();
  }

  void connecting() {
    if (null != onConnecting) onConnecting!.call();
  }

  void kickedOffline() {
    if (null != onKickedOffline) onKickedOffline!();
  }

  void userSigExpired() {
    if (null != onUserSigExpired) onUserSigExpired!();
  }
}
