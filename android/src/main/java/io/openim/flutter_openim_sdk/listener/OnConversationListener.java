package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;


public class OnConversationListener implements open_im_sdk_callback.OnConversationListener {

    @Override
    public void onConversationChanged(String s) {
        CommonUtil.emitEvent("conversationListener", "onConversationChanged", s);
    }

    @Override
    public void onNewConversation(String s) {
        CommonUtil.emitEvent("conversationListener", "onNewConversation", s);
    }

    @Override
    public void onSyncServerFailed() {
        CommonUtil.emitEvent("conversationListener", "onSyncServerFailed", null);
    }

    @Override
    public void onSyncServerFinish() {
        CommonUtil.emitEvent("conversationListener", "onSyncServerFinish", null);
    }

    @Override
    public void onSyncServerStart() {
        CommonUtil.emitEvent("conversationListener", "onSyncServerStart", null);
    }

    @Override
    public void onTotalUnreadMessageCountChanged(int i) {
        CommonUtil.emitEvent("conversationListener", "onTotalUnreadMessageCountChanged", i);
    }
}
