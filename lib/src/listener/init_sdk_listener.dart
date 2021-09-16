import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class InitSDKListener {
  /// SDK 正在连接到服务器
  void connecting();

  /// SDK 已经成功连接到服务器
  void connectSuccess();

  /// SDK 连接服务器失败
  void connectFailed(int? code, String? errorMsg);

  /// 当前用户被踢下线，此时可以 UI 提示用户，并再次调用 IMManager 的 login() 函数重新登录。
  void kickedOffline();

  ///  在线时票据过期：此时您需要生成新的 userSig 并再次调用 IMManager 的 login() 函数重新登录
  void userSigExpired();

  /// 登录用户的资料发生了更新
  void selfInfoUpdated(UserInfo info);
}
