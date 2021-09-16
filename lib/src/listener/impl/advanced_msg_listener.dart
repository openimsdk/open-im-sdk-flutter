import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnAdvancedMsgListener extends AdvancedMsgListener {
  Function(List<HaveReadInfo> list)? onRecvC2CReadReceipt;
  Function(String msgId)? onRecvMessageRevoked;
  Function(Message msg)? onRecvNewMessage;

  OnAdvancedMsgListener({
    this.onRecvC2CReadReceipt,
    this.onRecvMessageRevoked,
    this.onRecvNewMessage,
  });

  @override
  void recvC2CReadReceipt(List<HaveReadInfo> list) {
    if (null != onRecvC2CReadReceipt) onRecvC2CReadReceipt!(list);
  }

  @override
  void recvMessageRevoked(String msgId) {
    if (null != onRecvMessageRevoked) onRecvMessageRevoked!(msgId);
  }

  @override
  void recvNewMessage(Message msg) {
    if (null != onRecvNewMessage) onRecvNewMessage!(msg);
  }
}
