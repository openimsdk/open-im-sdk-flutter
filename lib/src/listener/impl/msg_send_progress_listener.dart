import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnMsgSendProgressListener extends MsgSendProgressListener {
  Function(String msgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  void progress(String msgID, int progress) {
    if (null != onProgress) onProgress!(msgID, progress);
  }
}
