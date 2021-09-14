

## 1，初始化

```
OpenIM.iMManager.initSDK(
      //参考IMPlatform类
      platform: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
      ipApi: '',
      ipWs: '',
      dbPath: '',
      listener: OnInitSDKListener(
        connecting: () {
          // 正在连接到服务器
        },
        connectFailed: (code, error) {
          // 连接服务器失败
        },
        connectSuccess: () {
          // 已经成功连接到服务器
        },
        kickedOffline: () {
          // 当前用户被踢下线
        },
        userSigExpired: () {
          // 登录票据已经过期
        },
        selfInfoUpdated: (info) {
          // 当前用户的资料发生了更新
        },
      ),
    );
```

初始化接口包含五个必填参数 (platform,ipApi,ipWs,dbPath,listener)

#### platform

类IMPlatform的值

```
class IMPlatform {
  static const ios = 1;
  static const android = 2;
  static const windows = 3;
  static const xos = 4;
  static const web = 5;
  static const mini_web = 6;
  static const linux = 7;
}
```

#### ipApi

SDK的API接口地址。如：http:xxx:10000

#### ipWs

SDK的web socket地址。如： ws:xxx:17778

#### dbPath

数据缓存路径。如：var apath =(await getApplicationDocumentsDirectory()).path

<font color='red'> 注：在创建图片，语音，视频，文件等需要路径参数的消息体时，如果选择的是非全路径方法如：createSoundMessage（全路径方法为：createSoundMessageFromFullPath），需要将文件自行拷贝到apath目录下，如果此时文件路径为 apath+"/sound/a.mp3"，则参数path的值为：/sound/a.mp3。如果选择的全路径方法，路径为你文件的实际路径不需要再拷贝。 </font>

#### listener

初始化监听回调

| 事件回调          | 事件描述                 | 推荐操作                                                     |
| ----------------- | ------------------------ | ------------------------------------------------------------ |
| onConnecting      | 正在连接到服务器         | 适合在 UI 上展示“正在连接”状态。                             |
| onConnectSuccess  | 连接服务器失败           | -                                                            |
| onConnectFailed   | 已经成功连接到服务器     | 可以提示用户当前网络连接不可用                               |
| onKickedOffline   | 当前用户被踢下线         | 此时可以 UI 提示用户“您已经在其他端登录了当前账号，是否重新登录？” |
| onUserSigExpired  | 登录票据已经过期         | 请使用新签发的 UserSig 进行登录。                            |
| onSelfInfoUpdated | 当前用户的资料发生了更新 | 可以在 UI 上更新自己的头像和昵称。                           |

### 2，登录

```
OpenIM.iMManager.login(uid: uid, token: token);
```

参数uid跟token为必传参数，它们的值通过接口地址 http://xxx/auth/user_token获取

#### 获取当前用户id

```
OpenIM.iMManager.getLoginUid()
```

#### 获取当前用户信息

```
OpenIM.iMManager.getLoginUserInfo();
```

#### 获取登录状态

```
OpenIM.iMManager.getLoginStatus();
```

### 3，会话

#### 拉取当前所有的会话记录，返回Future<List<ConversationInfo>>

```
OpenIM.iMManager.conversationManager.getAllConversationList()
```

如果你想获取单个回话使用方法<font color='blue'>getSingleConversation</font>，该方法有两个必传参数sourceID和sessionType。sourceID：如果是单聊其值为单聊对象的userId；如果是群聊其值为群的groupId。sessionType：如果是单聊sessionType=1；群聊sessionType=2。

如果你想获取多个回话使用方法<font color='blue'>getMultipleConversation</font>，参数多个回话id

#### 删除会话

执行此操作会触发会话记录发生改变回调。

```
OpenIM.iMManager.conversationManager.deleteConversation(
  conversationID: conversationID,
);
```

参数当前被删除的会话的id

#### 置顶会话

执行此操作会触发会话记录发生改变回调。

```
OpenIM.iMManager.conversationManager.pinConversation(
  conversationID: conversationID,
  isPinned: true,
);
```

isPinned：true置顶，false取消置顶。

注：ConversationInfo对象里的isPinned字段，isPinned==1代表置顶

#### 设置草稿

执行此操作会触发会话记录发生改变回调。

```
OpenIM.iMManager.conversationManager.setConversationDraft(
  conversationID: conversationID,
  draftText: draftText,
);
```

draftText（草稿）：未完成发送的消息内容。

#### 设置会话监听

会话记录发生改变时回调。

```
OpenIM.iMManager.conversationManager.setConversationListener(OnConversationListener(
  conversationChanged: (list){
  	// 会话记录改变
  },
  newConversation: (list){
  	// 新增会话
  },
  totalUnreadMsgCountChanged: (count){
  	// 未读消息总数改变
  },
  syncServerFailed: () {},
  syncServerFinish: () {},
  syncServerStart: () {},
));
```

| 事件回调                   | 事件描述             | 推荐操作       |
| -------------------------- | -------------------- | -------------- |
| conversationChanged        | 会话记录发生改变     | 刷新会话列表   |
| newConversation            | 有新的会话被添加     | 刷新会话列表   |
| totalUnreadMsgCountChanged | 未读消息总数发生改变 | 刷新消息未读数 |

### 4，好友关系

#### 查询好友列表，返回Future<List<UserInfo>>

```
OpenIM.iMManager.friendshipManager.getFriendList();
```

如果需要做联系人A-Z列表效果，推荐使用方法<font color='blue'>getFriendListMap</font>, 该方法返回值为Future<List<dynamic>> ，然后再将list转换为你自己的List Object，如：

```
OpenIM.iMManager.friendshipManager.getFriendListMap()
        .then((list) => list.map((e) => ContactsInfo.fromJson(e)).toList());
```

#### 添加好友

```
OpenIM.iMManager.friendshipManager.addFriend(uid: uid, reason: reason);
```

uid必传参数，值为被添加的用户uid。reason：添加说明，非必传参数。返回Future，执行then方法为添加成功，执行cathError方法为添加失败。

#### 删除好友

```
OpenIM.iMManager.friendshipManager.deleteFromFriendList(uid: uid);
```

返回Future，执行then方法为删除成功，执行cathError方法为删除失败。

#### 检查好友关系

返回Future<List<UserInfo>>

```
OpenIM.iMManager.friendshipManager.checkFriend([id1,id2, ...]);
```

根据类UserInfo的flag字段判断。flag == 1：是好友关系，其他非好友关系。

#### 获取好友信息

返回Future<List<UserInfo>> 

```
OpenIM.iMManager.getFriendsInfo([id1,id2, ...]);
```

#### 为好友添加备注

```
OpenIM.iMManager.friendshipManager.setFriendInfo(info: UserInfo(uid: uid, comment: ’这是备注‘))
```

参数info：UserInfo类，uid：好友的id，comment：备注。

注：只能为好友添加备注，其他好友信息无权限修改。

#### 获取好友申请列表

返回Future<List<UserInfo>>

```
OpenIM.iMManager.friendshipManager.getFriendApplicationList();
```

类UserInfo的flag字段：flag == 0：等待处理；flag == 1：已添加；flag == -1：已拒绝。

<font color='red'>注：新朋友的红点数通过计算列表里flag == 0的item的数量。</font>

#### 同意被加为好友

```
OpenIM.iMManager.friendshipManager.acceptFriendApplication(uid: uid)
```

uid：为好友申请列表返回的数据里UserInfo类的uid字段。返回Future，执行then方法为操作成功，执行cathError方法为操作失败。

#### 拒绝被加为好友

```
OpenIM.iMManager.friendshipManager.refuseFriendApplication(uid: uid)
```

返回Future，执行then方法为操作成功，执行cathError方法为操作失败。

#### 黑名单列表

返回Future<List<UserInfo>> 

```
OpenIM.iMManager.friendshipManager.getBlackList();
```

<font color='red'>注：如果好友被拉进黑名单，调用<font color='blue'>getFriendList 或 getFriendListMap</font>方法得到好友包含了黑名单的人，需要通过UserInfo类的isInBlackList字段筛选，如果isInBlackList == 1说明被拉入黑名单。</font>

#### 拉入黑名单

```
OpenIM.iMManager.friendshipManager.addToBlackList(uid: uid)
```

#### 从黑名单移除

```
OpenIM.iMManager.friendshipManager.deleteFromBlackList(uid: uid);
```

#### 设置关系改变监听

```
OpenIM.iMManager.friendshipManager.setFriendshipListener(OnFriendshipListener(
  blackListAdd: (u){
  	// 好友被加入黑名时单回调
  },
  blackListDeleted: (u){
    // 好友从黑名单移除时回调
  },
  friendApplicationListAccept: (u){
    // 发起的好友请求被接受时回调
  },
  friendApplicationListAdded: (u){
  	// 我接受被人的发起的好友请求时回调
  },
  friendApplicationListDeleted: (u){
  	// 删除好友请求时回调
  },
  friendApplicationListReject: (u){
  	// 请求被拒绝回调
  },
  friendInfoChanged: (u){
  	// 好友资料发生变化时回调
  },
  friendListAdded: (u){
  	// 已添加好友回调
  },
  friendListDeleted: (u){
  	// 好友被删除时回调
  },
));
```

| 事件回调                     | 事件描述                   | 推荐操作                           |
| ---------------------------- | -------------------------- | ---------------------------------- |
| blackListAdd                 | 好友被加入黑名             | 刷新好友列表或黑名单列表           |
| blackListDeleted             | 好友从黑名单移除           | 刷新好友列表或黑名单列表           |
| friendApplicationListAccept  | 发起的好友请求被接受       | 刷新好友请求列表                   |
| friendApplicationListAdded   | 我接受被人的发起的好友请求 | 刷新好友请求列表                   |
| friendApplicationListDeleted | 删除好友请求               | 刷新好友请求列表                   |
| friendApplicationListReject  | 请求被拒绝                 | 刷新好友请求列表                   |
| friendInfoChanged            | 好友资料发生变化           | 刷新好友列表，好友信息或黑名单列表 |
| friendListAdded              | 已成为好友                 | 刷新好友列表                       |
| friendListDeleted            | 好友被删除                 | 刷新好友列表                       |

### 5，群关系

#### 获取已加入的群列表

返回Future<List<GroupInfo>>

```
OpenIM.iMManager.groupManager.getJoinedGroupList();
```

如果类GroupInfo的ownerId字段的值跟当前用户的uid一致，则当前用户就是群的发起者。否则是参与者。

#### 创建群

```
OpenIM.iMManager.groupManager.createGroup(
  groupInfo: info,
  list: roles,
)
```

参数info（GroupInfo）：群资料，非必传；参数roles（List<GroupMemberRole>）在发起群聊时选择的群成员列表，必传字段。

GroupInfo类字段说明：groupName群名；notification群公告；introduction群介绍；faceUrl群icon。

GroupMemberRole类字段说明：setRole：0:普通成员 2:管理员；uid：成员的uid。

#### 获取群信息

根据群id获取群的信息，返回Future<List<GroupInfo>>

```
OpenIM.iMManager.groupManager.getGroupsInfo(gidList: [gid1,gid2,...]);
```

#### 设置群信息

```
OpenIM.iMManager.groupManager.setGroupInfo(groupInfo: gInfo)
```

只能设置群的名称（groupName），公告（notification），介绍（introduction）和icon（faceUrl）。groupID为系统生成的ID不能更改。ownerId也不能修改，修改群的拥有者需要调用群权限交接方法<font color='blue'>transferGroupOwner</font>。

#### 获取群成员列表

返回Future<GroupMembersList> ，GroupMembersList类的nextSeq字段：下一页的开始index。data字段：群成员。

```
OpenIM.iMManager.groupManager.getGroupMemberList(groupId: gid)
```

groupId：群id，必传。

filter：过滤成员，0不过滤，1群的创建者，2管理员， 非必传，默认值0。

next：分页，从哪一条开始获取，默认值0。参照nextSeq的值。

#### 邀请进群

```
OpenIM.iMManager.groupManager.inviteUserToGroup(
  groupId: gid,
  uidList: uidList,
  reason: reason,
);
```

gid：群的id，uidList：被邀请的好友uid，reason：邀请说明。

#### 踢出群

```
OpenIM.iMManager.groupManager.kickGroupMember(
  groupId: gid,
  uidList: uidList,
  reason: reason,
);
```

#### 申请加群

```
OpenIM.iMManager.groupManager.joinGroup(gid: gid, reason: null)
```

#### 变更群拥有者（发起者）

```
OpenIM.iMManager.groupManager.transferGroupOwner(gid: gid, uid: uid)
```

uid：新的拥有者uid。此方法只有群的发起者（拥有者）才有权限访问，管理员和普通成员无权限访问。如果是发起者群资料展示可显示群权限转移按钮。

#### 退群

```
OpenIM.iMManager.groupManager.quitGroup(gid: gid)
```

#### 群监听

```
OpenIM.iMManager.groupManager.setGroupListener(OnGroupListener(
  applicationProcessed: (groupId,  opUser,  agreeOrReject, opReason){
  	// 群申请被处理时回调
  },
  groupCreated: (groupId){
  	// 群创建完成时回调
  },
  groupInfoChanged: (groupId,  info){
  	// 群资料发生变化时回调
  },
  memberEnter: ( groupId, list){
  	// 有人进群时回调
  },
  memberInvited: ( groupId,  opUser,  list){
  	// 接受邀请时回调
  },
  memberKicked: ( groupId,  opUser,  list){
  	// 成员被踢出时回调
  },
  memberLeave: ( groupId,  info){
  	// 群成员退群时回调
  },
  receiveJoinApplication: ( groupId,  info,  opReason){
  	// 收到入群申请
  },
))
```

| 事件回调               | 事件描述       | 推荐操作       |
| ---------------------- | -------------- | -------------- |
| applicationProcessed   | 群申请被处理   |                |
| groupCreated           | 群创建完成     |                |
| groupInfoChanged       | 群资料发生变化 | 刷新群资料     |
| memberEnter            | 进群           | 刷新群成员列表 |
| memberInvited          | 接受邀请       | 刷新群成员列表 |
| memberKicked           | 成员被踢出     | 刷新群成员列表 |
| memberLeave            | 群成员退群     | 刷新群成员列表 |
| receiveJoinApplication | 收到入群申请   |                |

### 6，消息

#### 创建文本消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createTextMessage(
  text: '这里是消息内容',
)
```

#### 创建@消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createTextAtMessage(
   text: '消息内容',
   atUidList: [uid1,uid2,...],
);
```

atUidList：被@到的用户uid。

#### 创建图片消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createImageMessage(
  imagePath: '图片的相对路径',
)
```

<font color='red'>注：initSDK时传入了数据缓存路径，如路径：A，这时需要你将图片复制到A路径下后，如 A/pic/a.png路径，imagePath的值：“/pic/a.png”</font>。

#### 创建图片消息（全路径）

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createImageMessageFromFullPath(
  imagePath: path,
)
```

path: 文件在设备上的的实际路径。此方法不需要拷贝，<font color='blue'>推荐使用</font>。

#### 创建语音消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createSoundMessage(
  soundPath: '相对路径',
  duration: '语音时长',
)
```

<font color='red'>注：initSDK时传入了数据缓存路径，如路径：A，这时需要你将语音文件复制到A路径下后，如 A/sound/a.m4a路径，soundPath的值：“/sound/a.m4a”</font>。

#### 创建语音消息（全路径）

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createSoundMessageFromFullPath(
  soundPath: path,
  duration: duration,
)
```

soundPath: 文件在设备上的的实际路径。此方法不需要拷贝，<font color='blue'>推荐使用</font>。

#### 创建视频消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager
    .createVideoMessage(
        videoPath: path,
        videoType: type,
        duration: duration,
        snapshotPath: tPath)
```

videoPath：相对路径。videoType：文件的mineType。duration: 视频时长。snapshotPath：视频的缩略图。

<font color='red'>注：initSDK时传入了数据缓存路径，如路径：A，这时需要你将视频文件复制到A路径下后，如 A/video/a.mp4路径，videoPath的值：“/video/a.mp4”</font>

#### 创建视频消息（全路径）

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createVideoMessageFromFullPath(
  videoPath: videoPath,
  videoType: mimeType,
  duration: duration,
  snapshotPath: thumbnailPath,
)
```

videoPath: 文件在设备上的的实际路径。此方法不需要拷贝，<font color='blue'>推荐使用</font>。

#### 创建文件消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createFileMessage(
  filePath: filePath,
  fileName: fileName,
);
```

filePath: 文件的相对路径，fileName：文件名

<font color='red'>注：initSDK时传入了数据缓存路径，如路径：A，这时需要你将视频文件复制到A路径下后，如 A/file/a.txt路径，filePath的值：“/file/a.txt”</font>

#### 创建文件消息（全路径）

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createFileMessageFromFullPath(
  filePath: filePath,
  fileName: fileName,
)
```

filePath: 文件在设备上的的实际路径。此方法不需要拷贝，<font color='blue'>推荐使用</font>。

#### 创建位置消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createLocationMessage(
  latitude: ’纬度‘,
  longitude: ’经度‘,
  description: ’描述信息，可以根据自己的需求传任何数据‘,
)
```

description：在位置消息展示时，有位置名，位置描述，定位图片信息。推荐 description：{"title":"天府新谷","detail":"四川省高新区石羊街道府城大道西段399号","url":"https://apis.map.qq.com/ws/staticmap/v2/?center=%s&zoom=18&size=600*300&maptype=roadmap&markers=size:large|color:0xFFCCFF|label:k|%s&key=TMNBZ-3CGC6-C6SSL-EJA3B-E2P5Q-V7F6Q"}

#### 创建引用消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createQuoteMessage(
  text: '消息内容',
  quoteMsg: '被引用的消息对象Message',
)
```

#### 创建名片消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createCardMessage(
  data: '用户信息Map',
)
```

data接收一个Map值：如{"uid": uid, 'name': name, 'icon': icon}，按需求定义。

#### 创建合并消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createMergerMessage(
  messageList: '被选中的消息',
  title: '标题',
  summaryList: '摘要',
)
```

#### 创建转发消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createForwardMessage(
  message: '被转发的Message',
)
```

#### 创建自定义消息

返回Future<Message> 

```
OpenIM.iMManager.messageManager.createCustomMessage(
   data: '自定义数据',
   extension: '自定义数据',
   description: '自定义数据',
 )
```

#### 发送消息

```
OpenIM.iMManager.messageManager
    .sendMessage(
      message: message,
      userID: userId,
      groupID: groupId,
    )
    .then((value) => _sendSucceeded(message))
    .catchError((e) => _senFailed(message, e))
    .whenComplete(() => _completed())
```

message：创建的消息体。userID：用户id。groupID：组id。如果一对一聊天 userID不能为空。如果群聊天groupID不能为空。如果消息发送成功执行then方法，发送失败执行catchError方法。

#### 提示用户正在输入

```
OpenIM.iMManager.messageManager.typingStatusUpdate(
  userID: uid,
  typing: '',
)
```

单聊使用此功能。userID单聊对象id。typing：true正在输入，false停止输入。

<font color='red'>注：在收到的新消息回调里如果消息类型为typing消息且typing == 'yes'提示正在输入。typing=='no'取消提示</font>

#### 撤回消息

```
OpenIM.iMManager.messageManager.revokeMessage(message: message)
```

message：被撤回的消息体。

<font color='red'>注：调用此方法会触发消息撤回回调，可以在回调里移除界面上的消息显示。也会触发新增消息回调，新增的消息类型为撤回消息类型，可以在界面显示一条xx撤回了一条消息</font>

#### 标记消息为已读

```
OpenIM.iMManager.messageManager.markC2CMessageAsRead(
  userID: userID,
  messageIDList: [msgId1,msgId2,..],
)
```

单聊使用此功能。userID单聊对象id。messageIDList：被标记为已读消息的消息id。

<font color='red'>注：调用此方法会触发c2c消息已读回调，可以在回调里修改界面上的消息已读状态</font>

#### 获取聊天记录

```
OpenIM.iMManager.messageManager
    .getHistoryMessageList(
      userID: '单聊对象id',
      groupID: '群聊群id',
      count: '获取的条数',
      startMsg:'从哪一个消息开始'
    )
```

如果是单聊窗口userID不能为空，如果是群聊窗口groupID不能为空。startMsg：如第一次拉取20条记录startMsg=null&&count=20得到List<Message> list；下一次拉取消息记录参数：startMsg=list.first && count =20；以此内推，startMsg始终为list的第一条。

#### 设置消息监听

```
OpenIM.iMManager.messageManager.addAdvancedMsgListener(OnAdvancedMsgListener(
  recvMessageRevoked: (msgId){
  		// 消息被撤回回调
  	  var revokedMsg = Message(clientMsgID: msgId);
      messageList.remove(revokedMsg);
  },
  recvC2CReadReceipt: (List<HaveReadInfo> list){
  		// 消息已读回执
  		 messageList.forEach((e) {
  		 	// 获取当前聊天窗口的已读回执
         var info = list.firstWhere((element) => element.uid == uid);
        // 标记消息列表里对应的消息为已读状态
        if (info.msgIDList?.contains(e.clientMsgID) == true) {
          e.isRead = true;
        }
      });
  },
  recvNewMessage: (msg){
  	// 如果是当前窗口的消息
      if (isCurrentChat(message)) {
        // 正在输入消息
        if (message.contentType == MessageType.typing) {
         // 
        } else {
      		// 新增消息
          if (!messageList.contains(message)) {
            messageList.add(message);
          }
        }
      }
  },
))
```

| 事件回调           | 事件描述       | 推荐操作         |
| ------------------ | -------------- | ---------------- |
| recvMessageRevoked | 消息成功撤回   | 从界面移除消息   |
| recvC2CReadReceipt | 消息被阅读回执 | 将消息标记为已读 |
| recvNewMessage     | 收到新消息     | 界面添加新消息   |

#### 消息发送进度监听

主要用途：图片，视频，文件等上传进度监听。

```
OpenIM.iMManager.messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
  progressCallback: (String msgId, int progress){
  	// 根据消息id，判断图片等上传进度
  },
))
```

### 7，退出

#### 反初始化

```
OpenIM.iMManager.unInitSDK();
```

#### 登出

```
OpenIM.iMManager.logout();
```

