package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnSignalingListener;
import open_im_sdk.Open_im_sdk;

public class SignalingManager extends BaseManager {

    public void setSignalingListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setSignalingListener(new OnSignalingListener());

        result.success(null);
    }

    public void signalingInvite(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingInvite(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingInviteInGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingInviteInGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingAccept(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingAccept(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingReject(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingReject(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingCancel(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingCancel(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingHungUp(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingHungUp(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "signalingInfo"));
    }

    public void signalingGetRoomByGroupID(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingGetRoomByGroupID(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"));
    }

    public void signalingGetTokenByRoomID(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.signalingGetTokenByRoomID(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "roomID"));
    }

//    public void signalingUpdateMeetingInfo(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingUpdateMeetingInfo(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                jsonValue(methodCall, "info"));
//    }
//
//    public void signalingCreateMeeting(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingCreateMeeting(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                jsonValue(methodCall, "info"));
//    }
//
//    public void signalingJoinMeeting(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingJoinMeeting(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                jsonValue(methodCall, "info"));
//    }
//
//    public void signalingOperateStream(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingOperateStream(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                value(methodCall, "streamType"),
//                value(methodCall, "roomID"),
//                value(methodCall, "userID"),
//                value(methodCall, "mute"),
//                value(methodCall, "muteAll"));
//    }
//
//    public void signalingGetMeetings(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingGetMeetings(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"));
//    }
//
//    public void signalingCloseRoom(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingCloseRoom(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                value(methodCall, "roomID"));
//    }
//
//    public void signalingSendCustomSignal(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.signalingSendCustomSignal(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                value(methodCall, "customInfo"),
//                value(methodCall, "roomID"));
//    }
}
