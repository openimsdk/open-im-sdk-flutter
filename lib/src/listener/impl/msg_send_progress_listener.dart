import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnMsgSendProgressListener implements MsgSendProgressListener {
  Function(String msgID, int progress)? progressCallback;

  OnMsgSendProgressListener({this.progressCallback});

  void onProgress(String msgID, int progress) {
    if (null != progressCallback) progressCallback!(msgID, progress);
  }
}
