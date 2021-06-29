package io.openim.flutter_openim_sdk.listener;


import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Base;

public class BaseImpl implements Base {

    MethodChannel.Result result;

    public BaseImpl(MethodChannel.Result result) {
        this.result = result;
    }

    @Override
    public void onError(long l, String s) {
        System.out.println("BaseImpl:" + s);
        CommonUtil.runMainThreadReturnError(result, l, s, null);
    }

    @Override
    public void onSuccess(String s) {
        System.out.println("BaseImpl:" + s);
        CommonUtil.runMainThreadReturn(result, s);
    }
}
