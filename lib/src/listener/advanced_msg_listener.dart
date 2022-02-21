import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnAdvancedMsgListener {
  /// Message read receipt
  Function(List<ReadReceiptInfo> list)? onRecvC2CReadReceipt;

  /// A friend revoked a message
  Function(String msgId)? onRecvMessageRevoked;

  /// Receive new message
  Function(Message msg)? onRecvNewMessage;

  /// Uniquely identifies
  String id;

  OnAdvancedMsgListener({
    this.onRecvC2CReadReceipt,
    this.onRecvMessageRevoked,
    this.onRecvNewMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void recvC2CReadReceipt(List<ReadReceiptInfo> list) {
    if (null != onRecvC2CReadReceipt) onRecvC2CReadReceipt!(list);
  }

  void recvMessageRevoked(String msgId) {
    if (null != onRecvMessageRevoked) onRecvMessageRevoked!(msgId);
  }

  void recvNewMessage(Message msg) {
    if (null != onRecvNewMessage) onRecvNewMessage!(msg);
  }
}
