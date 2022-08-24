package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnConnListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class IMManager extends BaseManager {

    public void initSDK(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.initSDK(
                new OnConnListener(),
                value(methodCall, "operationID"),
                jsonValue(methodCall))
        );
    }

    public void login(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.login(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "uid"),
                value(methodCall, "token")
        );
    }

    public void logout(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.logout(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getLoginStatus(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getLoginStatus());
    }

    public void wakeUp(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.wakeUp(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void uploadImage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.uploadImage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "path"),
                value(methodCall, "token"),
                value(methodCall, "obj")
        );
    }

    public void updateFcmToken(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.updateFcmToken(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "fcmToken")
        );
    }
}
