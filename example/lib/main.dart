import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OpenIM.iMManager.initSDK(
    platform: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
    apiAddr: 'https://web.muka.site/api',
    wsAddr: 'wss://web.muka.site/msg_gateway',
    dataDir: '',
    logLevel: 3,
    objectStorage: 'oss',
    listener: OnConnectListener(
      onConnectSuccess: () {
        // 已经成功连接到服务器
        print({"OpenIM.iMManager.listener": "onConnectSuccess"});
      },
      onConnecting: () {
        // 正在连接到服务器，适合在 UI 上展示“正在连接”状态。
        print({"OpenIM.iMManager.listener": "onConnecting"});
      },
      onConnectFailed: (code, errorMsg) {
        // 连接服务器失败，可以提示用户当前网络连接不可用
        print({
          "OpenIM.iMManager.listener": "onConnectFailed",
          "code": code,
          "errorMsg": errorMsg,
        });
      },
      onUserTokenExpired: () {},
      onKickedOffline: () {},
    ),
  );

  print('-----------初始化openIM完成');
  SearchResult res = await OpenIM.iMManager.messageManager.searchLocalMessages();
  print(res);
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
}
