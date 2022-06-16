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
                int2long(methodCall, "sessionType"),
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

    public void deleteConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
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

    public void pinConversation(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.pinConversation(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "isPinned")
        );
    }

//    public void markSingleMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.markSingleMessageHasRead(
//                new OnBaseListener(result, methodCall),
//                value(methodCall, "operationID"),
//                value(methodCall, "userID")
//        );
//    }

    public void markGroupMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markGroupMessageHasRead(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
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
                value(methodCall, "sourceID"),
                int2long(methodCall, "sessionType")));
    }

    public void setConversationRecvMessageOpt(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setConversationRecvMessageOpt(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "conversationIDList"),
                int2long(methodCall, "status")
        );
    }

    public void getConversationRecvMessageOpt(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getConversationRecvMessageOpt(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "conversationIDList")
        );
    }

    public void setOneConversationPrivateChat(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setOneConversationPrivateChat(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "isPrivate")
        );
    }

    public void deleteConversationFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteConversationFromLocalAndSvr(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void deleteAllConversationFromLocal(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteAllConversationFromLocal(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void resetConversationGroupAtType(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.resetConversationGroupAtType(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }

    public void getAtAllTag(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.getAtAllTag());
    }

    public void setGlobalRecvMessageOpt(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGlobalRecvMessageOpt(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                int2long(methodCall, "status")
        );
    }
}
