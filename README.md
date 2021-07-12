# flutter_openim_sdk

A Flutter im plugin.

##### [Android 体验包(密码：123456)](https://www.pgyer.com/openim)
##### [Flutter demo源码地址](https://github.com/hrxiang/OpenIMFlutterDemo.git)
##### [SDK文档地址](xxxx)

## Getting Started

#### 1，初始化 
  
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
      
#### 2，会话管理：      
       OpenIM.iMManager.conversationManager

#### 3，好友关系管理：  
        OpenIM.iMManager.friendshipManager

#### 4，消息管理：     
        OpenIM.iMManager.messageManager
        
#### 5，组管理：      
        OpenIM.iMManager.groupManager
