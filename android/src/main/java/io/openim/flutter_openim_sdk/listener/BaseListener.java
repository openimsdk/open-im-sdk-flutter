package io.openim.flutter_openim_sdk.listener;


import io.flutter.Log;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Base;

public class BaseListener implements Base {

    MethodChannel.Result result;

    public BaseListener(MethodChannel.Result result) {
        this.result = result;
    }

    @Override
    public void onError(long l, String s) {
//        Log.e("F-OpenIMSD(callback)", s);
        CommonUtil.runMainThreadReturnError(result, l, s, null);
    }

    @Override
    public void onSuccess(String s) {
//        Log.i("F-OpenIMSDK(callback)", s);
        CommonUtil.runMainThreadReturn(result, s);
    }
}
