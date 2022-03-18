import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnAdvancedMsgListener {
  /// Message read receipt
  Function(List<ReadReceiptInfo> list)? onRecvC2CMessageReadReceipt;

  Function(List<ReadReceiptInfo> list)? onRecvGroupMessageReadReceipt;

  /// A friend revoked a message
  Function(String msgId)? onRecvMessageRevoked;

  /// Receive new message
  Function(Message msg)? onRecvNewMessage;

  /// Uniquely identifies
  String id;

  OnAdvancedMsgListener({
    this.onRecvC2CMessageReadReceipt,
    this.onRecvGroupMessageReadReceipt,
    this.onRecvMessageRevoked,
    this.onRecvNewMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void recvC2CMessageReadReceipt(List<ReadReceiptInfo> list) {
    onRecvC2CMessageReadReceipt?.call(list);
  }

  void recvGroupMessageReadReceipt(List<ReadReceiptInfo> list) {
    onRecvGroupMessageReadReceipt?.call(list);
  }

  void recvMessageRevoked(String msgId) {
    onRecvMessageRevoked?.call(msgId);
  }

  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }
}
