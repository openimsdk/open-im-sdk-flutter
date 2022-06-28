# flutter_openim_sdk
[![pub package](https://img.shields.io/pub/v/flutter_openim_sdk.svg)](https://pub.flutter-io.cn/packages/flutter_openim_sdk)
[![Generic badge](https://img.shields.io/badge/platform-android%20|%20ios%20-blue.svg)](https://pub.dev/packages/flutter_openim_sdk)
[![GitHub license](https://img.shields.io/github/license/OpenIMSDK/Open-IM-SDK-Flutter)](https://github.com/OpenIMSDK/Open-IM-SDK-Flutter/blob/main/LICENSE)

A flutter im plugin for android and ios.

####  [demo源代码](https://github.com/OpenIMSDK/Open-IM-Flutter-Demo.git) | [UI库源代码](https://github.com/hrxiang/flutter_openim_widget.git)

扫描下方二维码即可体验SDK调用示例 Demo

![Android](https://www.pgyer.com/app/qrcode/OpenIM)



## 开始使用


#### 1，添加依赖到yaml

       flutter_openim_sdk: latest

#### 2，导入包

      import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

#### 3，[初始化](#initsdk%E5%88%9D%E5%A7%8B%E5%8C%96sdk)

#### 4，[设置监听器](#%E7%9B%91%E5%90%AC%E5%99%A8%E8%AE%BE%E7%BD%AE)

#### 5，[登录](#login%E7%99%BB%E5%BD%95)



## 类方法说明

#### IMManager（初始化管理）

| 方法             | 描述                                          |
| ---------------- | --------------------------------------------- |
| initSDK          | 初始化SDK                                     |
| unInitSDK        | 反初始化SDK                                   |
| login            | 登录                                          |
| logout           | 登出                                          |
| getLoginStatus   | 获取登录状态                                  |
| getLoginUserID   | 登录者用户ID                                  |
| getLoginUserInfo | 登录者用户资料                                |
| wakeUp           | 唤醒socket通信（当app从后台回到前台恢复通信） |
| uploadImage      | 上传图片到服务器                              |



#### UserManager（用户信息管理）

| 方法            | 描述                     |
| --------------- | ------------------------ |
| setUserListener | 当前登录用户信息变更监听 |
| getUsersInfo    | 根据userID获取用户资料   |
| getSelfUserInfo | 获取当前登录用户资料     |
| setSelfInfo     | 修改当前登录用户资料     |



#### ConversationManager（会话管理）

| 方法                              | 描述                                   |
| --------------------------------- | -------------------------------------- |
| setConversationListener           | 会话监听                               |
| getAllConversationList            | 获取所有会话                           |
| getConversationListSplit          | 分页获取会话                           |
| getOneConversation                | 查询会话，如果会话不存在会自动生成一个 |
| getMultipleConversation           | 根据会话id获取多个会话                 |
| deleteConversation                | 通过会话id删除指定会话                 |
| setConversationDraft              | 设置会话草稿                           |
| pinConversation                   | 置顶会话                               |
| markGroupMessageHasRead           | 标记群聊会话已读                       |
| getTotalUnreadMsgCount            | 获取未读消息总数                       |
| getConversationIDBySessionType    | 查询会话id                             |
| setConversationRecvMessageOpt     | 消息免打扰设置                         |
| getConversationRecvMessageOpt     | 查询免打扰状态                         |
| setOneConversationPrivateChat     | 阅后即焚                               |
| deleteConversationFromLocalAndSvr | 删除本地以及服务器的会话               |
| deleteAllConversationFromLocal    | 删除所有本地会话                       |
| resetConversationGroupAtType      | 重置强提醒标识                         |
| getAtAllTag                       | 查询@所有人标识                        |
| setGlobalRecvMessageOpt           | 全局免打扰设置                         |



#### FriendshipManager（好友关系管理）

| 方法                         | 描述                                               |
| ---------------------------- | -------------------------------------------------- |
| setFriendshipListener        | 好友关系监听                                       |
| getFriendsInfo               | 查询好友信息                                       |
| addFriend                    | 发送一个好友请求，需要对方调用同意申请才能成为好友 |
| getRecvFriendApplicationList | 获取别人加我为好友的申请                           |
| getSendFriendApplicationList | 获取我发出的好友申请                               |
| getFriendList                | 获取好友列表，返回的列表包含了已拉入黑名单的好友   |
| setFriendRemark              | 设置好友备注                                       |
| addBlacklist                 | 加入黑名单                                         |
| getBlacklist                 | 获取黑名单列表                                     |
| removeBlacklist              | 从黑名单移除                                       |
| checkFriend                  | 检查友好关系                                       |
| deleteFriend                 | 删除好友                                           |
| acceptFriendApplication      | 接受好友请求                                       |
| refuseFriendApplication      | 拒绝好友请求                                       |
| searchFriends                | 查好友                                             |



#### GroupManager（组/群关系管理）

| 方法                         | 描述                                     |
| ---------------------------- | ---------------------------------------- |
| setGroupListener             | 组关系监听                               |
| inviteUserToGroup            | 邀请进组，直接进组无需同意               |
| kickGroupMember              | 移除组成员                               |
| getGroupMembersInfo          | 查询组成员资料                           |
| getGroupMemberList           | 分页获取组成员列表                       |
| getJoinedGroupList           | 查询已加入的组列表                       |
| isJoinedGroup                | 检查是否已加入组                         |
| createGroup                  | 创建一个组                               |
| setGroupInfo                 | 编辑组资料                               |
| getGroupsInfo                | 查询组信息                               |
| joinGroup                    | 申请加入组，需要通过管理员/群组同意。    |
| quitGroup                    | 退出组                                   |
| transferGroupOwner           | 转移组拥有者权限                         |
| getRecvGroupApplicationList  | 作为群主或者管理员，收到的群成员入群申请 |
| getSendGroupApplicationList  | 获取自己发出的入群申请记录               |
| acceptGroupApplication       | 管理员或者群主同意某人进入某群           |
| refuseGroupApplication       | 管理员或者群主拒绝某人进入某群           |
| dismissGroup                 | 解散群                                   |
| changeGroupMute              | 开启群禁言，所有群成员禁止发言           |
| changeGroupMemberMute        | 禁言群成员                               |
| setGroupMemberNickname       | 设置群成员昵称                           |
| searchGroups                 | 查询群                                   |
| setGroupMemberRoleLevel      | 设置群成员权限                           |
| getGroupMemberListByJoinTime | 根据加入时间分页获取组成员列表           |



#### MessageManager（消息管理）

| 方法                                    | 描述                                                         |
| --------------------------------------- | ------------------------------------------------------------ |
| setAdvancedMsgListener                  | 消息监听                                                     |
| setMsgSendProgressListener              | 消息发送进度监听                                             |
| sendMessage                             | 发送消息                                                     |
| getHistoryMessageList                   | 获取聊天记录(以startMsg为节点，以前的聊天记录)               |
| revokeMessage                           | 撤回消息                                                     |
| deleteMessageFromLocalStorage           | 删除本地消息                                                 |
| insertSingleMessageToLocalStorage       | 插入单聊消息到本地                                           |
| insertGroupMessageToLocalStorage        | 插入群聊消息到本地                                           |
| markC2CMessageAsRead                    | 标记c2c单条消息已读                                          |
| markGroupMessageAsRead                  | 标记群聊消息已读                                             |
| typingStatusUpdate                      | 正在输入提示                                                 |
| createTextMessage                       | 创建文本消息                                                 |
| createTextAtMessage                     | 创建@消息                                                    |
| createImageMessage                      | 创建图片消息                                                 |
| createImageMessageFromFullPath          | 创建图片消息                                                 |
| createSoundMessage                      | 创建语音消息                                                 |
| createSoundMessageFromFullPath          | 创建语音消息                                                 |
| createVideoMessage                      | 创建视频消息                                                 |
| createVideoMessageFromFullPath          | 创建视频消息                                                 |
| createFileMessage                       | 创建文件消息                                                 |
| createFileMessageFromFullPath           | 创建文件消息                                                 |
| createMergerMessage                     | 创建合并消息                                                 |
| createForwardMessage                    | 创建转发消息                                                 |
| createLocationMessage                   | 创建位置消息                                                 |
| createCustomMessage                     | 创建自定义消息                                               |
| createQuoteMessage                      | 创建引用消息                                                 |
| createCardMessage                       | 创建卡片消息                                                 |
| createFaceMessage                       | 创建自定义表情消息                                           |
| clearC2CHistoryMessage                  | 清空单聊消息记录                                             |
| clearGroupHistoryMessage                | 清空组消息记录                                               |
| searchLocalMessages                     | 搜索消息                                                     |
| deleteMessageFromLocalAndSvr            | 删除本地跟服务器的指定的消息                                 |
| deleteAllMsgFromLocal                   | 删除本地所有聊天记录                                         |
| deleteAllMsgFromLocalAndSvr             | 删除本地跟服务器所有聊天记录                                 |
| markMessageAsReadByConID                | 标记消息已读                                                 |
| clearC2CHistoryMessageFromLocalAndSvr   | 删除本地跟服务器的单聊聊天记录                               |
| clearGroupHistoryMessageFromLocalAndSvr | 删除本地跟服务器的群聊天记录                                 |
| getHistoryMessageListReverse            | 获取聊天记录(以startMsg为节点，新收到的聊天记录)，用在全局搜索定位某一条消息，然后此条消息后新增的消息 |



#### OrganizationManager（组织架构管理）

| 方法                    | 描述                                           |
| ----------------------- | ---------------------------------------------- |
| setOrganizationListener | 组织架构发生变化回调                           |
| getSubDept              | 获取子部门列表，返回当前部门下的一级子部门     |
| getDeptMember           | 获取部门下的成员列表，返回当前部门下的一级成员 |
| getUserInDept           | 获取成员所在的部门                             |
| getDeptMemberAndSubDept | 获取部门下的子部门跟员工                       |
| getDeptInfo             | 查询部门信息                                   |
| searchOrganization      | 搜索组织人员                                   |



#### SignalingManager（信令管理）

| 方法                   | 描述                     |
| ---------------------- | ------------------------ |
| setSignalingListener   | 信令监听                 |
| signalingInvite        | 邀请个人加入音视频       |
| signalingInviteInGroup | 邀请群里某些人加入音视频 |
| signalingAccept        | 同意某人音视频邀请       |
| signalingReject        | 拒绝某人音视频邀请       |
| signalingCancel        | 邀请者取消音视频通话     |
| signalingHungUp        | 挂断                     |



#### WorkMomentsManager（朋友圈管理）

| 方法                         | 描述                   |
| ---------------------------- | ---------------------- |
| setWorkMomentsListener       | 朋友圈信息发送变化通知 |
| getWorkMomentsUnReadCount    | 获取朋友圈未读消息总数 |
| getWorkMomentsNotification   | 获取通知列表           |
| clearWorkMomentsNotification | 清除通知列表           |



## 方法名、参数、返回值说明

- ##### initSDK（初始化SDK）

```
OpenIM.iMManager.initSDK(
    platform: 0, // 平台，参照IMPlatform类,
    apiAddr: "", // SDK的API接口地址。如：http://xxx:10000
    wsAddr: "",  // SDK的web socket地址。如： ws://xxx:17778
    dataDir: "", // 数据存储路径。如：var apath =(await getApplicationDocumentsDirectory()).path
    objectStorage: 'cos', // 图片服务器默认'cos'
    logLevel: 6, // 日志等级，默认值6
    listener: OnConnectListener(
      onConnectSuccess: () {
        // 已经成功连接到服务器
      },
      onConnecting: () {
        // 正在连接到服务器，适合在 UI 上展示“正在连接”状态。
      },
      onConnectFailed: (code, errorMsg) {
        // 连接服务器失败，可以提示用户当前网络连接不可用
      },
      onUserSigExpired: () {
        // 登录票据已经过期，请使用新签发的 UserSig 进行登录。
      },
      onKickedOffline: () {
        // 当前用户被踢下线，此时可以 UI 提示用户“您已经在其他端登录了当前账号，是否重新登录？”
      },
    ),
  ).then((value){
      if(value == true){
        // 初始化成功
      }
  });
```



- ##### login（登录）

```
OpenIM.iMManager.login(
      uid: "", // uid来自于自身业务服务器
      token: "", // token需要业务服务器根据secret向OpenIM服务端交换获取
    ).then((userInfo) {
      // 返回当前登录用户的资料
    });
```



- ##### logout（ 登出）

```
 OpenIM.iMManager.logout().then((_){
      // 退出成功
 });
```



- ##### getLoginUserInfo（获取当前登录用户的资料）

```
OpenIM.iMManager.getLoginUserInfo().then((userInfo){
     // 当前登录用户的信息
 });
```



- ##### getLoginUserID（获取当前登录用户的ID）

```
 OpenIM.iMManager.getLoginUserID().then((userID){
     // 当前登录用户的ID
  });
```



- ##### getUsersInfo（根据用户ID批量获取用户信息）

```
 OpenIM.iMManager.userManager.getUsersInfo(
      uidList: [], // 用户ID集合
   ).then((userInfoList) {
      // 用户信息列表
  });
```



- ##### getSelfUserInfo（获取当前登录用户的资料）

```
 OpenIM.iMManager.userManager.getSelfUserInfo().then((userInfo){
      // 返回当前登录用户的资料
  });
```



- ##### setSelfInfo（修改当前用登录户资料）

会触发当用户的onSelfInfoUpdated回调，以及好友的onFriendInfoChanged、onConversationChanged回调。

```
  OpenIM.iMManager.userManager.setSelfInfo(
      nickname: '',  // 昵称
      faceURL: '',  // 头像
      gender: 0,  // 性别: 男1，女0
      phoneNumber: '', // 手机号
      email: '', //邮箱
      birth: 0,  //生日
      ex: '',  // 其他信息
    );
```



- ##### getAllConversationList（获取所有会话）

```
 OpenIM.iMManager.conversationManager.getAllConversationList().then((list) {
      // List<ConversationInfo> 会话列表
  });
```



- ##### getConversationListSplit（分页获取会话）

```
OpenIM.iMManager.conversationManager.getConversationListSplit(
      offset: 0, // 偏移量，如：第1页，offet：0，count：20；第2页：offset：20；
      count: 0, // 每页数量
 ).then((list) {
     // List<ConversationInfo> 会话列表
 });
```



- ##### getOneConversation（获取一个会话，如果不存在会自动创建）

```
OpenIM.iMManager.conversationManager.getOneConversation(
      sourceID: "", // 如果是单聊值传userID，如果是群聊groupID
      sessionType: 1, // 如果是单聊值传1，如果是群聊值传2
 ).then((info) {
     // 会话信息
 });
```



- ##### getMultipleConversation（根据会话id查询会话）

```
 OpenIM.iMManager.conversationManager.getMultipleConversation(
      conversationIDList: [], // 会话ID集合
    ).then((list) {
      // 返回与id匹配的会话列表
  });
```



- ##### deleteConversation（根据会话id删除指定会话)

会触onTotalUnreadMessageCountChanged回调

```
OpenIM.iMManager.conversationManager.deleteConversation(
     conversationID: "", // 会话id
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### setConversationDraft（设置会话草稿）

会触onConversationChanged回调

```
OpenIM.iMManager.conversationManager.setConversationDraft(
      conversationID: "", // 会话id
      draftText: "", // 草稿
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### pinConversation（置顶会话）

会触onConversationChanged回调

```
OpenIM.iMManager.conversationManager.pinConversation(
      conversationID: "", // 会话id
      isPinned: true, // true：置顶；false：取消置顶
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### markGroupMessageHasRead（标记群会话已读，清除未读数）

会触onConversationChanged、onTotalUnreadMessageCountChanged回调

```
OpenIM.iMManager.conversationManager.markGroupMessageHasRead(
      groupID: "", // 组id
 );
```



- ##### getTotalUnreadMsgCount（获取未读消息总数）

```
OpenIM.iMManager.conversationManager.getTotalUnreadMsgCount().then((count){
	// 总数
});
```



- ##### getConversationIDBySessionType（查询会话id）

```
  OpenIM.iMManager.conversationManager.getConversationIDBySessionType(
      sourceID: "", // 如果是单聊值传userID，如果是群聊groupID
      sessionType: 1, // 如果是单聊值传1，如果是群聊值传2
  ).then((conversationID){
  	// 会话ID
  });
```



- ##### setConversationRecvMessageOpt（设置免打扰模式）

```
OpenIM.iMManager.conversationManager.setConversationRecvMessageOpt(
      conversationIDList: [], // 会话id列表
      status: 1, // 1：不接受消息；2：接受在线消息不接受离线消息；0：正常
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getConversationRecvMessageOpt（查询免打扰状态）

```
/// 此方法已废弃，使用getOneConversation/getMultipleConversation方法替代
OpenIM.iMManager.conversationManager.getConversationRecvMessageOpt(
      conversationIDList: [], // 会话id列表
 ).then((list) {
    // 返回列表 [{"conversationId":"single_13922222222","result":0}] 
    // result: 1：不接受消息；2：接受在线消息不接受离线消息；0：正常
 });
```



- ##### setOneConversationPrivateChat（开启阅后即焚）

```
OpenIM.iMManager.conversationManager.setOneConversationPrivateChat(
      conversationID:"", // 会话id
      isPrivate:true,//true开启
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### deleteConversationFromLocalAndSvr（删除本地跟服务器端会话记录）

```
OpenIM.iMManager.conversationManager.deleteConversationFromLocalAndSvr(
      conversationID:"", // 会话id
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### deleteAllConversationFromLocal（清空本地所有会话）

```
OpenIM.iMManager.conversationManager.deleteAllConversationFromLocal(
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### resetConversationGroupAtType（重置会话强提示标识位）

```
OpenIM.iMManager.conversationManager.resetConversationGroupAtType(
      conversationID:"", // 会话id
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getAtAllTag（@所有标识）

```
OpenIM.iMManager.conversationManager.getAtAllTag();
```



- ##### setGlobalRecvMessageOpt（设置全局免打扰状态）

```
OpenIM.iMManager.conversationManager.setGlobalRecvMessageOpt(
	status: status,// 0：正常；1：不接受消息；2：接受在线消息不接受离线消息；
);
```



- ##### simpleSort（自定义会话排序规则）

```
var list = OpenIM.iMManager.conversationManager.simpleSort([]);// 返回排序好的列表
```



- ##### getFriendsInfo（根据userID查询好友资料）

```
 OpenIM.iMManager.friendshipManager.getFriendsInfo(
      uidList: [], // userId列表
    ).then((list) {
      // List<UserInfo>
 });
```



- ##### addFriend（发起好友申请）

主动申请者收到OnFriendApplicationAdded

被添加者收到OnFriendApplicationAdded 

```
 OpenIM.iMManager.friendshipManager.addFriend(
      uid: "", // 用户id
      reason: '', // 发起好友申请的描述信息
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### checkFriend（检查是否是好友）

```
OpenIM.iMManager.friendshipManager.checkFriend(
      uidList: [], // userID 列表
  ).then((list) {
      // List<FriendshipInfo>
 });
```



- ##### deleteFriend（删除好友）

操作者收到OnFriendDeleted

```
OpenIM.iMManager.friendshipManager.deleteFriend(
    uid: '', // userID
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### setFriendRemark（好友备注设置）

操作者收到OnFriendInfoChanged

```
 OpenIM.iMManager.friendshipManager.setFriendRemark(
      uid: '', // 好友userID
      remark: '', // 备注名
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getFriendList（好友列表）

返回的数据里包含已拉入黑名单的好友，可以根据isBlacklist字段筛选。

```
OpenIM.iMManager.friendshipManager.getFriendList().then((list){
      //  List<UserInfo> 好友信息列表
});
```



- ##### getRecvFriendApplicationList（收到的好友申请）

```
 OpenIM.iMManager.friendshipManager.getRecvFriendApplicationList().then((list) {
      // List<FriendApplicationInfo> 申请列表
 });
```



- ##### getSendFriendApplicationList（发出的好友申请）

```
OpenIM.iMManager.friendshipManager.getSendFriendApplicationList().then((list){
      // List<FriendApplicationInfo> 申请列表
 });
```



- ##### addBlacklist（拉黑好友）

操作者收到OnBlackAdded

```
 OpenIM.iMManager.friendshipManager.addBlacklist(
      uid: "", // 好友userID
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getBlacklist（黑名单）

```
OpenIM.iMManager.friendshipManager.getBlacklist().then((list){
      // List<UserInfo>
   });
```



- ##### removeBlacklist（移除黑名单）

操作者收到OnBlackDeleted

```
OpenIM.iMManager.friendshipManager.removeBlacklist(
      uid: "", // userID
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### acceptFriendApplication（接受好友申请）

操作者收到OnFriendApplicationAccepted、OnFriendAdded

申请者收到OnFriendApplicationAccepted、OnFriendAdded

```
OpenIM.iMManager.friendshipManager.acceptFriendApplication(
      uid: "", // userID
      handleMsg: '', // 备注信息
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### refuseFriendApplication（拒绝好友申请）

操作者收到OnFriendApplicationRejected

申请者收到OnFriendApplicationRejected 

```
 OpenIM.iMManager.friendshipManager.refuseFriendApplication(
      uid: "", // userID
      handleMsg: '', // 备注信息
 ).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### searchFriends（搜索好友）

```
var list = await OpenIM.iMManager.friendshipManager.searchFriends(
      keywordList: [searchCtrl.text.trim()],//关键词
      isSearchNickname: true,//按昵称查找
      isSearchRemark: true,//按备注查找
 );
```



- ##### inviteUserToGroup（邀请进组）

直接进组无需同意。

被邀请者收到OnJoinedGroupAdded

群成员（不包括被邀请者）收到OnGroupMemberAdded 

```
  OpenIM.iMManager.groupManager.inviteUserToGroup(
    groupId: '', // 组ID
    uidList: [], // 成员 userID 列表
    reason: '', // 备注信息
  ).then((list){
    // List<GroupInviteResult>
  });
}
```



- ##### kickGroupMember（移除组成员）

被踢者收到OnJoinedGroupDeleted

群成员收到OnGroupMemberDeleted 

```
OpenIM.iMManager.groupManager.kickGroupMember(
  groupId: '', // 组ID
  uidList: [], // 成员 userID 列表
  reason: '', // 备注信息
).then((list){
    // List<GroupInviteResult>
 });
```



- ##### getGroupMembersInfo（查询组成员信息）

```
OpenIM.iMManager.groupManager.getGroupMembersInfo(
  groupId: '', // 组ID
  uidList: [], // 成员 userID 列表
).then((list){
  // List<GroupMembersInfo>
});
```



- ##### getGroupMemberList（组成员列表）

```
OpenIM.iMManager.groupManager.getGroupMemberList(
  groupId: '', // 组ID
  filter: 0, // 1普通成员, 2群主，3管理员
  offset: 0, // 偏移量，每次开始的index值
  count: 0, // 每次拉取的数量
).then((list){
  // List<GroupMembersInfo>
});
```



- ##### getJoinedGroupList（获取已加入的群组）

```
OpenIM.iMManager.groupManager.getJoinedGroupList().then((list){
  // List<GroupInfo>
});
```



- ##### isJoinedGroup（检查是否已入群）

```
OpenIM.iMManager.groupManager.isJoinedGroup(
  gid: '', // 组ID
).then((joned) {
  // true已加入；false未加入
});
```



- ##### createGroup（创建组）

初始成员收到OnJoinedGroupAdded

```
OpenIM.iMManager.groupManager.createGroup(
  groupName: '', // 组名
  faceUrl: '', // 头像
  notification: '', // 群公告
  introduction: '', // 群简介
  groupType: 0, // 类型
  ex: '', // 扩展信息
  list: [], // 成员角色集合 List<GroupMemberRole>
).then((groupInfo){
  // 返回组信息 GroupInfo
});
```



- ##### setGroupInfo（修改组信息）

群成员收到OnGroupInfoChanged

```
OpenIM.iMManager.groupManager.setGroupInfo(
  groupID: '',
  groupName: '', // 组名
  faceUrl: '', // 头像
  notification: '', // 群公告
  introduction: '', // 群简介
  ex: '', // 扩展信息
  needVerification: '',// 进群验证设置
);
```



- ##### getGroupsInfo（根据id查询组信息）

```
OpenIM.iMManager.groupManager.getGroupsInfo(
  gidList: [], // 组id集合
).then((list){
  // List<GroupInfo>
});
```



- ##### joinGroup（申请入群组）

需要通过管理员同意。

申请者收到OnGroupApplicationAdded

群主+管理员收到OnGroupApplicationAdded 

```
OpenIM.iMManager.groupManager.joinGroup(
  gid: '', // 组id
  reason: '', // 入群备注信息
);
```



- ##### quitGroup（退出组）

退出者收到OnJoinedGroupDeleted

群成员收到OnGroupMemberDeleted

```
OpenIM.iMManager.groupManager.quitGroup(
  gid: '', // 组id
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### transferGroupOwner（群转让）

```
OpenIM.iMManager.groupManager.transferGroupOwner(
  gid: '', // 组ID
  uid: '', // 新 owner userID
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getRecvGroupApplicationList（收到的入群申请）

作为群主或者管理员，获取收到的群成员申请进群列表。

```
OpenIM.iMManager.groupManager.getRecvGroupApplicationList().then((list){
  // List<GroupApplicationInfo>
});
```



- ##### getSendGroupApplicationList（发出的入群申请）

```
OpenIM.iMManager.groupManager.getSendGroupApplicationList().then((list){
  // List<GroupApplicationInfo>
});
```



- ##### acceptGroupApplication（接受入群申请）

申请者收到OnJoinedGroupAdded  OnGroupApplicationAccepted

群成员（不包括申请者）收到OnGroupMemberAdded

审批者（群主或者管理员）收到OnGroupMemberAdded OnGroupApplicationAccepted

```
OpenIM.iMManager.groupManager.acceptGroupApplication(
  gid: '', // 组ID
  uid: '', // 申请人userID
  handleMsg: '', // 备注信息
);
```



- ##### refuseGroupApplication（拒绝入群申请）

申请者收到OnGroupApplicationRejected

审批者（群主或者管理员）收到OnGroupApplicationRejected 

```
OpenIM.iMManager.groupManager.refuseGroupApplication(
  gid: '', // 组ID
  uid: '', // 申请人userID
  handleMsg: '', // 备注信息
);
```



- ##### dismissGroup（解散群）

```
OpenIM.iMManager.groupManager.dismissGroup(
  groupID: '', // 组ID
);
```



- ##### changeGroupMute（开启群禁言）

```
OpenIM.iMManager.groupManager.changeGroupMute(
  groupID: '', // 组ID
  mute:true, // 禁言
);
```



- ##### changeGroupMemberMute（对群成员禁言)

```
OpenIM.iMManager.groupManager.changeGroupMemberMute(
  groupID: '', // 组ID
  userID:'', // 群成员userID
  seconds:0, // 禁言时长s
);
```



- ##### setGroupMemberNickname（修改成员组昵称）

```
OpenIM.iMManager.groupManager.setGroupMemberNickname(
  groupID: '', // 组ID
  userID:'', // 群成员userID
  groupNickname:'', // 群昵称
);
```



- ##### searchGroups（搜索群）

```
List<GroupInfo> list = await OpenIM.iMManager.groupManager.searchGroups(
  keywordList: [], // 关键词
  isSearchGroupID: true, // 以id搜索
  isSearchGroupName: false, // 以群名搜索
);
```



- ##### setGroupMemberRoleLevel（设置群成员角色）

```
OpenIM.iMManager.groupManager.setGroupMemberRoleLevel(
  groupID: groupID,
  userID: userID,
  roleLevel: GroupRoleLevel.member,
)
```



- ##### getGroupMemberListByJoinTime（根据加入时间分页获取组成员列表）

```
// 如：获取消息发送前入群的成员，用于查看消息未读列表
var list = await OpenIM.iMManager.groupManager.getGroupMemberListByJoinTime(
  groupID: message.groupID!,
  joinTimeEnd: message.sendTime! ~/ 1000,
  offset: 0,
  count: 40,
  excludeUserIDList: [...hasReadIDList, OpenIM.iMManager.uid],// 排除的人员
);
```



- ##### sendMessage（发送消息）

```
OpenIM.iMManager.messageManager.sendMessage(
  message: Message(), // 消息体
  userID: '', // 接受消息的userID
  groupID: '', // 接受消息的群ID
  offlinePushInfo: OfflinePushInfo(), // 离线推送的消息备注
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### getHistoryMessageList（获取聊天记录）

```
OpenIM.iMManager.messageManager.getHistoryMessageList(
  userID: '', // 单聊对象的userID
  groupID: '', // 群聊的组id
  startMsg: null, // 消息体
  count: 0, // 每次拉取的数量
).then((list){
  // List<Message>
});
```

注：消息列表list，index == list.length -1 是最新的一条消息。 index == 0 是从最新的这条记录后的第19条。所以startMsg首次传null，

下次就是list.first（index == 0），以此类推。



- ##### revokeMessage（撤回消息）

撤回成功需要当前用户从列表里移除Message然后更新ui，而另外一方通过撤回监听（onRecvMessageRevoked）移除。

```
OpenIM.iMManager.messageManager.revokeMessage(
  message: Message(), // 消息体
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### deleteMessageFromLocalStorage（删除单条消息）

```
OpenIM.iMManager.messageManager.deleteMessageFromLocalStorage(
  message: Message(),
).then((_) {
    // 成功，从列表里移除Message，然后更新ui
 }).catchError((_){
 		// 失败
 });
```



- ##### insertSingleMessageToLocalStorage（向本地插入一条消息）

```
OpenIM.iMManager.messageManager.insertSingleMessageToLocalStorage(
  receiverID: '', // 接收者userID
  senderID: '', // 发送者userID
  message: Message(), // 消息体
);
```



- ##### markC2CMessageAsRead（标记c2c消息已读）

当调用此方法后，已读的消息会通过已读回执（onRecvC2CReadReceipt）告诉对方。

```
OpenIM.iMManager.messageManager.markC2CMessageAsRead(
  userID: '', // 接收者 userID
  messageIDList: [], // 已读的消息id列表
);
```



- ##### typingStatusUpdate（正在输入提示）

会通过onRecvNewMessage回调

```
OpenIM.iMManager.messageManager.typingStatusUpdate(
  userID: '', // 接收者 userID
  msgTip: '', // 自定义提示内容
);
```



- ##### clearC2CHistoryMessage（清空c2c聊天记录）

```
OpenIM.iMManager.messageManager.clearC2CHistoryMessage(
  uid: "", // userID
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### clearGroupHistoryMessage（清空群聊天记录）

```
OpenIM.iMManager.messageManager.clearGroupHistoryMessage(
  gid: '', // 群ID
).then((_) {
    // 成功
 }).catchError((_){
 		// 失败
 });
```



- ##### createTextMessage（文本消息）

```
var message = await OpenIM.iMManager.messageManager.createTextMessage(
  text: '', // 发送的内容
);
```



- ##### createTextAtMessage（@消息）

```
var message = await OpenIM.iMManager.messageManager.createTextAtMessage(
      text: '', // 发送的内容
      atUserIDList: [], // 被@到的用户ID集合
      atUserInfoList: [], // 被@到的用户Info集合
      quoteMessage: null, //被引用的消息体
 );
```



- ##### createImageMessage（图片消息，相对路径）

```
var message = await OpenIM.iMManager.messageManager.createImageMessage(
  imagePath: '', // 相对路径
);
```

注：initSDK时传入了数据缓存（dataDir）路径，如路径：A，这时需要你将图片复制到A路径下后，如 A/pic/a.png路径，imagePath的值：“/pic/a.png”。同以下其他消息的相对路径。



- ##### createImageMessageFromFullPath（图片消息全路径）

```
var message = await OpenIM.iMManager.messageManager.createImageMessageFromFullPath(
  imagePath: '', // 绝对路径
);
```



- ##### createSoundMessage（语音消息，相对路径）

```
var message = await OpenIM.iMManager.messageManager.createSoundMessage(
  soundPath: '', // 相对路径
  duration: 0, // 时长s
);
```



- ##### createSoundMessageFromFullPath（语音消息全路径）

```
var message = await OpenIM.iMManager.messageManager.createSoundMessageFromFullPath(
  soundPath: '', // 绝对路径
  duration: 0, // 时长s
);
```



- ##### createVideoMessage（视频消息，相对路径）

```
var message = await OpenIM.iMManager.messageManager.createVideoMessage(
  videoPath: '', // 相对路径
  videoType: '', // minetype
  duration: 0, // 时长s
  snapshotPath: '', // 站位缩略图
);
```



- ##### createVideoMessageFromFullPath（视频消息全路径）

```
var message = await OpenIM.iMManager.messageManager.createVideoMessageFromFullPath(
  videoPath: '', // 绝对路径
  videoType: '', // minetype
  duration: 0, // 时长s
  snapshotPath: '', // 站位缩略图
);
```



- ##### createFileMessage（文件消息，相对路径）

```
var message = await OpenIM.iMManager.messageManager.createFileMessage(
  filePath: '', // 相对路径
  fileName: '', // 文件名
);
```



- ##### createFileMessageFromFullPath（文件消息全路径）

```
var message = await OpenIM.iMManager.messageManager.createFileMessageFromFullPath(
  filePath: '', // 绝对路径
  fileName: '', // 文件名
);
```



- ##### createForwardMessage（转发消息）

```
var message = await OpenIM.iMManager.messageManager.createForwardMessage(
  message: Message(), // 被转发的消息体
);
```



- ##### createMergerMessage（合并消息）

```
var message = await OpenIM.iMManager.messageManager.createMergerMessage(
  messageList: [], // 被转发的消息列表
  title: '', // 标题
  summaryList: [], // 每一条消息摘要
);
```



- ##### createLocationMessage（位置消息）

```
var message = await OpenIM.iMManager.messageManager.createLocationMessage(
  latitude: 0,// 纬度
  longitude: 0, // 经度
  description: '', // 位置描述信息
);
```



- ##### createCustomMessage（自定义消息）

```
var message = await OpenIM.iMManager.messageManager.createCustomMessage(
  data: '', // 自定义内容
  extension: '', // 扩展信息
  description: '', // 描述消息
);
```



- ##### createQuoteMessage（引用消息/消息回复）

```
var message = await OpenIM.iMManager.messageManager.createQuoteMessage(
  text: '', // 回复内容
  quoteMsg: Message(), // 被回复的消息体
);
```



- ##### createCardMessage（名片消息）

```
OpenIM.iMManager.messageManager.createCardMessage(
  data: {}, // 自定义内容
);
```



- ##### searchLocalMessages（全局搜索)

```
SearchResult result = await OpenIM.iMManager.messageManager.searchLocalMessages(
  conversationID: null, // 根据会话查询，如果是全局搜索传null
  keywordList: [], // 搜索关键词列表，目前仅支持一个关键词搜索
  keywordListMatchType: 0, // 关键词匹配模式，1代表与，2代表或，暂时未用
  senderUserIDList: [], // 指定消息发送的uid列表 暂时未用
  messageTypeList: [], // 消息类型列表
  searchTimePosition: 0, // 搜索的起始时间点。默认为0即代表从现在开始搜索。UTC 时间戳，单位：秒
  searchTimePeriod: 0, // 从起始时间点开始的过去时间范围，单位秒。默认为0即代表不限制时间范围，传24x60x60代表过去一天
  pageIndex: 1, // 当前页数
  count: 10, // 每页数量
);
```



- ##### deleteMessageFromLocalAndSvr（删除本地跟服务器聊天记录）

```
OpenIM.iMManager.messageManager.createCardMessage(
  message: null, // 消息体
);
```



- ##### deleteAllMsgFromLocal（清空所有本地聊天记录）

```
OpenIM.iMManager.messageManager.deleteAllMsgFromLocal(
);
```



- ##### deleteAllMsgFromLocalAndSvr（清空本地跟服务器所有聊天记录)

```
OpenIM.iMManager.messageManager.deleteAllMsgFromLocalAndSvr(
);
```



- ##### markMessageAsReadByConID（标记会话里某些消息为已读）

```
OpenIM.iMManager.messageManager.markMessageAsReadByConID(
	conversationID: null, // 会话ID
	messageIDList: [], // 消息id列表
);
```



- ##### clearC2CHistoryMessageFromLocalAndSvr（清空单聊本地跟服务端聊天记录）

```
OpenIM.iMManager.messageManager.clearC2CHistoryMessageFromLocalAndSvr(
	uid: null, // 用户id
);
```



- ##### clearGroupHistoryMessageFromLocalAndSvr（清空群聊本地跟服务端聊天记录)

```
OpenIM.iMManager.messageManager.clearGroupHistoryMessageFromLocalAndSvr(
	gid: null, // 群组id
);
```



- ##### getHistoryMessageListReverse（获取新的聊天记录）

```
// 获取聊天记录(以startMsg为节点，新收到的聊天记录)，用在全局搜索定位某一条消息，然后此条消息后新增的消息
OpenIM.iMManager.messageManager.getHistoryMessageListReverse(
  userID: '', // 单聊对象的userID
  groupID: '', // 群聊的组id
  startMsg: null, // 消息体
  count: 0, // 每次拉取的数量
).then((list){
  // List<Message>
});
```



- ##### signalingInvite（邀请个人加入音视频通话）

```
SignalingCertificate sc = await OpenIM.iMManager.signalingManager.signalingInvite(
	info: null, // 信令对象SignalingInfo
);
```



- ##### signalingInviteInGroup（邀请群成员加入音视频通话)

```
SignalingCertificate sc = await OpenIM.iMManager.signalingManager.signalingInviteInGroup(
	info: null, // 信令对象SignalingInfo
);
```



- ##### signalingAccept（接受邀请）

```
SignalingCertificate sc = await OpenIM.iMManager.signalingManager.signalingAccept(
	info: null, // 信令对象SignalingInfo
);
```



- ##### signalingReject（拒绝邀请）

```
OpenIM.iMManager.signalingManager.signalingReject(
	info: null, // 信令对象SignalingInfo
);
```



- ##### signalingCancel（取消）

```
OpenIM.iMManager.signalingManager.signalingCancel(
	info: null, // 信令对象SignalingInfo
);
```



- ##### signalingHungUp（挂断）

```
OpenIM.iMManager.signalingManager.signalingHungUp(
	info: null, // 信令对象SignalingInfo
);
```



- ##### getSubDept（获取子部门列表，返回当前部门下的一级子部门）

```
var list = await OpenIM.iMManager.organizationManager.getSubDept(
	departmentID: '', // 部门id
	offset: 0, // 开始下标
	count: 40, // 每页大小
);
```



- ##### getDeptMember（获取部门下的成员列表，返回当前部门下的一级成员）

```
var list = await OpenIM.iMManager.organizationManager.getDeptMember(
	departmentID: '', // 部门id
	offset: 0, // 开始下标
	count: 40, // 每页大小
);
```



- ##### getUserInDept（获取成员所在的部门）

```
var list = await OpenIM.iMManager.organizationManager.getUserInDept(
	userID: '', // 成员id
);
```



- ##### getDeptMemberAndSubDept（获取部门下的子部门跟员工）

```
var detail = await OpenIM.iMManager.organizationManager.getDeptMemberAndSubDept(
	departmentID: '', // 部门id
);
```



- ##### getDeptInfo（查询部门信息）

```
var info = await OpenIM.iMManager.organizationManager.getDeptInfo(
	departmentID: '', // 部门id
);
```



- ##### searchOrganization（搜索组织人员）

```
var result = await OpenIM.iMManager.organizationManager.searchOrganization(
  keyWord: searchCtrl.text.trim(),
  isSearchUserName: true,
  isSearchEnglishName: true,
  isSearchPosition: true,
  offset: offset,
  count: count,
);
```



- ##### getWorkMomentsUnReadCount（获取朋友圈未读消息总数）

```
var count = await OpenIM.iMManager.workMomentsManager.getWorkMomentsUnReadCount();
```



- ##### getWorkMomentsNotification（获取朋友圈通知列表）

```
var list = await OpenIM.iMManager.workMomentsManager.getWorkMomentsNotification(
	offset:0,//开始下标
	count:40,//每页大小
);
```



- ##### clearWorkMomentsNotification（清除朋友圈通知列表）

```
OpenIM.iMManager.workMomentsManager.clearWorkMomentsNotification();
```



- ##### 监听器设置

```
OpenIM.iMManager
      ..userManager.setUserListener(OnUserListener(
        onSelfInfoUpdated: (userInfo) {
          // 当前登录用户资料变更回调
        },
      ))
      ..messageManager.setAdvancedMsgListener(OnAdvancedMsgListener(
        onRecvNewMessage: (message) {
          // 收到新消息，界面添加新消息
        },
        onRecvMessageRevoked: (messageID) {
          // 消息成功撤回，从界面移除消息
        },
        onRecvC2CReadReceipt: (list) {
          // 消息被阅读回执，将消息标记为已读
        },
      ))
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
        onProgress: (messageID, progress) {
          // 消息发送进度回调
        },
      ))
      ..friendshipManager.setFriendshipListener(OnFriendshipListener(
        onFriendApplicationRejected: (applicationInfo) {
          // 发出或收到的好友申请被拒绝
        },
        onFriendApplicationDeleted: (applicationInfo) {
          // 发出或收到的好友申请被删除
        },
        onFriendApplicationAdded: (applicationInfo) {
          // 发出或收到的好友申请被添加
        },
        onFriendApplicationAccepted: (applicationInfo) {
          // 发出或收到的好友申请已同意
        },
        onFriendAdded: (frinedInfo) {
          // 好友被添加
        },
        onFriendDeleted: (frinedInfo) {
          // 好友被删除
        },
        onFriendInfoChanged: (frinedInfo) {
          // 朋友的资料发生变化
        },
        onBlacklistDeleted: (blackInfo) {
          // 从黑名单删除
        },
        onBlacklistAdded: (blackInfo) {
          // 拉入黑名单
        },
      ))
      ..conversationManager.setConversationListener(OnConversationListener(
        onNewConversation: (list) {
          // 新增会话
        },
        onConversationChanged: (list) {
          // 已添加的会话发送改变
        },
        onTotalUnreadMessageCountChanged: (count) {
          // 未读消息数发送变化
        },
      ))
      ..groupManager.setGroupListener(OnGroupListener(
        onGroupMemberInfoChanged: (memberInfo) {
          // 组成员信息发生变化
        },
        onGroupMemberDeleted: (memberInfo) {
          // 组成员退出
        },
        onGroupMemberAdded: (memberInfo) {
          // 组成员进入
        },
        onGroupApplicationRejected: (applicationInfo) {
          // 发出或收到的组申请被拒绝
        },
        onGroupApplicationDeleted: (applicationInfo) {
          // 发出或收到的组申请被删除
        },
        onGroupApplicationAdded: (applicationInfo) {
          // 发出或收到的组申请有新增
        },
        onGroupApplicationAccepted: (applicationInfo) {
          // 发出或收到的组申请被接受
        },
        onJoinedGroupDeleted: (groupInfo) {
          // 退出群：退出者收到；踢出群：被踢者收到
        },
        onJoinedGroupAdded: (groupInfo) {
          // 创建群： 初始成员收到；邀请进群：被邀请者收到
        },
        onGroupInfoChanged: (groupInfo) {
          // 组资料变更
        },
      ))
      ..signalingManager.setSignalingListener(OnSignalingListener(
        onReceiveNewInvitation: (info) {
          // 被邀请者收到：音视频通话邀请
        },
        onInviteeRejected: (info) {
          // 邀请者收到：被邀请者拒绝音视频通话
        },
        onInviteeAccepted: (info) {
          // 邀请者收到：被邀请者同意音视频通话
        },
        onInvitationTimeout: (info) {
          // 邀请者收到：被邀请者超时未接通
        },
        onInvitationCancelled: (info) {
          // 被邀请者收到：邀请者取消音视频通话
        },
      ));
```

