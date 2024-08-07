package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;


public class OnConversationListener implements open_im_sdk_callback.OnConversationListener {

    @Override
    public void onConversationChanged(String s) {
        CommonUtil.emitEvent("conversationListener", "onConversationChanged", s);
    }

    @Override
    public void onConversationUserInputStatusChanged(String s) {
        CommonUtil.emitEvent("conversationListener", "onConversationUserInputStatusChanged", s);
    }

    @Override
    public void onNewConversation(String s) {
        CommonUtil.emitEvent("conversationListener", "onNewConversation", s);
    }

    @Override
    public void onSyncServerFailed(boolean reinstalled) {
        CommonUtil.emitEvent("conversationListener", "onSyncServerFailed", reinstalled);
    }

    @Override
    public void onSyncServerFinish(boolean reinstalled) {
        CommonUtil.emitEvent("conversationListener", "onSyncServerFinish", reinstalled);
    }

    @Override
    public void onSyncServerStart(boolean reinstalled) {
        CommonUtil.emitEvent("conversationListener", "onSyncServerStart", reinstalled);
    }

    @Override
    public void onSyncServerProgress(long progress) {
        CommonUtil.emitEvent("conversationListener", "onSyncServerProgress", progress);
    }

    @Override
    public void onTotalUnreadMessageCountChanged(int i) {
        CommonUtil.emitEvent("conversationListener", "onTotalUnreadMessageCountChanged", i);
    }
}
