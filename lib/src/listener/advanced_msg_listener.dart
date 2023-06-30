import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 消息监听
class OnAdvancedMsgListener {
  Function(Message msg)? onMsgDeleted;
  Function(RevokedInfo info)? onNewRecvMessageRevoked;
  Function(List<ReadReceiptInfo> list)? onRecvC2CReadReceipt;
  Function(List<ReadReceiptInfo> list)? onRecvGroupReadReceipt;
  Function(String msgID, List<KeyValue> list)? onRecvMessageExtensionsAdded;
  Function(String msgID, List<KeyValue> list)? onRecvMessageExtensionsChanged;
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
    this.onRecvMessageExtensionsAdded,
    this.onRecvMessageExtensionsChanged,
    this.onRecvMessageExtensionsDeleted,
    this.onRecvNewMessage,
    this.onRecvOfflineNewMessage,
  }) : id = "id_${DateTime.now().microsecondsSinceEpoch}";

  void msgDeleted(Message msg) {
    onMsgDeleted?.call(msg);
  }

  /// 消息被撤回
  void newRecvMessageRevoked(RevokedInfo info) {
    onNewRecvMessageRevoked?.call(info);
  }

  /// C2C消息已读回执
  void recvC2CReadReceipt(List<ReadReceiptInfo> list) {
    onRecvC2CReadReceipt?.call(list);
  }

  ///  群消息已读回执
  void recvGroupReadReceipt(List<ReadReceiptInfo> list) {
    onRecvGroupReadReceipt?.call(list);
  }

  /// 收到拓展消息kv新增
  void recvMessageExtensionsAdded(String msgID, List<KeyValue> list) {
    onRecvMessageExtensionsAdded?.call(msgID, list);
  }

  /// 收到拓展消息kv改变
  void recvMessageExtensionsChanged(String msgID, List<KeyValue> list) {
    onRecvMessageExtensionsChanged?.call(msgID, list);
  }

  /// 收到扩展消息被删除
  /// [list] 被删除的TypeKey
  void recvMessageExtensionsDeleted(String msgID, List<String> list) {
    onRecvMessageExtensionsDeleted?.call(msgID, list);
  }

  /// 收到了一条新消息
  void recvNewMessage(Message msg) {
    onRecvNewMessage?.call(msg);
  }

  void recvOfflineNewMessage(Message msg) {
    onRecvOfflineNewMessage?.call(msg);
  }
}
