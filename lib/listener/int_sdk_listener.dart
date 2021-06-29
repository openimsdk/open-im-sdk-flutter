import 'package:flutter_openim_sdk/models/user_info.dart';

class InitSDKListener {
  /// SDK 正在连接到服务器
  void onConnecting() {}

  /// SDK 已经成功连接到服务器
  void onConnectSuccess() {}

  /// SDK 连接服务器失败
  void onConnectFailed(int? int, String? errorMsg) {}

  /// 当前用户被踢下线，此时可以 UI 提示用户，并再次调用 IMManager 的 login() 函数重新登录。
  void onKickedOffline() {}

  ///  在线时票据过期：此时您需要生成新的 userSig 并再次调用 IMManager 的 login() 函数重新登录
  void onUserSigExpired() {}

  /// 登录用户的资料发生了更新
  void onSelfInfoUpdated(UserInfo info) {}
}
