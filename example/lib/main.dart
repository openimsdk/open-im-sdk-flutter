import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
            TextButton(onPressed: _testApi, child: Text('api')),
          ],
        ),
      ),
    );
  }

  void _testApi() {
    // FlutterOpenimSdk.iMManager.initSDK(
    //   platform: platform,
    //   ipApi: ipApi,
    //   ipWs: ipWs,
    //   dbPath: dbPath,
    //   listener: listener,
    // );

  }
}
