package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnUserListener;
import open_im_sdk.Open_im_sdk;

public class UserManager extends BaseManager {

    public void setUserListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setUserListener(new OnUserListener());
    }

    public void getUsersInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getUsersInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "uidList"));
    }

    public void setSelfInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setSelfInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall));
    }

    public void getSelfUserInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSelfUserInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }
}
