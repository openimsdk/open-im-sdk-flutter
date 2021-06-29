import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/manager/im_manager.dart';

class FlutterOpenimSdk {
  static const MethodChannel _channel =
      const MethodChannel('flutter_openim_sdk');

  static IMManager iMManager = IMManager(_channel);
}
