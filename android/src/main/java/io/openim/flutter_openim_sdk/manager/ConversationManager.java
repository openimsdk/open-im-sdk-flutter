package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.ConversationListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class ConversationManager extends BaseManager {

    public void setConversationListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationListener(new ConversationListener());
    }

    public void getAllConversationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAllConversationList(new BaseListener(result));
    }

    public void getConversationListSplit(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getConversationListSplit(new BaseListener(result),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count"));
    }

    public void getOneConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getOneConversation(
                value(methodCall, "sourceID"),
                int2long(methodCall, "sessionType"),
                new BaseListener(result));
    }

    public void getMultipleConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getMultipleConversation(
                jsonValue(methodCall, "conversationIDList"),
                new BaseListener(result));
    }

    public void deleteConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversation(
                value(methodCall, "conversationID"),
                new BaseListener(result));
    }

    public void setConversationDraft(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationDraft(
                value(methodCall, "conversationID"),
                value(methodCall, "draftText"),
                new BaseListener(result));
    }

    public void pinConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.pinConversation(
                value(methodCall, "conversationID"),
                value(methodCall, "isPinned"),
                new BaseListener(result));
    }

    public void markSingleMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markSingleMessageHasRead(
                new BaseListener(result),
                value(methodCall, "userID"));
    }

    public void markGroupMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markGroupMessageHasRead(
                new BaseListener(result),
                value(methodCall, "groupID"));
    }

    public void getTotalUnreadMsgCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getTotalUnreadMsgCount(new BaseListener(result));
    }

    public void getConversationIDBySessionType(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getConversationIDBySessionType(
                value(methodCall, "sourceID"),
                int2long(methodCall, "sessionType")));
    }

    public void setConversationRecvMessageOpt(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationRecvMessageOpt(
                new BaseListener(result),
                jsonValue(methodCall, "conversationIDList"),
                int2long(methodCall, "status")
        );
    }

    public void getConversationRecvMessageOpt(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getConversationRecvMessageOpt(
                new BaseListener(result),
                jsonValue(methodCall, "conversationIDList")
        );
    }
}
