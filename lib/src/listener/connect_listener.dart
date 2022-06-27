/// SDK 连接状态监听
class OnConnectListener {
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

  /// SDK连接服务器失败
  void connectFailed(int? code, String? errorMsg) {
    if (null != onConnectFailed) onConnectFailed!(code, errorMsg);
  }

  /// SDK连接服务器成功
  void connectSuccess() {
    if (null != onConnectSuccess) onConnectSuccess!();
  }

  /// SDK正在连接服务器
  void connecting() {
    if (null != onConnecting) onConnecting!.call();
  }

  /// 账号已在其他地方登录，当前设备被踢下线
  void kickedOffline() {
    if (null != onKickedOffline) onKickedOffline!();
  }

  ///  登录凭证过期，需要重新登录
  void userSigExpired() {
    if (null != onUserSigExpired) onUserSigExpired!();
  }
}
