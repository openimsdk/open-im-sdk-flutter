package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseImpl;
import io.openim.flutter_openim_sdk.listener.ConversationListenerImpl;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class ConversationManager {
    final private MethodChannel channel;

    public ConversationManager(MethodChannel channel) {
        this.channel = channel;
    }

    public void setConversationListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationListener(new ConversationListenerImpl(channel));
    }
    
    public void getAllConversationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAllConversationList(new BaseImpl(result));
    }

    public void getOneConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getOneConversation(CommonUtil.getConversationId(methodCall), new BaseImpl(result));
    }

    public void getMultipleConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getMultipleConversation(CommonUtil.getConversationIds(methodCall), new BaseImpl(result));
    }

    public void deleteConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversation(CommonUtil.getConversationId(methodCall), new BaseImpl(result));
    }

    public void setConversationDraft(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationDraft(CommonUtil.getConversationId(methodCall), CommonUtil.getConversationDraft(methodCall), new BaseImpl(result));
    }

    public void pinConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.pinConversation(CommonUtil.getConversationId(methodCall), CommonUtil.isPinnedConversation(methodCall), new BaseImpl(result));
    }

    public void getTotalUnreadMsgCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getTotalUnreadMsgCount(new BaseImpl(result));
    }
}
