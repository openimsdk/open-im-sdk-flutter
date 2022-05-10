package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnWorkMomentsListener;
import open_im_sdk.Open_im_sdk;

public class WorkMomentsManager extends BaseManager {

    public void setWorkMomentsListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setWorkMomentsListener(new OnWorkMomentsListener());
    }

    public void getWorkMomentsUnReadCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getWorkMomentsUnReadCount(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"));
    }

    public void getWorkMomentsNotification(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getWorkMomentsNotification(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count"));
    }

    public void clearWorkMomentsNotification(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearWorkMomentsNotification(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"));
    }
}
