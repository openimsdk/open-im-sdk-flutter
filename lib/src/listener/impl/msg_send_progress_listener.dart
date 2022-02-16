import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnMsgSendProgressListener extends MsgSendProgressListener {
  Function(String clientMsgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  void progress(String clientMsgID, int progress) {
    if (null != onProgress) onProgress!(clientMsgID, progress);
  }
}
