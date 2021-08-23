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
        recvMessageRevoked: (msgId) {},
        recvC2CReadReceipt: (list) {},
        recvNewMessage: (msg) {},
      ))

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
        progressCallback: (msgId, progress) {},
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
  }
}
