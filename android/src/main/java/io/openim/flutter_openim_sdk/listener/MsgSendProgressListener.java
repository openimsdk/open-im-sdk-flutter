package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.SendMsgCallBack;

public class MsgSendProgressListener implements SendMsgCallBack {
    final private MethodChannel.Result result;
//    final private MethodCall call;
    final private Object clientMsgID;

    public MsgSendProgressListener(MethodChannel.Result result, MethodCall call) {
        this.result = result;
//        this.call = call;
        Map<String, Object> args = call.argument("message");
        this.clientMsgID = args.get("clientMsgID");
    }

    @Override
    public void onError(long l, String s) {
        CommonUtil.runMainThreadReturnError(result, l, s, null);
    }

    @Override
    public void onProgress(long l) {
        final Map<String, Object> values = new ArrayMap<>();
        values.put("clientMsgID", clientMsgID);
        values.put("progress", l);
        CommonUtil.emitEvent("msgSendProgressListener", "onProgress", values);
    }

    @Override
    public void onSuccess(String s) {
        CommonUtil.runMainThreadReturn(result, s);
    }
}
