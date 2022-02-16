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
      OpenIM.iMManager.login(uid: '', token: '');
  }

  void _initSDK() async {
    // Initialize SDK
    OpenIM.iMManager
      ..initSDK(
        platform: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
        apiAddr: '',
        wsAddr: '',
        dataDir: '',
        listener: OnConnectListener(),
      )
      //
      ..userManager.setUserListener(OnUserListener())
      // Add message listener (remove when not in use)
      ..messageManager.setAdvancedMsgListener(OnAdvancedMsgListener())

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener())

      // Set up friend relationship listener
      ..friendshipManager.setFriendshipListener(OnFriendshipListener())

      // Set up conversation listener
      ..conversationManager.setConversationListener(OnConversationListener())

      // Set up group listener
      ..groupManager.setGroupListener(OnGroupListener(
      ));
  }
}
