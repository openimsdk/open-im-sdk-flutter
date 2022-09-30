package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnSignalingListener implements open_im_sdk_callback.OnSignalingListener {

    @Override
    public void onInvitationCancelled(String s) {
        CommonUtil.emitEvent("signalingListener", "onInvitationCancelled", s);
    }

    @Override
    public void onInvitationTimeout(String s) {
        CommonUtil.emitEvent("signalingListener", "onInvitationTimeout", s);
    }

    @Override
    public void onInviteeAccepted(String s) {
        CommonUtil.emitEvent("signalingListener", "onInviteeAccepted", s);
    }

    @Override
    public void onInviteeAcceptedByOtherDevice(String s) {
        CommonUtil.emitEvent("signalingListener", "onInviteeAcceptedByOtherDevice", s);
    }

    @Override
    public void onInviteeRejected(String s) {
        CommonUtil.emitEvent("signalingListener", "onInviteeRejected", s);
    }

    @Override
    public void onInviteeRejectedByOtherDevice(String s) {
        CommonUtil.emitEvent("signalingListener", "onInviteeRejectedByOtherDevice", s);
    }

    @Override
    public void onReceiveNewInvitation(String s) {
        CommonUtil.emitEvent("signalingListener", "onReceiveNewInvitation", s);
    }

    @Override
    public void onRoomParticipantConnected(String s) {
        CommonUtil.emitEvent("signalingListener", "onRoomParticipantConnected", s);
    }

    @Override
    public void onRoomParticipantDisconnected(String s) {
        CommonUtil.emitEvent("signalingListener", "onRoomParticipantDisconnected", s);
    }

    @Override
    public void onHangUp(String s) {
        CommonUtil.emitEvent("signalingListener", "onHangUp", s);
    }
}
