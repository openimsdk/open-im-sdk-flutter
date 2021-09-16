import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';


abstract class AdvancedMsgListener {
  /// listener uniquely identifies
  final String id;

  AdvancedMsgListener() : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void recvNewMessage(Message msg);

  void recvC2CReadReceipt(List<HaveReadInfo> list);

  void recvMessageRevoked(String msgId);
}
