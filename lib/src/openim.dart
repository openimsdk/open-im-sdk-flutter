import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OpenIM {
  static const MethodChannel _channel =
      const MethodChannel('flutter_openim_sdk');

  static IMManager iMManager = IMManager(_channel);

  OpenIM._();
}
