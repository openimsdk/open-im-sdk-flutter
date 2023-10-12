import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Message Listener
class OnAdvancedMsgListener {
  Function(Message msg)? onMsgDeleted;
  Function(RevokedInfo info)? onNewRecvMessageRevoked;
  Function(List<ReadReceiptInfo> list)? onRecvC2CReadReceipt;
  Function(List<ReadReceiptInfo> list)? onRecvGroupReadReceipt;
  Function(String msgID, List<String> list)? onRecvMessageExtensionsDeleted;
  Function(Message msg)? onRecvNewMessage;
  Function(Message msg)? onRecvOfflineNewMessage;

  /// Uniquely identifies
  String id;

  OnAdvancedMsgListener({
    this.onMsgDeleted,
    this.onNewRecvMessageRevoked,
    this.onRecvC2CReadReceipt,
    this.onRecvGroupReadReceipt,
    this.onRecvMessageExtensionsDeleted,
    this.onRecvNewMessage,
    this.onRecvOfflineNewMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void msgDeleted(Message msg) {
    onMsgDeleted?.call(msg);
  }

  /// Message has been retracted
  void newRecvMessageRevoked(RevokedInfo info) {
    onNewRecvMessageRevoked?.call(info);
  }

  /// C2C Message Read Receipt
  void recvC2CReadReceipt(List<ReadReceiptInfo> list) {
    onRecvC2CReadReceipt?.call(list);
  }

  /// Group Message Read Receipt
  void recvGroupReadReceipt(List<ReadReceiptInfo> list) {
    onRecvGroupReadReceipt?.call(list);
  }

  /// Received Extended Message Deleted
  /// [list] TypeKey that was deleted
  void recvMessageExtensionsDeleted(String msgID, List<String> list) {
    onRecvMessageExtensionsDeleted?.call(msgID, list);
  }

  /// Received a new message
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }

  void recvOfflineNewMessage(Message msg) {
    onRecvOfflineNewMessage?.call(msg);
  }
}
