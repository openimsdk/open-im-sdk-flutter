/// 消息发送进度监听
class OnMsgSendProgressListener {
  Function(String clientMsgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  /// 消息发送进度
  void progress(String clientMsgID, int progress) {
    onProgress?.call(clientMsgID, progress);
  }
}
