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
    public void onInviteeRejected(String s) {
        CommonUtil.emitEvent("signalingListener", "onInviteeRejected", s);
    }

    @Override
    public void onReceiveNewInvitation(String s) {
        CommonUtil.emitEvent("signalingListener", "onReceiveNewInvitation", s);
    }
}
