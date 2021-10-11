import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class AdvancedMsgListener {
  /// Uniquely identifies
  final String id;

  AdvancedMsgListener() : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  /// Receive new message
  void recvNewMessage(Message msg);

  /// Message read receipt
  void recvC2CReadReceipt(List<HaveReadInfo> list);

  /// A friend withdrew a message
  void recvMessageRevoked(String msgId);
}
