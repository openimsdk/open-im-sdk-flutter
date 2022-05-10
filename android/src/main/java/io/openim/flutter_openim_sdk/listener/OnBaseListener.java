package io.openim.flutter_openim_sdk.listener;


import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk_callback.Base;

public class OnBaseListener implements Base {

    MethodChannel.Result result;
    MethodCall call;

    public OnBaseListener(MethodChannel.Result result, MethodCall call) {
        this.result = result;
        this.call = call;
    }

    @Override
    public void onError(int l, String s) {
        Log.i("F-OpenIMSDK(flutter call native)", "method: 【 " + call.method + " 】, onError: { code:" + l + ", message:" + s + "}");
        CommonUtil.runMainThreadReturnError(result, l, s, null);
    }

    @Override
    public void onSuccess(String s) {
        Log.i("F-OpenIMSDK(flutter call native)", "method: 【 " + call.method + " 】, onSuccess: " + s);
        CommonUtil.runMainThreadReturn(result, s);
    }
}
