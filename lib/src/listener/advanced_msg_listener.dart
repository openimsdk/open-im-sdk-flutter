import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 消息监听
class OnAdvancedMsgListener {
  Function(List<ReadReceiptInfo> list)? onRecvC2CMessageReadReceipt;
  Function(List<ReadReceiptInfo> list)? onRecvGroupMessageReadReceipt;
  Function(String msgId)? onRecvMessageRevoked;
  Function(Message msg)? onRecvNewMessage;

  /// Uniquely identifies
  String id;

  OnAdvancedMsgListener({
    this.onRecvC2CMessageReadReceipt,
    this.onRecvGroupMessageReadReceipt,
    this.onRecvMessageRevoked,
    this.onRecvNewMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  /// C2C消息已读回执
  void recvC2CMessageReadReceipt(List<ReadReceiptInfo> list) {
    onRecvC2CMessageReadReceipt?.call(list);
  }

  ///  群消息已读回执
  void recvGroupMessageReadReceipt(List<ReadReceiptInfo> list) {
    onRecvGroupMessageReadReceipt?.call(list);
  }

  /// 消息被撤回
  void recvMessageRevoked(String msgId) {
    onRecvMessageRevoked?.call(msgId);
  }

  /// 收到了一条新消息
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }
}
