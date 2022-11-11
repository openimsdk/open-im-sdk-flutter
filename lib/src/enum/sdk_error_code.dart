/// 消息发送失败
class MessageFailedCode {
  /// 被对方拉黑
  static const int blockedByFriend = 600;

  /// 被对方删除
  static const int deletedByFriend = 601;
}

/// 添加好友失败
class AddFriendFailedCode {
  /// 该用户已设置不可添加
  static const int refuseToAddFriends = 10007;
}
