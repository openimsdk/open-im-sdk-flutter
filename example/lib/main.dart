import 'dart:io';

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
    _initSDK();
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
            TextButton(onPressed: _login, child: Text('login')),
          ],
        ),
      ),
    );
  }

  void _login() {
    if (OpenIM.iMManager.isInitialized)
      OpenIM.iMManager.login(uid: '', token: '');
  }

  void _initSDK() async {
    // Initialize SDK
    OpenIM.iMManager
      ..initSDK(
        platform: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
        ipApi: '',
        ipWs: '',
        dbPath: '',
        listener: OnInitSDKListener(
          onConnecting: () {},
          onConnectFailed: (code, error) {},
          onConnectSuccess: () {},
          onKickedOffline: () {},
          onUserSigExpired: () {},
          onSelfInfoUpdated: (user) {},
        ),
      )

      // Add message listener (remove when not in use)
      ..messageManager.addAdvancedMsgListener(OnAdvancedMsgListener(
        onRecvMessageRevoked: (msgId) {},
        onRecvC2CReadReceipt: (list) {},
        onRecvNewMessage: (msg) {},
      ))

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
        onProgress: (msgId, progress) {},
      ))

      // Set up friend relationship listener
      ..friendshipManager.setFriendshipListener(OnFriendshipListener(
        onBlackListAdd: (u) {},
        onBlackListDeleted: (u) {},
        onFriendApplicationListAccept: (u) {},
        onFriendApplicationListAdded: (u) {},
        onFriendApplicationListDeleted: (u) {},
        onFriendApplicationListReject: (u) {},
        onFriendInfoChanged: (u) {},
        onFriendListAdded: (u) {},
        onFriendListDeleted: (u) {},
      ))

      // Set up conversation listener
      ..conversationManager.setConversationListener(OnConversationListener(
        onConversationChanged: (list) {},
        onNewConversation: (list) {},
        onTotalUnreadMessageCountChanged: (count) {},
        onSyncServerFailed: () {},
        onSyncServerFinish: () {},
        onSyncServerStart: () {},
      ))

      // Set up group listener
      ..groupManager.setGroupListener(OnGroupListener(
        onApplicationProcessed: (groupId, opUser, agreeOrReject, opReason) {},
        onGroupCreated: (groupId) {},
        onGroupInfoChanged: (groupId, info) {},
        onMemberEnter: (groupId, list) {},
        onMemberInvited: (groupId, opUser, list) {},
        onMemberKicked: (groupId, opUser, list) {},
        onMemberLeave: (groupId, info) {},
        onReceiveJoinApplication: (groupId, info, opReason) {},
      ));
  }
}
