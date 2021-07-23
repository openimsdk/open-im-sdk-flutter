# flutter_openim_sdk

A flutter IM plugin for android and ios.

##### [Android体验包(密码：123456)](https://www.pgyer.com/openim)

##### [demo地址](https://github.com/hrxiang/OpenIMFlutterDemo.git)

##### [SDK文档地址](xxxx)

## Getting Started


#### 1，在yaml里添加依赖

      flutter_openim_sdk:
         git:
            url: https://github.com/OpenIMSDK/Open-IM-SDK-Flutter.git

#### 2，导入package

      import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

#### 3， 初始化配置

```
// 初始化SDK
OpenIM.iMManager
  ..initSDK(
    platform: IMPlatform.ios,
    ipApi: 'Api接口地址',
    ipWs: 'WebSocket地址',
    dbPath: '数据库目录',
    listener: InitSDKListener(),
  )

  // 添加消息监听(不使用的时候remove)
  ..messageManager.addAdvancedMsgListener(AdvancedMsgListener())

  // 设置消息发送进度监听
  ..messageManager.setMsgSendProgressListener(MsgSendProgressListener())

  // 设置好友关系监听
  ..friendshipManager.setFriendshipListener(FriendshipListener())

  // 设置会话监听
  ..conversationManager.setConversationListener(ConversationListener())

  // 设置群监听
  ..groupManager.setGroupListener(GroupListener());
```

#### 4， 登录

```
 OpenIM.iMManager.login(uid: uid, token: token).then((value){
 	// 登录成功
 });
```

#### 5，获取会话列表

```
 OpenIM.iMManager.conversationManager.getAllConversationList().then((list) {
 	// 返回会话列表list
 });
```

#### 6，获取联系人列表

```
 OpenIM.iMManager.friendshipManager.getFriendList().then((list) {
   	// 返回好友列表list
 });
```

#### 7，获取聊天记录

```
List<Message> chatMsgList = List.empty(growable: true);
  
/// 自定义消息监听，新消息到达会触发onNewMessage方法回调
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

-   历史消息

```
  // 如果userID不为null，groupID为null，获取的是单聊消息
  // 如果userID为null，groupID不为null，获取的是群聊消息
  OpenIM.iMManager.messageManager.getHistoryMessageList(
          userID: uid,//用户id
          startMsg: startMsg,//上一条消息,取chatMsgList[0]
          groupID: gid,//群id
          count: 12,//分页大小
      )
      .then((list) => chatMsgList.addAll(list));
      
```

-  新消息

```
// 创建消息监听
// 在进入聊天界面后需要监听新消息然后渲染UI
// 每个聊天窗口都有唯一的uid（用户id）或gid（群组id）
// 根据uid或gid判断收到的消息是否属于当前窗口
var msgListener = CustomAdvancedMsgListener(onNewMessage: (message) {
     // 如果发送者id与当前聊天对象的id相等，或群组id与当前所在群id相等，则为当前窗口消息
     if (message.sendID == uid || message.groupID == gid) {
        if (!chatMsgList.contains(message)) {
	  // 当前聊天窗口新增消息
          chatMsgList.add(event.message);
        }
     }
});

// 添加消息监听
OpenIM.iMManager.messageManager.addAdvancedMsgListener(msgListener);

// 移除消息监听
// 添加消息监听后，如果界面dispose，请移除对应的监听
// OpenIM.iMManager.messageManager.removeAdvancedMsgListener(msgListener);
```

#### 8，发送消息

```
// 创建消息
var message = await OpenIM.iMManager.messageManager.createTextMessage(
     text: '我是消息内容',
 );
// 发送
OpenIM.iMManager.messageManager.sendMessage(
   message: message,
   onlineUserOnly: false,
   userID: uid,// 单聊值不为null
   groupID: gid,// 群聊值不为null
 ).then((v) {
   // 发送成功
 }).catchError((e){
   // 发送失败
 });
```

#### 9，登出

```
OpenIM.iMManager.logout();
```



####  OpenIM.iMManager

| 方法             | 描述                | 参数说明                                                     |
| ---------------- | ------------------- | ------------------------------------------------------------ |
| initSDK          | 初始化sdk           | platform：平台（IMPlatform）<br />ipApi：接口地址<br />ipWs：WebSocket地址<br />dbPath：数据本地存储路径以目录结尾 |
| unInitSDK        |                     |                                                              |
| login            | 登录                | uid：当前用户userID<br />token：用户的token                  |
| logout           | 登出                |                                                              |
| getLoginStatus   | 登录状态            |                                                              |
| getLoginUid      | 当前uid             |                                                              |
| getLoginUserInfo | 当前用户信息        |                                                              |
| setSelfInfo      | 修改资料            | info（UserInfo）：用户信息                                   |
| getUsersInfo     | 根据uid获取用户资料 | uidList：userId列表                                          |
| forceReConn      | 强制重连            |                                                              |



#### 会话管理：OpenIM.iMManager.conversationManager

| 方法                    | 描述         | 参数说明                                                     |
| ----------------------- | ------------ | ------------------------------------------------------------ |
| setConversationListener | 会话监听     |                                                              |
| getAllConversationList  | 获取所有会话 |                                                              |
| getSingleConversation   | 获取单个会话 | sourceID：单聊值为userID，群聊值为groupID；<br />sessionType：单聊值为1，群聊值为2 |
| getMultipleConversation | 获取多个会话 | conversationIDList：会话id列表                               |
| deleteConversation      | 删除会话     | conversationID：会话id                                       |
| setConversationDraft    | 会话草稿     | draftText：草稿                                              |
| pinConversation         | 会话置顶     | isPinned：true置顶，false取消置顶                            |



#### 好友关系管理：OpenIM.iMManager.friendshipManager

| 方法                     | 描述             | 参数说明                                                 |
| ------------------------ | ---------------- | -------------------------------------------------------- |
| setFriendshipListener    | 关系监听         |                                                          |
| getFriendsInfo           | 获取好友信息     | uidList：要查询的用户的userID集合                        |
| addFriend                | 添加朋友         | uid：对方的userID<br />reason：添加理由                  |
| getFriendApplicationList | 获取好友申请列表 |                                                          |
| getFriendList            | 获取好友列表     |                                                          |
| setFriendInfo            | 修改朋友备注     | info（UserInfo）：{"uid" : "userId", "comment" : "备注"} |
| addToBlackList           | 加入黑名单       |                                                          |
| getBlackList             | 获取黑名单列表   |                                                          |
| deleteFromBlackList      | 从黑名单移除     |                                                          |
| checkFriend              | 检查好友关系     |                                                          |
| deleteFromFriendList     | 移除好友         |                                                          |
| acceptFriendApplication  | 接受好友申请     |                                                          |
| refuseFriendApplication  | 拒绝好友申请     |                                                          |



#### 消息管理：OpenIM.iMManager.messageManager

| 方法                                        | 描述               | 参数说明                                                     |
| ------------------------------------------- | ------------------ | ------------------------------------------------------------ |
| addAdvancedMsgListener                      | 添加消息监听       |                                                              |
| removeAdvancedMsgListener                   | 移除消息监听       |                                                              |
| setMsgSendProgressListener                  | 消息发送进度监听   |                                                              |
| sendMessage                                 | 发送消息           | message：消息对象<br />userID：单聊的用户id<br />groupID：群聊的组id<br />onlineUserOnly：仅在线用户 |
| getHistoryMessageList                       | 获取历史消息       | startMsg：列表里的第一条消息<br />userID：单聊的用户id<br />groupID：群聊的组id<br />count：每页size |
| revokeMessage                               | 消息撤回           |                                                              |
| deleteMessageFromLocalStorage               | 删除消息           |                                                              |
| insertSingleMessageToLocalStorage           | 插入消息           |                                                              |
| findMessages                                | 根据消息id查询消息 | messageIDList：消息id集合                                    |
| markSingleMessageHasRead                    | 标记单聊消息为已读 |                                                              |
| markGroupMessageHasRead                     | 标记群聊消息为已读 |                                                              |
| <font color=red>markC2CMessageAsRead</font> | 标记c2c消息已读    |                                                              |
| <font color=red>typingStatusUpdate</font>   | 正在输入提示       |                                                              |
| createTextMessage                           | 创建文本消息       | text：输入的内容                                             |
| createTextAtMessage                         | 创建at消息         | atUidList：被@的用户id集合                                   |
| createImageMessage                          | 创建图片消息       | imagePath：路径                                              |
| createSoundMessage                          | 创建语音消息       | soundPath：路径<br />duration：时长                          |
| createVideoMessage                          | 创建视频消息       | videoPath：路径<br />videoType：视频类型<br />duration：时长<br />snapshotPath：缩略图 |
| createFileMessage                           | 创建文件消息       | filePath：路径<br />fileName：文件名                         |
| createMergerMessage                         | 创建合并消息       |                                                              |
| createForwardMessage                        | 创建转发消息       |                                                              |
| getTotalUnreadMsgCount                      | 获取消息未读数     |                                                              |



#### 组管理： OpenIM.iMManager.groupManager

| 方法                    | 描述               | 参数说明                                                     |
| ----------------------- | ------------------ | ------------------------------------------------------------ |
| setGroupListener        | 设置组关系监听     |                                                              |
| inviteUserToGroup       | 邀请进组           | groupId：组id<br />uidList：被邀请的用户id集合<br />reason：说明 |
| kickGroupMember         | 剔除组成员         | uidList：被剔除的用户id集合                                  |
| getGroupMembersInfo     | 获取组成员信息     | uidList：成员id集合                                          |
| getGroupMemberList      | 获取组成员         |                                                              |
| getJoinedGroupList      | 获取已加入的群组   |                                                              |
| isJoinedGroup           | 判断是否已加入群组 |                                                              |
| createGroup             | 创建群             | groupInfo：组信息对象<br />list：组成员角色列表              |
| setGroupInfo            | 设置群资料         |                                                              |
| getGroupsInfo           | 获取群信息         |                                                              |
| joinGroup               | 加入群             |                                                              |
| quitGroup               | 退出群             |                                                              |
| transferGroupOwner      | 群权限转移         |                                                              |
| getGroupApplicationList | 获取群申请列表     |                                                              |
| acceptGroupApplication  | 接受群邀请         |                                                              |
| refuseGroupApplication  | 拒绝群邀请         |                                                              |
