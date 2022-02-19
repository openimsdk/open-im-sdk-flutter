# flutter_openim_sdk
[![pub package](https://img.shields.io/pub/v/flutter_openim_sdk.svg)](https://pub.flutter-io.cn/packages/flutter_openim_sdk)
[![Generic badge](https://img.shields.io/badge/platform-android%20|%20ios%20-blue.svg)](https://pub.dev/packages/flutter_openim_sdk)
[![GitHub license](https://img.shields.io/github/license/OpenIMSDK/Open-IM-SDK-Flutter)](https://github.com/OpenIMSDK/Open-IM-SDK-Flutter/blob/main/LICENSE)

A flutter im plugin for android and ios.

#### [中文文档](README.zh-cn.md)

#### [demo](https://github.com/OpenIMSDK/Open-IM-Flutter-Demo.git) | [widget](https://github.com/hrxiang/flutter_openim_widget.git)

![Android](https://www.pgyer.com/app/qrcode/OpenIM)



## Getting Started


#### 1，Add dependency in yaml

       flutter_openim_sdk: latest

#### 2，Import package

      import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

#### 3， Init config

```
		// Initialize SDK
    OpenIM.iMManager
      ..initSDK(
        platform: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
        apiAddr: '',
        wsAddr: '',
        dataDir: '',
        listener: OnConnectListener(),
      )
      // Set up current user info changed listener
      ..userManager.setUserListener(OnUserListener())
      // Add message listener (remove when not in use)
      ..messageManager.setAdvancedMsgListener(OnAdvancedMsgListener())

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener())

      // Set up friend relationship listener
      ..friendshipManager.setFriendshipListener(OnFriendshipListener())

      // Set up conversation listener
      ..conversationManager.setConversationListener(OnConversationListener())

      // Set up group listener
      ..groupManager.setGroupListener(OnGroupListener(
      ));
```

#### 4， Log in

```
 OpenIM.iMManager.login(uid: uid, token: token).then((value){
 	// login success
 });
```

#### 5，Get a list of conversations

```
 OpenIM.iMManager.conversationManager.getAllConversationList().then((list) {
 });
```

#### 6，Get friend list

```
 OpenIM.iMManager.friendshipManager.getFriendList().then((list) {
 });
```

#### 7，Get chat history

```
  // If userID is not null and groupID is null, get a single chat message list
  // If the userID is null and the groupID is not null, get a group chat message list
  OpenIM.iMManager.messageManager.getHistoryMessageList(
          userID: uid,//User id
          startMsg: startMsg,//Last message, take chatMsgList[0]
          groupID: gid,//Group id
          count: count,//Page Size
      )
      .then((list){});
      
```

#### 8，Send a message

```
// Create message
var message = await OpenIM.iMManager.messageManager.createTextMessage(
     text: 'I am the content of the message',
 );
// Send
OpenIM.iMManager.messageManager.sendMessage(
   message: message,
   offlinePushInfo: offlinePushInfo,
   userID: uid, // Single chat value is not null
   groupID: gid, // The group chat value is not null
 ).then((v) {
 }).catchError((e){
 });
```

#### 9，Sign out

```
OpenIM.iMManager.logout();
```

####  OpenIM.iMManager

| method           | description              |
| ---------------- | ------------------------ |
| initSDK          | Initialize SDK           |
| unInitSDK        |                          |
| login            | Log in                   |
| logout           | Sign out                 |
| getLoginStatus   | Login status             |
| getLoginUid      | Current user id          |
| getLoginUserInfo | Current user information |

#### OpenIM.userManager

| method          | description                                         |
| --------------- | --------------------------------------------------- |
| setSelfInfo     | Modify current user information                     |
| getUsersInfo    | Get user information by user id                     |
| getSelfUserInfo | Get the information of the currently logged in user |

#### OpenIM.iMManager.conversationManager

| method                         | description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| setConversationListener        | Listener                                                     |
| getAllConversationList         | Get all conversation                                         |
| getConversationListSplit       | Paging to get conversation                                   |
| getOneConversation             | Get a conversation, if it doesn't exist it will be created automatically |
| getMultipleConversation        | Get conversation list by id list                             |
| deleteConversation             | Delete conversation by id                                    |
| setConversationDraft           | Set  conversation draftText                                  |
| pinConversation                | Pinned conversation                                          |
| markGroupMessageHasRead        | Mark group chat messages as read                             |
| getTotalUnreadMsgCount         | Get the total number of unread messages                      |
| getConversationIDBySessionType | Query conversation id                                        |
| setConversationRecvMessageOpt  | Setup  message do not disturb                                |
| getConversationRecvMessageOpt  | Message do not disturb status                                |

#### OpenIM.iMManager.friendshipManager

| method                       | description                                                  |
| ---------------------------- | ------------------------------------------------------------ |
| setFriendshipListener        | Set up a friend relationship listener                        |
| getFriendsInfo               | Get friend info by user id                                   |
| addFriend                    | Send an friend application                                   |
| getRecvFriendApplicationList | Get someone's request to add me as a friend                  |
| getSendFriendApplicationList | Get friend requests from me                                  |
| getFriendList                | Find all friends including those who have been added to the blacklist |
| setFriendRemark              | Modify friend remark name                                    |
| addBlacklist                 | Add friends to blacklist                                     |
| getBlacklist                 | Get blacklist list                                           |
| removeBlacklist              | Remove from blacklist                                        |
| checkFriend                  | Determine if there is a friendship by userId                 |
| deleteFriend                 | Dissolve friendship from friend list                         |
| acceptFriendApplication      | Accept application of be friend                              |
| refuseFriendApplication      | Refuse application of be friend                              |

#### OpenIM.iMManager.messageManager

| method                            | description                                |
| --------------------------------- | ------------------------------------------ |
| setAdvancedMsgListener            | Set a message listener                     |
| setMsgSendProgressListener        | Set up message sending progress monitoring |
| sendMessage                       | Send a message to user or to group         |
| getHistoryMessageList             | Find all history message                   |
| revokeMessage                     | Revoke the sent information                |
| deleteMessageFromLocalStorage     | Delete message                             |
| insertSingleMessageToLocalStorage | Insert message                             |
| markC2CMessageAsRead              | Mark c2c message as read                   |
| typingStatusUpdate                | Typing prompt                              |
| createTextMessage                 | Create text message                        |
| createTextAtMessage               | Create @ message                           |
| createImageMessage                | Create picture message                     |
| createImageMessageFromFullPath    | Create picture message                     |
| createSoundMessage                | Create voice message                       |
| createSoundMessageFromFullPath    | Create voice message                       |
| createVideoMessage                | Create video message                       |
| createVideoMessageFromFullPath    | Create video message                       |
| createFileMessage                 | Create file message                        |
| createFileMessageFromFullPath     | Create file message                        |
| createMergerMessage               | Create merge message                       |
| createForwardMessage              | Create a forwarded message                 |
| createLocationMessage             | Create location message                    |
| createCustomMessage               | Create custom message                      |
| createQuoteMessage                | Create quote message                       |
| createCardMessage                 | Create card message                        |
| clearC2CHistoryMessage            | Clear all c2c history message              |
| clearGroupHistoryMessage          | Clear all group history                    |

#### OpenIM.iMManager.groupManager

| method                      | description                                                  |
| --------------------------- | ------------------------------------------------------------ |
| setGroupListener            | Set up group relationship monitoring                         |
| inviteUserToGroup           | Invite friends into the group                                |
| kickGroupMember             | Remove member from group                                     |
| getGroupMembersInfo         | Get group member information                                 |
| getGroupMemberList          | Get the list of group members                                |
| getJoinedGroupList          | Find all groups you have joined                              |
| isJoinedGroup               | Check if you are a member of the group                       |
| createGroup                 | Create a group                                               |
| setGroupInfo                | Edit group information                                       |
| getGroupsInfo               | Find group information by group id                           |
| joinGroup                   | Apply to join the group                                      |
| quitGroup                   | Leave group                                                  |
| transferGroupOwner          | Give group permissions to others                             |
| getRecvGroupApplicationList | As the group owner or administrator, get the list of received group members' applications to join the group. |
| getSendGroupApplicationList | Get the record of the group membership application issued by yourself |
| acceptGroupApplication      | Accept group application                                     |
| refuseGroupApplication      | Refuse group application                                     |

#### Other

Message type

```
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

  ///
  static const accept_friend = 201;
  static const add_friend = 202;
  static const refuse_friend_application = 203;
  static const set_self_info = 204;
  static const revoke_message = 205;
  static const c2c_message_as_read = 206;

  static const kick_online = 303;


  static const transfer_group_owner = 501;
  static const create_group = 502;
  // static const create_group = 503;
  static const join_group = 504;
  static const quit_group = 505;
  static const set_group_info = 506;
  static const accept_group_application = 507;
  static const refuse_group_application = 508;
  static const kick_group_member = 509;
  static const invited_user_to_group = 510;
```

Platform

```
  static const ios = 1;
  static const android = 2;
  static const windows = 3;
  static const xos = 4;
  static const web = 5;
  static const mini_web = 6;
  static const linux = 7;
```

Group member role level

```
  static const member = 1;
  static const owner = 2;
  static const admin = 3;
```

Conversation type

```
 static const single = 1;
 static const group = 2;
```

Message status

```
 static const sending = 1;
 static const succeeded = 2;
 static const failed = 3;
 static const deleted = 4;
```

