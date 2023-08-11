package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnConnListener;
import io.openim.flutter_openim_sdk.listener.OnUploadFileListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class IMManager extends BaseManager {

    public void initSDK(MethodCall methodCall, MethodChannel.Result result) {
        boolean initialized = Open_im_sdk.initSDK(
                new OnConnListener(),
                value(methodCall, "operationID"),
                jsonValue(methodCall));
        FlutterOpenimSdkPlugin.isInitialized = initialized;
        CommonUtil.runMainThreadReturn(result, initialized);
    }

    public void unInitSDK(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.unInitSDK(value(methodCall, "operationID"));
    }

    public void login(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.login(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID"),
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
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getLoginStatus(value(methodCall, "operationID")));
    }

    public void uploadFile(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.uploadFile(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall),
                new OnUploadFileListener(result, methodCall)
        );
    }

    public void updateFcmToken(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.updateFcmToken(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "fcmToken")
        );
    }


    public void setAppBackgroundStatus(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setAppBackgroundStatus(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "isBackground")
        );
    }


    public void networkStatusChanged(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.networkStatusChanged(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

//    public void setListenerForService(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.setListenerForService(new OnListenerForService());
//
//        result.success(null);
//    }

}
