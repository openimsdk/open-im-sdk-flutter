# flutter_openim_sdk

A Flutter im plugin.

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

### Usage

#### 初始化

    var msgListener = AdvancedMsgListener();
    
    /// 初始化SDK
    OpenIM.iMManager
      ..initSDK(
        platform: 0,
        ipApi: 'Api接口地址',
        ipWs: 'WebSocket地址',
        dbPath: '数据库目录',
        listener: new InitSDKListener(),
      )
    
      /// 添加消息监听(移除消息监听: OpenIM.iMManager.messageManager.removeAdvancedMsgListener(msgListener))
      ..messageManager.addAdvancedMsgListener(msgListener)
    
      /// 设置发送消息进度监听
      ..messageManager.setMsgSendProgressListener(MsgSendProgressListener())
    
      /// 设置好友关系监听
      ..friendshipManager.setFriendshipListener(FriendshipListener())
    
      /// 设置会话监听
      ..conversationManager.setConversationListener(ConversationListener())
    
      /// 设置群监听
      ..groupManager.setGroupListener(GroupListener());

####  OpenIM.iMManager

| 方法             | 描述                                                    |
| ---------------- | ------------------------------------------------------- |
| initSDK          | 初始化sdk，platform：iOS-1，Android-0；listener初始监听 |
| unInitSDK        |                                                         |
| login            | 登录                                                    |
| logout           | 登出                                                    |
| getLoginStatus   | 登录状态                                                |
| getLoginUid      | 当前userid                                              |
| getLoginUserInfo | 当前登录用户信息                                        |
| setSelfInfo      | 修改资料                                                |
| getUsersInfo     | 根据uid获取用户资料                                     |
| forceReConn      | 强制重连                                                |



#### 会话管理：OpenIM.iMManager.conversationManager

| 方法                    | 描述                                                         |
| ----------------------- | ------------------------------------------------------------ |
| setConversationListener | 会话监听                                                     |
| getAllConversationList  | 获取所有会话                                                 |
| getSingleConversation   | 获取单个会话sourceID(String)：单聊值为userID，群聊值为groupID；sessionType(int)：单聊值为1，群聊值为2 |
| getMultipleConversation | 获取多个会话                                                 |
| deleteConversation      | 删除会话                                                     |
| setConversationDraft    | 会话草稿                                                     |
| pinConversation         | 会话置顶                                                     |



#### 好友关系管理：OpenIM.iMManager.friendshipManager

| 方法                     | 描述                                                |
| ------------------------ | --------------------------------------------------- |
| setFriendshipListener    | 关系监听                                            |
| getFriendsInfo           | 获取好友信息                                        |
| addFriend                | 添加朋友                                            |
| getFriendApplicationList | 获取好友申请列表                                    |
| getFriendList            | 获取好友列表                                        |
| setFriendInfo            | 修改朋友备注 {"uid" : "userId", "comment" : "备注"} |
| addToBlackList           | 加入黑名单                                          |
| getBlackList             | 获取黑名单列表                                      |
| deleteFromBlackList      | 从黑名单移除                                        |
| checkFriend              | 检查好友关系                                        |
| deleteFromFriendList     | 移除好友                                            |
| acceptFriendApplication  | 接受好友申请                                        |
| refuseFriendApplication  | 拒绝好友申请                                        |



#### 消息管理：OpenIM.iMManager.messageManager

| 方法                              | 描述                                           |
| --------------------------------- | ---------------------------------------------- |
| addAdvancedMsgListener            | 添加消息监听                                   |
| removeAdvancedMsgListener         | 移除消息监听                                   |
| setMsgSendProgressListener        | 消息发送进度监听                               |
| sendMessage                       | 发送消息，单聊useID, 群聊groupID               |
| getHistoryMessageList             | 获取历史消息，startMsg分页传列表里的第一条消息 |
| revokeMessage                     | 消息撤回                                       |
| deleteMessageFromLocalStorage     | 删除消息                                       |
| insertSingleMessageToLocalStorage | 插入消息                                       |
| findMessages                      | 根据消息id查询消息                             |
| markSingleMessageHasRead          | 标记消息为已读                                 |
| markGroupMessageHasRead           | 标记消息为已读                                 |
| createTextMessage                 | 创建文本消息                                   |
| createTextAtMessage               | 创建at消息，atUserList为at的userId列表         |
| createImageMessage                | 创建图片消息                                   |
| createSoundMessage                | 创建语音消息                                   |
| createVideoMessage                | 创建视频消息                                   |
| createFileMessage                 | 创建文件消息                                   |
| createMergerMessage               | 创建合并消息                                   |
| createForwardMessage              | 创建转发消息                                   |
| getTotalUnreadMsgCount            | 获取消息未读数                                 |



#### 组管理： OpenIM.iMManager.groupManager

| 方法                    | 描述               |
| ----------------------- | ------------------ |
| setGroupListener        | 设置组关系监听     |
| inviteUserToGroup       | 邀请进组           |
| kickGroupMember         | 剔除组成员         |
| getGroupMembersInfo     | 获取组成员信息     |
| getGroupMemberList      | 获取组成员         |
| getJoinedGroupList      | 获取已加入的群组   |
| isJoinedGroup           | 判断是否已加入群组 |
| createGroup             | 创建群             |
| setGroupInfo            | 设置群资料         |
| getGroupsInfo           | 获取群信息         |
| joinGroup               | 加入群             |
| quitGroup               | 退出群             |
| transferGroupOwner      | 群权限交接         |
| getGroupApplicationList | 获取群申请列表     |
| acceptGroupApplication  | 接受群邀请         |
| refuseGroupApplication  | 拒绝群邀请         |

