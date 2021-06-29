package io.openim.flutter_openim_sdk.listener;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnAdvancedMsgListener;

public class AdvancedMsgListenerImpl implements OnAdvancedMsgListener {
    final MethodChannel channel;
    final Map<String, String> values = new HashMap<>();

    public AdvancedMsgListenerImpl(MethodChannel channel, String id) {
        this.channel = channel;
        this.values.put("id", id);
    }

    @Override
    public void onRecvC2CReadReceipt(String s) {
        values.put("message", s);
        CommonUtil.emitEvent(channel, "advancedMsgListener", "onRecvC2CReadReceipt", values);
    }

    @Override
    public void onRecvMessageRevoked(String s) {
        values.put("message", s);
        CommonUtil.emitEvent(channel, "advancedMsgListener", "onRecvMessageRevoked", values);
    }

    @Override
    public void onRecvNewMessage(String s) {
        values.put("message", s);
        CommonUtil.emitEvent(channel, "advancedMsgListener", "onRecvNewMessage", values);
    }
}
