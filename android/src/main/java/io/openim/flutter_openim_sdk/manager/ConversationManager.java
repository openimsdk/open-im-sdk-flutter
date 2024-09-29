package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnConversationListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class ConversationManager extends BaseManager {

    public void setConversationListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationListener(new OnConversationListener());

        result.success(null);
    }


    public void getAllConversationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAllConversationList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getConversationListSplit(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getConversationListSplit(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count")
        );
    }

    public void getOneConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getOneConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "sessionType"),
                value(methodCall, "sourceID")
        );
    }

    public void getMultipleConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getMultipleConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "conversationIDList")
        );
    }


    public void setConversationDraft(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationDraft(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "draftText")
        );
    }

    public void hideConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.hideConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void markConversationMessageAsRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markConversationMessageAsRead(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void getTotalUnreadMsgCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getTotalUnreadMsgCount(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getConversationIDBySessionType(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getConversationIDBySessionType(
                value(methodCall, "operationID"),
                value(methodCall, "sourceID"),
                int2long(methodCall, "sessionType")));
    }

    public void clearConversationAndDeleteAllMsg(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearConversationAndDeleteAllMsg(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void deleteConversationAndDeleteAllMsg(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversationAndDeleteAllMsg(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void getAtAllTag(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getAtAllTag(value(methodCall, "operationID")));
    }

    public void hideAllConversations(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.hideAllConversations(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public  void searchConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "name")
        );
    }

    public void changeInputStates(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.changeInputStates(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "focus")
        );
    }

    public void getInputStates(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getInputStates(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "userID")
        );
    }

    public void setConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                jsonValue(methodCall, "req")
        );
    }


    public void searchConversations(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "name")
        );
    }
}
