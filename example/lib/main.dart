import 'package:flutter/material.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OpenIM.iMManager.initSDK(
      platformID: 2,
      apiAddr: 'https://www.openim.io/api',
      wsAddr: 'https://www.openim.io/',
      dataDir: '/',
      listener: OnConnectListener(),
    );
    OpenIM.iMManager.messageManager.customBusinessListener = OnCustomBusinessListener(
      onRecvCustomBusinessMessage: (message) {},
    );
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
            TextButton(onPressed: () {}, child: const Text('login')),
          ],
        ),
      ),
    );
  }
}
