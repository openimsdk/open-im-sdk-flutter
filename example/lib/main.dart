
import 'package:flutter/material.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            TextButton(onPressed: () {}, child: Text('login')),
          ],
        ),
      ),
    );
  }

  void initSDK() {
    OpenIM.iMManager
        .initSDK(
      // "当前平台，参照IMPlatform类",
      platform: 0,
      // SDK的API接口地址。如：http:xxx:10000
      apiAddr: "",
      // SDK的web socket地址。如： ws:xxx:17778
      wsAddr: "",
      // 数据存储路径。如：var apath =(await getApplicationDocumentsDirectory()).path
      dataDir: "",
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
    )
        .then((value) {
      if (value == true) {
        // 初始化成功
      }
    });
  }

  void setLisenter() {
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
        onRecvC2CMessageReadReceipt: (list) {
          // 消息被阅读回执，将消息标记为已读
        },
        onRecvGroupMessageReadReceipt: (list){
          // 消息被阅读回执，将消息标记为已读
        }
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
  }

  void login() {
    OpenIM.iMManager
        .login(
      uid: "", // uid来自于自身业务服务器
      token: "", // token需要业务服务器根据secret向OpenIM服务端交换获取
    )
        .then((value) {
      // 返回当前登录用户的资料
    });
  }

  void imMager() {
    OpenIM.iMManager.logout().then((_) {
      // 退出成功
    });

    OpenIM.iMManager.getLoginUserInfo().then((userInfo) {
      // 当前登录用户的信息
    });

    OpenIM.iMManager.getLoginUserID().then((userID) {
      // 当前登录用户的ID
    });
  }

  void userManager() {
    OpenIM.iMManager.userManager.getUsersInfo(
      uidList: [], // 用户ID集合
    ).then((userInfoList) {
      // 用户信息列表
    });

    OpenIM.iMManager.userManager.getSelfUserInfo().then((userInfo) {
      // 返回当前登录用户的资料
    });

    OpenIM.iMManager.userManager
        .setSelfInfo(
          nickname: '',
          // 昵称
          faceURL: '',
          // 头像
          gender: 0,
          // 性别: 男1，女0
          phoneNumber: '',
          // 手机号
          email: '',
          //邮箱
          birth: 0,
          //生日
          ex: '', // 其他信息
        )
        .then((_) {});
  }

  void conversationManager() {
    OpenIM.iMManager.conversationManager.getAllConversationList().then((list) {
      // List<ConversationInfo> 会话列表
    });
    OpenIM.iMManager.conversationManager.getConversationListSplit(
      offset: 0, // 偏移量，如：第1页，offet：0，count：20；第2页：offset：20；
      count: 0, // 每页数量
    );
    OpenIM.iMManager.conversationManager.getOneConversation(
      sourceID: "", // 如果是单聊值传userID，如果是群聊groupID
      sessionType: 1, // 如果是单聊值传1，如果是群聊值传2
    );
    OpenIM.iMManager.conversationManager.getMultipleConversation(
      conversationIDList: [], // 会话ID集合
    ).then((list) {
      // 返回与id匹配的会话列表
    });
    OpenIM.iMManager.conversationManager
        .deleteConversation(
          conversationID: "", // 会话id
        )
        .then((_) => null)
        .catchError((_) {});
    OpenIM.iMManager.conversationManager.setConversationDraft(
      conversationID: "", // 会话id
      draftText: "", // 草稿
    );
    OpenIM.iMManager.conversationManager.pinConversation(
      conversationID: "", // 会话id
      isPinned: true, // true：置顶；false：取消置顶
    );
    OpenIM.iMManager.conversationManager.markGroupMessageHasRead(
      groupID: "", // 组id
    );
    OpenIM.iMManager.conversationManager.getTotalUnreadMsgCount();
    OpenIM.iMManager.conversationManager.getConversationIDBySessionType(
      sourceID: "", // 如果是单聊值传userID，如果是群聊groupID
      sessionType: 1, // 如果是单聊值传1，如果是群聊值传2
    );
    OpenIM.iMManager.conversationManager.setConversationRecvMessageOpt(
      conversationIDList: [], // 会话id列表
      status: 1, // 1：不接受消息；2：接受在线消息不接受离线消息；0：正常
    );
    // OpenIM.iMManager.conversationManager.getConversationRecvMessageOpt(
    //   conversationIDList: [], // 会话id列表
    // );
    OpenIM.iMManager.conversationManager.simpleSort([]);
  }

  void friendManager() {
    OpenIM.iMManager.friendshipManager.getFriendsInfo(
      uidList: [], // userId列表
    ).then((list) {
      // List<UserInfo>
    });
    OpenIM.iMManager.friendshipManager.addFriend(
      uid: "", // 用户id
      reason: '', // 发起好友申请的描述信息
    );
    OpenIM.iMManager.friendshipManager
        .getRecvFriendApplicationList()
        .then((value) {
      // List<FriendApplicationInfo> 申请列表
    });
    OpenIM.iMManager.friendshipManager
        .getSendFriendApplicationList()
        .then((list) {
      // List<FriendApplicationInfo> 申请列表
    });
    OpenIM.iMManager.friendshipManager.getFriendList().then((list) {
      //  List<UserInfo> 好友信息列表
    });
    OpenIM.iMManager.friendshipManager.setFriendRemark(
      uid: '', // 好友userID
      remark: '', // 备注名
    );
    OpenIM.iMManager.friendshipManager.addBlacklist(
      uid: "", // 好友userID
    );
    OpenIM.iMManager.friendshipManager.getBlacklist().then((list) {
      // List<UserInfo>
    });
    OpenIM.iMManager.friendshipManager.removeBlacklist(
      uid: "", // userID
    );
    OpenIM.iMManager.friendshipManager.checkFriend(
      uidList: [], // userID 列表
    ).then((value) {
      // List<FriendshipInfo>
    });
    OpenIM.iMManager.friendshipManager.deleteFriend(
      uid: '', // userID
    );
    OpenIM.iMManager.friendshipManager.acceptFriendApplication(
      uid: "", // userID
      handleMsg: '', // 备注信息
    );
    OpenIM.iMManager.friendshipManager.refuseFriendApplication(
      uid: "", // userID
      handleMsg: '', // 备注信息
    );
  }

  void groupManager() {
    OpenIM.iMManager.groupManager
        .inviteUserToGroup(
      groupId: '', // 组ID
      uidList: [], // 成员 userID 列表
      reason: '', // 备注信息
    )
        .then((list) {
      // List<GroupInviteResult>
    });

    OpenIM.iMManager.groupManager.kickGroupMember(
      groupId: '', // 组ID
      uidList: [], // userID 列表
      reason: '', // 备注信息
    );
    OpenIM.iMManager.groupManager.getGroupMembersInfo(
      groupId: '', // 组ID
      uidList: [], // 成员 userID 列表
    ).then((list) {
      // List<GroupMembersInfo>
    });

    OpenIM.iMManager.groupManager
        .getGroupMemberList(
      groupId: '', // 组ID
      filter: 0, // 1普通成员, 2群主，3管理员
      offset: 0, // 偏移量，每次开始的index值
      count: 0, // 每次拉取的数量
    )
        .then((list) {
      // List<GroupMembersInfo>
    });

    OpenIM.iMManager.groupManager.getJoinedGroupList().then((list) {
      // List<GroupInfo>
    });

    OpenIM.iMManager.groupManager
        .isJoinedGroup(
      gid: '', // 组ID
    )
        .then((joned) {
      // true已加入；false未加入
    });

    OpenIM.iMManager.groupManager.createGroup(
      groupName: '',
      // 组名
      faceUrl: '',
      // 头像
      notification: '',
      // 群公告
      introduction: '',
      // 群简介
      groupType: 0,
      // 类型
      ex: '',
      // 扩展信息
      list: [], // 成员角色集合 List<GroupMemberRole>
    ).then((groupInfo) {
      // 返回组信息 GroupInfo
    });

    OpenIM.iMManager.groupManager.setGroupInfo(
      groupID: '',
      groupName: '',
      // 组名
      faceUrl: '',
      // 头像
      notification: '',
      // 群公告
      introduction: '',
      // 群简介
      ex: '', // 扩展信息
    );

    OpenIM.iMManager.groupManager.getGroupsInfo(
      gidList: [], // 组id集合
    ).then((list) {
      // List<GroupInfo>
    });

    OpenIM.iMManager.groupManager.joinGroup(
      gid: '', // 组id
      reason: '', // 入群备注信息
    );

    OpenIM.iMManager.groupManager.quitGroup(
      gid: '', // 组id
    );
    OpenIM.iMManager.groupManager.transferGroupOwner(
      gid: '', // 组ID
      uid: '', // 新 owner userID
    );

    OpenIM.iMManager.groupManager.getRecvGroupApplicationList().then((list) {
      // List<GroupApplicationInfo>
    });
    OpenIM.iMManager.groupManager.getSendGroupApplicationList().then((list) {
      // List<GroupApplicationInfo>
    });
    OpenIM.iMManager.groupManager.acceptGroupApplication(
      gid: '', // 组ID
      uid: '', // 申请人userID
      handleMsg: '', // 备注信息
    );

    OpenIM.iMManager.groupManager.refuseGroupApplication(
      gid: '', // 组ID
      uid: '', // 申请人userID
      handleMsg: '', // 备注信息
    );
  }

  void messageManager() {
    OpenIM.iMManager.messageManager.sendMessage(
      message: Message(), // 消息体
      userID: '', // 接受消息的userID
      groupID: '', // 接受消息的群ID
      offlinePushInfo: OfflinePushInfo(), // 离线推送消息备注
    );
    OpenIM.iMManager.messageManager
        .getHistoryMessageList(
      userID: '', // 单聊对象的userID
      groupID: '', // 群聊的组id
      startMsg: null, // 消息体
      count: 0, // 每次拉取的数量
    )
        .then((list) {
      // List<Message>
    });
    OpenIM.iMManager.messageManager.revokeMessage(
      message: Message(), // 消息体
    );
    OpenIM.iMManager.messageManager.deleteMessageFromLocalStorage(
      message: Message(), // 消息体
    );
    OpenIM.iMManager.messageManager.insertSingleMessageToLocalStorage(
      receiverID: '', // 接收者userID
      senderID: '', // 发送者userID
      message: Message(), // 消息体
    );
    OpenIM.iMManager.messageManager.markC2CMessageAsRead(
      userID: '', // 接收者 userID
      messageIDList: [], // 已读的消息id列表
    );
    OpenIM.iMManager.messageManager.typingStatusUpdate(
      userID: '', // 接收者 userID
      msgTip: '', // 自定义提示内容
    );
    OpenIM.iMManager.messageManager.createTextMessage(
      text: '',
    );
    OpenIM.iMManager.messageManager.createTextAtMessage(
      text: '', // 发送的内容
      atUidList: [], // 被@到的userID集合
    );
    OpenIM.iMManager.messageManager.createImageMessage(
      imagePath: '', // 图片相对路径
    );
    OpenIM.iMManager.messageManager.createImageMessageFromFullPath(
      imagePath: '', // 图片的绝对路径
    );
    OpenIM.iMManager.messageManager.createSoundMessage(
      soundPath: '', // 相对路径
      duration: 0, // 时长
    );
    OpenIM.iMManager.messageManager.createSoundMessageFromFullPath(
      soundPath: '', // 绝对路径
      duration: 0, // 时长
    );
    OpenIM.iMManager.messageManager.createVideoMessage(
      videoPath: '', // 相对路径
      videoType: '', // minetype
      duration: 0, // 时长s
      snapshotPath: '', // 站位缩略图
    );
    OpenIM.iMManager.messageManager.createVideoMessageFromFullPath(
      videoPath: '', // 相对路径
      videoType: '', // minetype
      duration: 0, // 时长s
      snapshotPath: '', // 站位缩略图
    );
    OpenIM.iMManager.messageManager.createFileMessage(
      filePath: '', // 相对路径
      fileName: '', // 文件名
    );
    OpenIM.iMManager.messageManager.createFileMessageFromFullPath(
      filePath: '', // 相对路径
      fileName: '', // 文件名
    );
    OpenIM.iMManager.messageManager.createForwardMessage(
      message: Message(), // 转发消息体
    );
    OpenIM.iMManager.messageManager.createMergerMessage(
      messageList: [], // 被转发的消息列表
      title: '', // 标题
      summaryList: [], // 每一条消息摘要
    );
    OpenIM.iMManager.messageManager.createLocationMessage(
      latitude: 0, // 纬度
      longitude: 0, // 经度
      description: '', // 位置描述信息
    );
    OpenIM.iMManager.messageManager.createCustomMessage(
      data: '', // 自定义内容
      extension: '', // 扩展信息
      description: '', // 描述消息
    );
    OpenIM.iMManager.messageManager.createQuoteMessage(
      text: '', // 回复内容
      quoteMsg: Message(), // 被回复的消息体
    );
    OpenIM.iMManager.messageManager.createCardMessage(
      data: {}, // 自定义内容
    );
    OpenIM.iMManager.messageManager.clearC2CHistoryMessage(
      uid: "", // 清空聊天记录
    );
    OpenIM.iMManager.messageManager.clearGroupHistoryMessage(
      gid: '', // 群ID
    );
  }
}
