package io.openim.flutter_openim_sdk.listener;

import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnConversationListener;

public class ConversationListenerImpl implements OnConversationListener {
    private final MethodChannel channel;

    public ConversationListenerImpl(MethodChannel channel) {
        this.channel = channel;
    }

    @Override
    public void onConversationChanged(String s) {
        CommonUtil.emitEvent(channel, "conversationListener", "onConversationChanged", s);
    }

    @Override
    public void onNewConversation(String s) {
        CommonUtil.emitEvent(channel, "conversationListener", "onNewConversation", s);
    }

    @Override
    public void onSyncServerFailed() {
        CommonUtil.emitEvent(channel, "conversationListener", "onSyncServerFailed", null);
    }

    @Override
    public void onSyncServerFinish() {
        CommonUtil.emitEvent(channel, "conversationListener", "onSyncServerFinish", null);
    }

    @Override
    public void onSyncServerStart() {
        CommonUtil.emitEvent(channel, "conversationListener", "onSyncServerStart", null);
    }

    @Override
    public void onTotalUnreadMessageCountChanged(int i) {
        CommonUtil.emitEvent(channel, "conversationListener", "onTotalUnreadMessageCountChanged", i);
    }
}
