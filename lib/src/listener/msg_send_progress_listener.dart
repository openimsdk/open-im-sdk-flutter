/// Message Sending Progress Listener
class OnMsgSendProgressListener {
  Function(String clientMsgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  /// Message sending progress
  void progress(String clientMsgID, int progress) {
    onProgress?.call(clientMsgID, progress);
  }
}
