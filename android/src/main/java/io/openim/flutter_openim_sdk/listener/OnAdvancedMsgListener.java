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
    public void onMsgDeleted(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("message", s);
        CommonUtil.emitEvent("advancedMsgListener", "onMsgDeleted", values);
    }

    @Override
    public void onNewRecvMessageRevoked(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("messageRevoked", s);
        CommonUtil.emitEvent("advancedMsgListener", "onNewRecvMessageRevoked", values);
    }

    @Override
    public void onRecvC2CReadReceipt(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("msgReceiptList", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvC2CReadReceipt", values);
    }

    @Override
    public void onRecvNewMessage(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("message", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvNewMessage", values);
    }

    @Override
    public void onRecvOfflineNewMessage(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("message", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvOfflineNewMessage", values);
    }

    @Override
    public void onRecvOnlineOnlyMessage(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("message", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvOnlineOnlyMessage", values);
    }
}
