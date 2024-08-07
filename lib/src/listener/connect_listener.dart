/// SDK Connection State Listener
class OnConnectListener {
  Function(int? code, String? errorMsg)? onConnectFailed;
  Function()? onConnectSuccess;
  Function()? onConnecting;
  Function()? onKickedOffline;
  Function()? onUserTokenExpired;
  Function()? onUserTokenInvalid;

  OnConnectListener({
    this.onConnectFailed,
    this.onConnectSuccess,
    this.onConnecting,
    this.onKickedOffline,
    this.onUserTokenExpired,
    this.onUserTokenInvalid,
  });

  /// SDK failed to connect to the server
  void connectFailed(int? code, String? errorMsg) {
    onConnectFailed?.call(code, errorMsg);
  }

  /// SDK successfully connected to the server
  void connectSuccess() {
    onConnectSuccess?.call();
  }

  /// SDK is currently connecting to the server
  void connecting() {
    onConnecting?.call();
  }

  /// The account has been logged in from another location, and the current device has been kicked offline
  void kickedOffline() {
    onKickedOffline?.call();
  }

  /// Login credentials have expired and require reauthentication
  void userTokenExpired() {
    onUserTokenExpired?.call();
  }

  void userTokenInvalid() {
    onUserTokenInvalid?.call();
  }
}
