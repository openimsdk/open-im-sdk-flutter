import 'package:flutter_openim_sdk/models/message.dart';

class AdvancedMsgListener {
  /// listener uniquely identifies
  final String id;

  AdvancedMsgListener({required this.id});

  void onRecvNewMessage(Message msg) {}

  void onRecvC2CReadReceipt(Message msg) {}

  void onRecvMessageRevoked(Message msg) {}
}
