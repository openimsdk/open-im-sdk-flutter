import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Message Listener
class OnAdvancedMsgListener {
  Function(Message msg)? onMsgDeleted;
  Function(RevokedInfo info)? onNewRecvMessageRevoked;
  Function(List<ReadReceiptInfo> list)? onRecvC2CReadReceipt;
  Function(Message msg)? onRecvNewMessage;
  Function(Message msg)? onRecvOfflineNewMessage;
  Function(Message msg)? onRecvOnlineOnlyMessage;

  /// Uniquely identifies
  String id;

  OnAdvancedMsgListener({
    this.onMsgDeleted,
    this.onNewRecvMessageRevoked,
    this.onRecvC2CReadReceipt,
    this.onRecvNewMessage,
    this.onRecvOfflineNewMessage,
    this.onRecvOnlineOnlyMessage,
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

  /// Received a new message
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }

  void recvOfflineNewMessage(Message msg) {
    onRecvOfflineNewMessage?.call(msg);
  }

  void recvOnlineOnlyMessage(Message msg) {
    onRecvOnlineOnlyMessage?.call(msg);
  }
}
