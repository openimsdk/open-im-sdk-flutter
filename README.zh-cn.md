## SDK使用步骤

##### 1，初始化

```
OpenIM.iMManager.initSDK(
    platform: 0, // 平台，参照IMPlatform类,
    apiAddr: "", // SDK的API接口地址。如：http:xxx:10000
    wsAddr: "",  // SDK的web socket地址。如： ws:xxx:17778
    dataDir: "", // 数据存储路径。如：var apath =(await getApplicationDocumentsDirectory()).path
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

##### 2，设置监听器

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
      ));
```

##### 3，登录

```
 OpenIM.iMManager.login(
      uid: "", // uid来自于自身业务服务器
      token: "", // token需要业务服务器根据secret向OpenIM服务端交换获取
    ).then((userInfo) {
      // 返回当前登录用户的资料
    });
```



## 方法名、参数、返回值说明

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
OpenIM.iMManager.conversationManager.getConversationRecvMessageOpt(
      conversationIDList: [], // 会话id列表
 ).then((list) {
    // 返回列表 [{"conversationId":"single_13922222222","result":0}] 
    // result: 1：不接受消息；2：接受在线消息不接受离线消息；0：正常
 });
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
      atUidList: [], // 被@到的userID集合
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