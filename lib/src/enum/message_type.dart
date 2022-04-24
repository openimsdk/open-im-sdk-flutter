class MessageType {
  ///
  static const text = 101;
  static const picture = 102;
  static const voice = 103;
  static const video = 104;
  static const file = 105;
  static const at_text = 106;
  static const merger = 107;
  static const card = 108;
  static const location = 109;
  static const custom = 110;
  static const revoke = 111;
  static const has_read_receipt = 112;
  static const typing = 113;
  static const quote = 114;
  static const custom_face = 115;

  ///
  static const notificationBegin = 1000;

  static const friendNotificationBegin = 1200;
  static const friendApplicationApprovedNotification = 1201;
  static const friendApplicationRejectedNotification = 1202;
  static const friendApplicationNotification = 1203;
  static const friendAddedNotification = 1204;
  static const friendDeletedNotification = 1205;
  static const friendRemarkSetNotification = 1206;
  static const blackAddedNotification = 1207;
  static const blackDeletedNotification = 1208;
  static const friendNotificationEnd = 1299;

  static const conversationChangeNotification = 1300;

  static const userNotificationBegin = 1301;
  static const userInfoUpdatedNotification = 1303;
  static const userNotificationEnd = 1399;

  static const oaNotification = 1400;

  static const groupNotificationBegin = 1500;
  static const groupCreatedNotification = 1501;
  static const groupInfoSetNotification = 1502;
  static const joinGroupApplicationNotification = 1503;
  static const memberQuitNotification = 1504;
  static const groupApplicationAcceptedNotification = 1505;
  static const groupApplicationRejectedNotification = 1506;
  static const groupOwnerTransferredNotification = 1507;
  static const memberKickedNotification = 1508;
  static const memberInvitedNotification = 1509;
  static const memberEnterNotification = 1510;
  static const dismissGroupNotification = 1511;
  static const groupNotificationEnd = 1599;

  static const groupMemberMutedNotification = 1512;
  static const groupMemberCancelMutedNotification = 1513;
  static const groupMutedNotification = 1514;
  static const groupCancelMutedNotification = 1515;
  static const groupMemberInfoChangedNotification = 1516;

  static const signalingNotificationBegin = 1600;
  static const signalingNotification = 1601;
  static const signalingNotificationEnd = 1699;

  static const burnAfterReadingNotification = 1701;

  static const notificationEnd = 2000;
}
