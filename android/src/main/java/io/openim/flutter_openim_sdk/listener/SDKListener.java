package io.openim.flutter_openim_sdk.listener;


import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.IMSDKListener;

public class SDKListener implements IMSDKListener {

    @Override
    public void onConnectFailed(long l, String s) {
        CommonUtil.emitEvent("initSDKListener", "onConnectFailed", l, s, null);
    }

    @Override
    public void onConnectSuccess() {
        CommonUtil.emitEvent("initSDKListener", "onConnectSuccess", null);
    }

    @Override
    public void onConnecting() {
        CommonUtil.emitEvent("initSDKListener", "onConnecting", null);
    }

    @Override
    public void onKickedOffline() {
        CommonUtil.emitEvent("initSDKListener", "onKickedOffline", null);
    }

    @Override
    public void onSelfInfoUpdated(String s) {
        CommonUtil.emitEvent("initSDKListener", "onSelfInfoUpdated", s);
    }

    @Override
    public void onUserTokenExpired() {
        CommonUtil.emitEvent("initSDKListener", "onUserTokenExpired", null);
    }
}
