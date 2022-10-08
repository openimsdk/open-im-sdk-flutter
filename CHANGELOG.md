## 2.3.4+1

- Add signalingGetTokenByRoomID method for SignalingManager

## 2.3.4

- Fix bug
- Add signalGetRoomByGroupID method for SignalingManager
- Add class RoomCallingInfo
- Add onRoomParticipantConnected listener for OnSignalingListener
- Add onRoomParticipantDisconnected listener for OnSignalingListener
- Add busyLineUserIDList field for SignalingCertificate

## 2.3.3

- Fix bug

## 2.3.2

- Fix bug
- Add createAdvancedQuoteMessage method for MessageManager
- Add createAdvancedTextMessage method for MessageManager

## 2.3.0+1

- Fix bug
- enum class MessageType new add customMsgNotTriggerConversation
- enum class MessageType new add customMsgOnlineOnly
- class IMManager new add updateFcmToken method
- class MessageManager new add findMessageList method
- initSDK method add encryptionKey param

## 2.3.0

- Fix bug
- Super group
- Add setGroupLookMemberInfo method for GroupManager
- Add setGroupApplyMemberFriend method for GroupManager
- Add getGroupOwnerAndAdmin method for GroupManager
- Add revokeMessageV2 method for MessageManager
- Add lookMemberInfo field for GroupInfo
- Add applyMemberFriend field for GroupInfo
- Add notificationUpdateTime field for GroupInfo
- Add notificationUserID field for GroupInfo
- Add inviterUserID field for GroupMembersInfo
- Add joinSource field for joinGroup method
- Add advanced revoke type
- Add recvMessageRevokedV2 callback for OnAdvancedMsgListener
- Add joinSource field for GroupApplicationInfo
- Add inviterUserID field for GroupApplicationInfo
- Add getAdvancedHistoryMessageList method for MessageManager
- Add searchGroupMembers method for GroupManager

## 2.2.0

1.Fix bug </br>

## 2.1.0+1

1.Add setGroupVerification method </br>

## 2.1.0

1.Fix bug </br>
2.Add getGroupMemberListByJoinTime method </br>
3.Add groupMemberCount field </br>

## 2.0.9+3

1.Fix bug </br>
2.Add setGlobalRecvMessageOpt method </br>

## 2.0.9+2

1.Fix bug </br>
2.Add searchOrganization method </br>
3.Add searchFriends method </br>
4.Add getDepartmentInfo method </br>
5.Add setGroupMemberRoleLevel method </br>

## 2.0.9+1

1.Fix bug </br>

## 2.0.9

1.Fix bug </br>
2.Add organization fuction </br>
3.Add uploadImage method </br>
4.Fix login slow bug </br>

## 2.0.8

1.Fix bug </br>
2.Change the sdk maven address </br>
3.Sync go IM sdk version number </br>

## 2.0.0+6

1.Fix bug </br>
2.Adapter ios emulator </br>
3.Add modify group nickname </br>
4.Update at message </br>
5.ConverstaionInfo new add isNotInGroup field</br>
6.Add at type </br>
7.Add work moments </br>
8.Add global search </br>
9.Add getHistoryMessageListReverse method </br>
10.Add getAtAllTag method </br>
11.Add resetConversationGroupAtType method </br>
12.Add searchGroups method </br>

## 2.0.0+5

1.Add notification parse </br>
2.Add deleteConversationFromLocalAndSvr method </br>
3.Add deleteMessageFromLocalAndSvr method </br>
4.Add deleteAllMsgFromLocal method </br>
5.Add deleteAllMsgFromLocalAndSvr method </br>
6.Add clearC2CHistoryMessageFromLocalAndSvr method </br>
7.Add clearGroupHistoryMessageFromLocalAndSvr method </br>
8.Add markMessageAsReadByConID method </br>
9.Add wakeUp method </br>
10.Add deleteAllConversationFromLocal method </br>

## 2.0.0+4

1.Add dismiss group </br>
2.Add search local message </br>
3.Add private chat </br>
4.Add group mute

## 2.0.0+3

1.Fix bug </br>

## 2.0.0+2

1.Fix some one crash </br>
2.Add signaling function </br>
3.Add group have read receipt

## 2.0.0+1

1.Fix multi-terminal synchronization bug fix for retracted messages </br>
2.Fix sending picture flashback bug </br>
3.Fix other bug

## 2.0.0

1.Refactor mobile sdk, server sdk (2022-2-21)

## 1.1.1

1.Update sdk maven url

## 1.1.0

1.Fix the problem of missing id in ios message progress

## 1.0.9

1.Upgrade sdk to 1.4.5.

## 1.0.8

1.Upgrade sdk to 1.4.4. </br>
2.Add changed conversation return changed data and no longer return all data. </br>
3.Add conversation paging method.

## 1.0.7

Upgrade sdk to 1.3.4 </br>
Add method setConversationRecvMessageOpt and getConversationRecvMessageOpt

## 1.0.6

Upgrade sdk to 1.2.9

## 1.0.5

Upgrade sdk to 1.2.8

## 1.0.4

New add clear c2c message and group message </br>
Update sdk to 1.1.9

## 1.0.3

Fix android message error bug </br>
Update SDK to 1.1.5 </br>

## 1.0.2

Upgrade sdk </br>

1. Android to 1.1.3 </br>
2. Ios replace framework </br>

## 1.0.1

Fix bug

## 1.0.0

Fix bug

## 0.0.9+5

1. Android upgrade sdk to 0.0.17 </br>
2. Add createFileMessageFromFullPath method

## 0.0.9+4

Fix ios friendship params error

## 0.0.9+3

Ios native remove method 'removeAdvancedMsgListener'

## 0.0.9+2

1. Fix bug
2. Upgrade sdk

## 0.0.9+1

Fix bug

## 0.0.9

Add ios support

## 0.0.8

Upgrade sdk to 0.0.14 </br>
Sending a message adds a retry mechanism

## 0.0.7

1. Add a new method to obtain conversation id based on user id or group id </br>
2. Modify the type of conversation manager input parameter sessionType to int

## 0.0.6

Fix bug

## 0.0.5

Upgrade sdk </br>
Fix message error bug

## 0.0.4

Replace the input parameters of the createCustomMessage method from Uint8List to Map

## 0.0.3

Upgrade sdk </br>
Fix bug </br>

## 0.0.2

1. Move the markSingleMessageHasRead, markGroupMessageHasRead and getTotalUnreadMsgCount methods
   from the MessageManager class to the ConversationManager class. </br>
2. Modify the parameters of the setFriendInfo method. </br>
3. Modify the parameters of the createGroup and setGroupInfo methods.

## 0.0.1

Initial release.
