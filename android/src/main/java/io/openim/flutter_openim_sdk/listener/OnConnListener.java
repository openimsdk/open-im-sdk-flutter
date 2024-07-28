package io.openim.flutter_openim_sdk.listener;


import io.openim.flutter_openim_sdk.util.CommonUtil;


public class OnConnListener implements open_im_sdk_callback.OnConnListener {

    @Override
    public void onConnectFailed(int i, String s) {
        CommonUtil.emitEvent("connectListener", "onConnectFailed", i, s, null);
    }

    @Override
    public void onConnectSuccess() {
        CommonUtil.emitEvent("connectListener", "onConnectSuccess", null);
    }

    @Override
    public void onConnecting() {
        CommonUtil.emitEvent("connectListener", "onConnecting", null);
    }

    @Override
    public void onKickedOffline() {
        CommonUtil.emitEvent("connectListener", "onKickedOffline", null);
    }


    @Override
    public void onUserTokenExpired() {
        CommonUtil.emitEvent("connectListener", "onUserTokenExpired", null);
    }

    @Override
    public void onUserTokenInvalid(String s) {
        CommonUtil.emitEvent("connectListener", "onUserTokenInvalid", s);
    }
}
