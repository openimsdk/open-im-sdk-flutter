package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.Map;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnAdvancedMsgListener implements open_im_sdk_callback.OnAdvancedMsgListener {
    private final String id;

    public OnAdvancedMsgListener(String listenerId) {
        this.id = listenerId;
    }

    @Override
    public void onNewRecvMessageRevoked(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("revokedMessageV2", s);
        CommonUtil.emitEvent("advancedMsgListener", "onNewRecvMessageRevoked", values);
    }

    @Override
    public void onRecvC2CReadReceipt(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("c2cMessageReadReceipt", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvC2CReadReceipt", values);
    }

    @Override
    public void onRecvGroupReadReceipt(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("groupMessageReadReceipt", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvGroupReadReceipt", values);
    }

    @Override
    public void onRecvMessageRevoked(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("revokedMessage", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvMessageRevoked", values);
    }

    @Override
    public void onRecvNewMessage(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("newMessage", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvNewMessage", values);
    }
}
