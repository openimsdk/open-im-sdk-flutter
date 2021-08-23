import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnAdvancedMsgListener extends AdvancedMsgListener {
  Function(List<HaveReadInfo> list)? recvC2CReadReceipt;
  Function(String msgId)? recvMessageRevoked;
  Function(Message msg)? recvNewMessage;

  OnAdvancedMsgListener({
    this.recvC2CReadReceipt,
    this.recvMessageRevoked,
    this.recvNewMessage,
  });

  @override
  void onRecvC2CReadReceipt(List<HaveReadInfo> list) {
    if (null != recvC2CReadReceipt) recvC2CReadReceipt!(list);
  }

  @override
  void onRecvMessageRevoked(String msgId) {
    if (null != recvMessageRevoked) recvMessageRevoked!(msgId);
  }

  @override
  void onRecvNewMessage(Message msg) {
    if (null != recvNewMessage) recvNewMessage!(msg);
  }
}
