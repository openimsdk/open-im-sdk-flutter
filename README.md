# flutter_openim_sdk

### [Download demo](https://github.com/OpenIMSDK/Open-IM-Flutter-Demo.git)

### [OpenIM-Flutter-Widget](https://github.com/hrxiang/OpenIM-Flutter-Widget.git)

[![Chinese](https://img.shields.io/badge/Language-Chinese-blueviolet?style=for-the-badge)](README.zh-cn.md)

![img](https://github.com/hrxiang/OpenIMFlutterDemo/blob/main/gif/add_friend.gif)
![img](https://github.com/hrxiang/OpenIMFlutterDemo/blob/main/gif/QQ20210728-104641-HD.gif) 
![img](https://github.com/hrxiang/OpenIMFlutterDemo/blob/main/gif/QQ20210728-105242-HD.gif) 
![img](https://github.com/hrxiang/OpenIMFlutterDemo/blob/main/gif/QQ20210728-105444-HD.gif) 


A flutter IM plugin for android and ios.

## Getting Started


#### 1，Add dependency in yaml

       flutter_openim_sdk: ^0.0.9+3

#### 2，Import package

      import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

#### 3， Init config

```
// Initialize SDK
   OpenIM.iMManager
      ..initSDK(
        platform: IMPlatform.ios,
    	ipApi: 'Api interface address',
        ipWs: 'WebSocket address',
        dbPath: 'Database directory',
        listener: OnInitSDKListener(
          connecting: () {},
          connectFailed: (code, error) {},
          connectSuccess: () {},
          kickedOffline: () {},
          userSigExpired: () {},
          selfInfoUpdated: (user) {},
        ),
      )

      // Add message listener (remove when not in use)
      ..messageManager.addAdvancedMsgListener(OnAdvancedMsgListener(
        recvMessageRevoked: (id) {},
        recvC2CReadReceipt: (list) {},
        recvNewMessage: (msg) {},
      ))

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
        progressCallback: (id, progress) {},
      ))

      // Set up friend relationship listener
      ..friendshipManager.setFriendshipListener(OnFriendshipListener(
        blackListAdd: (u) {},
        blackListDeleted: (u) {},
        friendApplicationListAccept: (u) {},
        friendApplicationListAdded: (u) {},
        friendApplicationListDeleted: (u) {},
        friendApplicationListReject: (u) {},
        friendInfoChanged: (u) {},
        friendListAdded: (u) {},
        friendListDeleted: (u) {},
      ))

      // Set up conversation listener
      ..conversationManager.setConversationListener(OnConversationListener(
        conversationChanged: (list) {},
        newConversation: (list) {},
        totalUnreadMsgCountChanged: (count) {},
        syncServerFailed: () {},
        syncServerFinish: () {},
        syncServerStart: () {},
      ))

      // Set up group listener
      ..groupManager.setGroupListener(OnGroupListener(
        applicationProcessed: (groupId, opUser, agreeOrReject, opReason) {},
        groupCreated: (groupId) {},
        groupInfoChanged: (groupId, info) {},
        memberEnter: (groupId, list) {},
        memberInvited: (groupId, opUser, list) {},
        memberKicked: (groupId, opUser, list) {},
        memberLeave: (groupId, info) {},
        receiveJoinApplication: (groupId, info, opReason) {},
      ));
```

#### 4， Log in

```
 OpenIM.iMManager.login(uid: uid, token: token).then((value){
 	// login successful
 });
```

#### 5，Get a list of conversations

```
 OpenIM.iMManager.conversationManager.getAllConversationList().then((list) {
 	// Return to the conversation list
 });
```

#### 6，Get contact list

```
 OpenIM.iMManager.friendshipManager.getFriendList().then((list) {
   	// Return to friends list
 });
```

#### 7，Get chat history

```
List<Message> chatMsgList = List.empty(growable: true);
  
/// Custom message listener, the arrival of a new message will trigger the onNewMessage method callback
class CustomAdvancedMsgListener extends AdvancedMsgListener {
  final ValueChanged<Message>? onNewMessage;

  CustomAdvancedMsgListener({
    this.onNewMessage,
  });

  @override
  void onRecvNewMessage(Message msg) {
    if (null != onNewMessage) onNewMessage!(msg);
  }
}
```

-   History news

```
  // If userID is not null and groupID is null, get a single chat message list
  // If the userID is null and the groupID is not null, get a group chat message list
  OpenIM.iMManager.messageManager.getHistoryMessageList(
          userID: uid,//User id
          startMsg: startMsg,//Last message, take chatMsgList[0]
          groupID: gid,//Group id
          count: 12,//Page Size
      )
      .then((list) => chatMsgList.addAll(list));
      
```

-  New news

```
// Create a message listener
// After entering the chat page, you need to listen for new messages and then render the UI
// Each chat window has a unique uid (user id) or gid (group id)
// Determine whether the received message belongs to the current window according to uid or gid
var msgListener = CustomAdvancedMsgListener(onNewMessage: (message) {
     // If the sender user id is equal to the user id of the current chat page,
     // or the group id is equal to the current group id of the current chat page
     if (message.sendID == uid || message.groupID == gid) {
        if (!chatMsgList.contains(message)) {
	 			 // New message in current chat page
          chatMsgList.add(event.message);
        }
     }
});

// Add message listener
OpenIM.iMManager.messageManager.addAdvancedMsgListener(msgListener);

// Remove message monitoring
// After adding a message listener, if the page disposes, please remove the listener
// OpenIM.iMManager.messageManager.removeAdvancedMsgListener(msgListener);
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
   onlineUserOnly: false,
   userID: uid, // Single chat value is not null
   groupID: gid, // The group chat value is not null
 ).then((v) {
   // Sent successfully
 }).catchError((e){
   // Failed to send
 });
```

#### 9，Sign out

```
OpenIM.iMManager.logout();
```



####  OpenIM.iMManager

| method           | description                     |
| ---------------- | ------------------------------- |
| initSDK          | Initialize SDK                  |
| unInitSDK        |                                 |
| login            | Log in                          |
| logout           | Sign out                        |
| getLoginStatus   | Login status                    |
| getLoginUid      | Current user id                 |
| getLoginUserInfo | Current user information        |
| setSelfInfo      | Modify current user information |
| getUsersInfo     | Get user information by user id |
| forceReConn      | Force reconnection              |



#### OpenIM.iMManager.conversationManager

| method                  | description                 |
| ----------------------- | --------------------------- |
| setConversationListener | Listener                    |
| getAllConversationList  | Get all conversation        |
| getSingleConversation   | Get a single conversation   |
| getMultipleConversation | Get multiple conversation   |
| deleteConversation      | Delete conversation         |
| setConversationDraft    | Set  conversation draftText |
| pinConversation         | Top conversation            |



#### OpenIM.iMManager.friendshipManager

| method                   | description                 |
| ------------------------ | --------------------------- |
| setFriendshipListener    | Listener                    |
| getFriendsInfo           | Get friend information      |
| addFriend                | Add friends                 |
| getFriendApplicationList | Get friend application list |
| getFriendList            | Get friends list            |
| setFriendInfo            | Edit friend notes           |
| addToBlackList           | Add to blacklist            |
| getBlackList             | Get blacklist list          |
| deleteFromBlackList      | Remove from blacklist       |
| checkFriend              | Check friendship            |
| deleteFromFriendList     | Remove friend               |
| acceptFriendApplication  | Accept friend application   |
| refuseFriendApplication  | Reject friend application   |



#### OpenIM.iMManager.messageManager

| method                                      | description                       |
| ------------------------------------------- | --------------------------------- |
| addAdvancedMsgListener                      | Add message listener              |
| removeAdvancedMsgListener                   | Remove message listener           |
| setMsgSendProgressListener                  | Message sending progress listener |
| sendMessage                                 | Send a message                    |
| getHistoryMessageList                       | Get history news                  |
| revokeMessage                               | Revoke message                    |
| deleteMessageFromLocalStorage               | Delete message                    |
| insertSingleMessageToLocalStorage           | Insert message                    |
| findMessages                                | Query the message by id           |
| markSingleMessageHasRead                    | Mark single chat messages as read |
| markGroupMessageHasRead                     | Mark group chat messages as read  |
| <font color=red>markC2CMessageAsRead</font> | Mark c2c message as read          |
| <font color=red>typingStatusUpdate</font>   | Typing prompt                     |
| createTextMessage                           | Create text message               |
| createTextAtMessage                         | Create @ message                  |
| createImageMessage                          | Create picture message            |
| createSoundMessage                          | Create voice message              |
| createVideoMessage                          | Create video message              |
| createFileMessage                           | Create file message               |
| createMergerMessage                         | Create merge message              |
| createForwardMessage                        | Create a forwarded message        |
| getTotalUnreadMsgCount                      | Get unread message count          |



#### OpenIM.iMManager.groupManager

| method                  | description                     |
| ----------------------- | ------------------------------- |
| setGroupListener        | Listener                        |
| inviteUserToGroup       | Invite into the group           |
| kickGroupMember         | Remove group members            |
| getGroupMembersInfo     | Get group member information    |
| getGroupMemberList      | Get group members               |
| getJoinedGroupList      | Get joined groups               |
| isJoinedGroup           | Check you have joined the group |
| createGroup             | Create a group                  |
| setGroupInfo            | Set group information           |
| getGroupsInfo           | Get group information           |
| joinGroup               | Join group                      |
| quitGroup               | Exit group                      |
| transferGroupOwner      | Group permission transfer       |
| getGroupApplicationList | Get group application list      |
| acceptGroupApplication  | Accept group invitation         |
| refuseGroupApplication  | Decline group invitation        |
