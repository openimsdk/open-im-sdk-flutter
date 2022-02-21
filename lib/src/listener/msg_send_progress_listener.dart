class OnMsgSendProgressListener {
  Function(String clientMsgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  void progress(String clientMsgID, int progress) {
    if (null != onProgress) onProgress!(clientMsgID, progress);
  }
}
