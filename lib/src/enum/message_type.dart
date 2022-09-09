/// 消息类型
class MessageType {
  /// 普通文本
  static const text = 101;

  /// 图片
  static const picture = 102;

  /// 语音
  static const voice = 103;

  /// 视频
  static const video = 104;

  /// 文件
  static const file = 105;

  /// @消息
  static const at_text = 106;

  /// 合并
  static const merger = 107;

  /// 名片
  static const card = 108;

  /// 位置
  static const location = 109;

  /// 自定义
  static const custom = 110;

  /// 撤回
  static const revoke = 111;

  /// 已读回执
  static const has_read_receipt = 112;

  /// 正字输入
  static const typing = 113;

  /// 引用回复
  static const quote = 114;

  /// 自定义表情
  static const custom_face = 115;

  /// 群消息已读回执
  static const groupHasReadReceipt = 116;

  /// 富文本消息
  static const advancedText = 117;

  /// 高级撤回
  static const advancedRevoke = 118;

  static const customMsgNotTriggerConversation = 119;

  static const customMsgOnlineOnly = 120;

  /// 通知类型
  static const notificationBegin = 1000;

  static const friendNotificationBegin = 1200;

  /// 好友申请已接受
  static const friendApplicationApprovedNotification = 1201;

  /// 好友申请已拒绝
  static const friendApplicationRejectedNotification = 1202;

  /// 好友申请
  static const friendApplicationNotification = 1203;

  /// 好友已添加
  static const friendAddedNotification = 1204;

  /// 好友已删除
  static const friendDeletedNotification = 1205;

  /// 设置好友备注
  static const friendRemarkSetNotification = 1206;

  /// 好友加入黑名单
  static const blackAddedNotification = 1207;

  /// 已从黑名单移除
  static const blackDeletedNotification = 1208;

  static const friendNotificationEnd = 1299;

  /// 会话改变
  static const conversationChangeNotification = 1300;

  static const userNotificationBegin = 1301;

  /// 用户信息改变
  static const userInfoUpdatedNotification = 1303;

  static const userNotificationEnd = 1399;

  /// OA通知
  static const oaNotification = 1400;

  static const groupNotificationBegin = 1500;

  /// 群已被创建
  static const groupCreatedNotification = 1501;

  /// 群资料改变
  static const groupInfoSetNotification = 1502;

  /// 进群申请
  static const joinGroupApplicationNotification = 1503;

  /// 群成员退出
  static const memberQuitNotification = 1504;

  /// 群申请被接受
  static const groupApplicationAcceptedNotification = 1505;

  /// 群申请被拒绝
  static const groupApplicationRejectedNotification = 1506;

  /// 群拥有者权限转移
  static const groupOwnerTransferredNotification = 1507;

  /// 群成员被踢出群
  static const memberKickedNotification = 1508;

  /// 邀请进群
  static const memberInvitedNotification = 1509;

  /// 群成员进群
  static const memberEnterNotification = 1510;

  /// 解散群
  static const dismissGroupNotification = 1511;

  static const groupNotificationEnd = 1599;

  /// 群成员被禁言
  static const groupMemberMutedNotification = 1512;

  /// 群成员被取消禁言
  static const groupMemberCancelMutedNotification = 1513;

  /// 群禁言
  static const groupMutedNotification = 1514;

  /// 取消群禁言
  static const groupCancelMutedNotification = 1515;

  /// 群成员信息改变
  static const groupMemberInfoChangedNotification = 1516;

  static const signalingNotificationBegin = 1600;

  /// 信令
  static const signalingNotification = 1601;

  static const signalingNotificationEnd = 1699;

  /// 阅后即焚
  static const burnAfterReadingNotification = 1701;

  static const notificationEnd = 2000;
}
