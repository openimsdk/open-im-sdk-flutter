package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.ConversationListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class ConversationManager {

    public void setConversationListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationListener(new ConversationListener());
    }

    public void getAllConversationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAllConversationList(new BaseListener(result));
    }

    public void getOneConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getOneConversation(
                CommonUtil.getConversationSourceId(methodCall),
                CommonUtil.getConversationSessionType(methodCall),
                new BaseListener(result));
    }

    public void getMultipleConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getMultipleConversation(
                CommonUtil.getConversationIds(methodCall),
                new BaseListener(result));
    }

    public void deleteConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversation(CommonUtil.getConversationId(methodCall), new BaseListener(result));
    }

    public void setConversationDraft(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationDraft(
                CommonUtil.getConversationId(methodCall),
                CommonUtil.getConversationDraft(methodCall),
                new BaseListener(result));
    }

    public void pinConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.pinConversation(
                CommonUtil.getConversationId(methodCall),
                CommonUtil.isPinnedConversation(methodCall),
                new BaseListener(result));
    }

    public void markSingleMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markSingleMessageHasRead(new BaseListener(result), CommonUtil.getSingleMessageUserid(methodCall));
    }

    public void markGroupMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markGroupMessageHasRead(new BaseListener(result), CommonUtil.getGroupMessageGroupid(methodCall));
    }

    public void getTotalUnreadMsgCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getTotalUnreadMsgCount(new BaseListener(result));
    }
}
