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
    public void onRecvGroupReadReceipt(String s) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("groupMsgReceiptList", s);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvGroupReadReceipt", values);
    }


    @Override
    public void onRecvMessageExtensionsAdded(String s, String s1) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("msgID", s);
        values.put("reactionExtensionList", s1);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvMessageExtensionsAdded", values);
    }

    @Override
    public void onRecvMessageExtensionsChanged(String s, String s1) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("msgID", s);
        values.put("reactionExtensionList", s1);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvMessageExtensionsChanged", values);
    }

    @Override
    public void onRecvMessageExtensionsDeleted(String s, String s1) {
        final Map<String, String> values = new ArrayMap<>();
        values.put("id", id);
        values.put("msgID", s);
        values.put("reactionExtensionKeyList", s1);
        CommonUtil.emitEvent("advancedMsgListener", "onRecvMessageExtensionsDeleted", values);
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
}
