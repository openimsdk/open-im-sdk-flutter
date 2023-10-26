/// Message Types
class MessageType {
  /// Normal text
  static const text = 101;

  /// Picture
  static const picture = 102;

  /// Voice
  static const voice = 103;

  /// Video
  static const video = 104;

  /// File
  static const file = 105;

  /// @ Message
  static const atText = 106;

  /// Merge
  static const merger = 107;

  /// Business Card
  static const card = 108;

  /// Location
  static const location = 109;

  /// Custom
  static const custom = 110;

  /// Typing
  static const typing = 113;

  /// Quote Reply
  static const quote = 114;

  /// Custom Emoji
  static const customFace = 115;

  /// Group Message Has Read Receipt (Deprecated in v3)
  @Deprecated('Use GroupHasReadReceiptNotification instead')
  static const groupHasReadReceipt = 116;

  /// Rich Text Message
  static const advancedText = 117;

  static const customMsgNotTriggerConversation = 119;

  static const customMsgOnlineOnly = 120;

  /// Notification Types
  static const notificationBegin = 1000;

  static const friendNotificationBegin = 1200;

  /// Friend Request Accepted
  static const friendApplicationApprovedNotification = 1201;

  /// Friend Request Rejected
  static const friendApplicationRejectedNotification = 1202;

  /// Friend Request
  static const friendApplicationNotification = 1203;

  /// Friend Added
  static const friendAddedNotification = 1204;

  /// Friend Deleted
  static const friendDeletedNotification = 1205;

  /// Set Friend Remark
  static const friendRemarkSetNotification = 1206;

  /// Friend Added to Blacklist
  static const blackAddedNotification = 1207;

  /// Removed from Blacklist
  static const blackDeletedNotification = 1208;

  static const friendNotificationEnd = 1299;

  /// Conversation Change
  static const conversationChangeNotification = 1300;

  static const userNotificationBegin = 1301;

  /// User Information Changed
  static const userInfoUpdatedNotification = 1303;

  static const userNotificationEnd = 1399;

  /// OA Notification
  static const oaNotification = 1400;

  static const groupNotificationBegin = 1500;

  /// Group Created
  static const groupCreatedNotification = 1501;

  /// Group Info Set
  static const groupInfoSetNotification = 1502;

  /// Join Group Application
  static const joinGroupApplicationNotification = 1503;

  /// Group Member Quit
  static const memberQuitNotification = 1504;

  /// Group Application Accepted
  static const groupApplicationAcceptedNotification = 1505;

  /// Group Application Rejected
  static const groupApplicationRejectedNotification = 1506;

  /// Group Owner Transferred
  static const groupOwnerTransferredNotification = 1507;

  /// Member Kicked from Group
  static const memberKickedNotification = 1508;

  /// Member Invited to Group
  static const memberInvitedNotification = 1509;

  /// Member Entered Group
  static const memberEnterNotification = 1510;

  /// Dismiss Group
  static const dismissGroupNotification = 1511;

  static const groupNotificationEnd = 1599;

  /// Group Member Muted
  static const groupMemberMutedNotification = 1512;

  /// Group Member Cancel Muted
  static const groupMemberCancelMutedNotification = 1513;

  /// Group Muted
  static const groupMutedNotification = 1514;

  /// Cancel Group Muted
  static const groupCancelMutedNotification = 1515;

  /// Group Member Information Changed
  static const groupMemberInfoChangedNotification = 1516;

  /// Group Member Set to Admin
  static const groupMemberSetToAdminNotification = 1517;

  static const groupMemberSetToOrdinaryUserNotification = 1518;

  /// Group Notice Changed
  static const groupInfoSetAnnouncementNotification = 1519;

  /// Group Name Changed
  static const groupInfoSetNameNotification = 1520;

  /// Burn After Reading
  static const burnAfterReadingNotification = 1701;

  static const notificationEnd = 2000;

  /// Business Notification
  static const businessNotification = 2001;

  /// Recall Message
  static const revokeMessageNotification = 2101;

  /// Single Chat Has Read Receipt
  static const signalHasReadReceiptNotification = 2150;

  /// Group Chat Has Read Receipt
  static const groupHasReadReceiptNotification = 2155;
}
