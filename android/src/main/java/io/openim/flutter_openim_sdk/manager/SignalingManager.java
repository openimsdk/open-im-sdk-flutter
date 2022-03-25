package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnSignalingListener;
import open_im_sdk.Open_im_sdk;

public class SignalingManager extends BaseManager {

    public void setSignalingListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setSignalingListener(new OnSignalingListener());
    }

    public void signalingInvite(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingInvite(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingInviteInGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingInviteInGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingAccept(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingAccept(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingReject(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingReject(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingCancel(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingCancel(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingHungUp(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingHungUp(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }
}
