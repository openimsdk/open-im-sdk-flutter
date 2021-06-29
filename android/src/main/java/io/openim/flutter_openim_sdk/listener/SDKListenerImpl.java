package io.openim.flutter_openim_sdk.listener;


import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.IMSDKListener;

public class SDKListenerImpl implements IMSDKListener {
    final private MethodChannel channel;

    public SDKListenerImpl(MethodChannel channel) {
        this.channel = channel;
    }

    @Override
    public void onConnectFailed(long l, String s) {
        CommonUtil.emitEvent(channel, "initSDKListener", "onConnectFailed", l, s, null);
    }

    @Override
    public void onConnectSuccess() {
        CommonUtil.emitEvent(channel, "initSDKListener", "onConnectSuccess", null);
    }

    @Override
    public void onConnecting() {
        CommonUtil.emitEvent(channel, "initSDKListener", "onConnecting", null);
    }

    @Override
    public void onKickedOffline() {
        CommonUtil.emitEvent(channel, "initSDKListener", "onKickedOffline", null);
    }

    @Override
    public void onSelfInfoUpdated(String s) {
        CommonUtil.emitEvent(channel, "initSDKListener", "onSelfInfoUpdated", s);
    }

    @Override
    public void onUserTokenExpired() {
        CommonUtil.emitEvent(channel, "initSDKListener", "onUserTokenExpired", null);
    }
}
