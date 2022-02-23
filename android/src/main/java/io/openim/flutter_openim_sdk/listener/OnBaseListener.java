package io.openim.flutter_openim_sdk.listener;


import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk_callback.Base;

public class OnBaseListener implements Base {

    MethodChannel.Result result;

    public OnBaseListener(MethodChannel.Result result) {
        this.result = result;
    }

    @Override
    public void onError(int l, String s) {
        CommonUtil.runMainThreadReturnError(result, l, s, null);
    }

    @Override
    public void onSuccess(String s) {
        CommonUtil.runMainThreadReturn(result, s);
    }
}
