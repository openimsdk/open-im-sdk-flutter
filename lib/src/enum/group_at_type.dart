/// 会话强提示内容
class GroupAtType {
  /// 取消所有提示，即调用了resetConversationGroupAtType方法
  static const atNormal = 0;

  /// @了我提示
  static const atMe = 1;

  /// @了所有人提示
  static const atAll = 2;

  /// @了所有人@了我
  static const atAllAtMe = 3;

  /// 群公告提示
  static const groupNotification = 4;
}
