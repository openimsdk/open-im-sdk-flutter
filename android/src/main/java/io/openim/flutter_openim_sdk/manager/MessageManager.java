package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnAdvancedMsgListener;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnCustomBusinessListener;
import io.openim.flutter_openim_sdk.listener.OnMsgSendListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;


public class MessageManager extends BaseManager {
    private final static String KEY_ID = "id";

    public void setAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        Open_im_sdk.setAdvancedMsgListener(new OnAdvancedMsgListener(key));

        result.success(null);
    }

    public void sendMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.sendMessage(
                new OnMsgSendListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "message"),
                value(methodCall, "userID"),
                value(methodCall, "groupID"),
                jsonValue(methodCall, "offlinePushInfo"),
                value(methodCall, "isOnlineOnly")
        );
    }

    public void revokeMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.revokeMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "clientMsgID")
        );
    }

    public void deleteMessageFromLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessageFromLocalStorage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "clientMsgID")
        );
    }

    public void deleteMessageFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "clientMsgID")
        );
    }

    public void deleteAllMsgFromLocal(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteAllMsgFromLocal(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void deleteAllMsgFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteAllMsgFromLocalAndSvr(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void insertSingleMessageToLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.insertSingleMessageToLocalStorage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "message"),
                value(methodCall, "receiverID"),
                value(methodCall, "senderID")
        );
    }

    public void insertGroupMessageToLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.insertGroupMessageToLocalStorage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "message"),
                value(methodCall, "groupID"),
                value(methodCall, "senderID")
        );
    }

    public void markMessagesAsReadByMsgID(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markMessagesAsReadByMsgID(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                jsonValue(methodCall, "messageIDList")
        );
    }

    public void typingStatusUpdate(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.typingStatusUpdate(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID"),
                value(methodCall, "msgTip")
        );
    }

    public void createTextMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "text")));
    }

    public void createTextAtMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextAtMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "text"),
                        jsonValue(methodCall, "atUserIDList"),
                        jsonValue(methodCall, "atUserInfoList"),
                        jsonValue(methodCall, "quoteMessage")
                ));
    }

    public void createImageMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "imagePath")));
    }

    public void createImageMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessageFromFullPath(
                        value(methodCall, "operationID"),
                        value(methodCall, "imagePath")));
    }

    public void createSoundMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "soundPath"),
                        int2long(methodCall, "duration")));
    }

    public void createSoundMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessageFromFullPath(
                        value(methodCall, "operationID"),
                        value(methodCall, "soundPath"),
                        int2long(methodCall, "duration")));
    }

    public void createVideoMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "videoPath"),
                        value(methodCall, "videoType"),
                        int2long(methodCall, "duration"),
                        value(methodCall, "snapshotPath")));
    }

    public void createVideoMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessageFromFullPath(
                        value(methodCall, "operationID"),
                        value(methodCall, "videoPath"),
                        value(methodCall, "videoType"),
                        int2long(methodCall, "duration"),
                        value(methodCall, "snapshotPath")));
    }

    public void createFileMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "filePath"),
                        value(methodCall, "fileName")));
    }

    public void createFileMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessageFromFullPath(
                        value(methodCall, "operationID"),
                        value(methodCall, "filePath"),
                        value(methodCall, "fileName")));
    }

    public void createMergerMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createMergerMessage(
                        value(methodCall, "operationID"),
                        jsonValue(methodCall, "messageList"),
                        value(methodCall, "title"),
                        jsonValue(methodCall, "summaryList")));
    }


    public void createForwardMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createForwardMessage(
                        value(methodCall, "operationID"),
                        jsonValue(methodCall, "message")));
    }

    public void createLocationMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createLocationMessage(
                value(methodCall, "operationID"),
                value(methodCall, "description"),
                value(methodCall, "longitude"),
                value(methodCall, "latitude")
        ));
    }

    public void createCustomMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createCustomMessage(
                value(methodCall, "operationID"),
                value(methodCall, "data"),
                value(methodCall, "extension"),
                value(methodCall, "description")
        ));
    }

    public void createQuoteMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createQuoteMessage(
                value(methodCall, "operationID"),
                value(methodCall, "quoteText"),
                jsonValue(methodCall, "quoteMessage")
        ));
    }

    public void createCardMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createCardMessage(
                value(methodCall, "operationID"),
                jsonValue(methodCall, "cardMessage")
        ));
    }

    public void createFaceMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createFaceMessage(
                value(methodCall, "operationID"),
                int2long(methodCall, "index"),
                value(methodCall, "data")
        ));
    }

    public void createAdvancedTextMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createAdvancedTextMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "text"),
                        jsonValue(methodCall, "richMessageInfoList")
                ));
    }

    public void createAdvancedQuoteMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createAdvancedQuoteMessage(
                        value(methodCall, "operationID"),
                        value(methodCall, "quoteText"),
                        jsonValue(methodCall, "quoteMessage"),
                        jsonValue(methodCall, "richMessageInfoList")
                ));
    }

    public void searchLocalMessages(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchLocalMessages(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "filter")
        );
    }


    public void clearConversationAndDeleteAllMsg(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearConversationAndDeleteAllMsg(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID")
        );
    }


    public void getAdvancedHistoryMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAdvancedHistoryMessageList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void getAdvancedHistoryMessageListReverse(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAdvancedHistoryMessageListReverse(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void findMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.findMessageList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "searchParams")
        );
    }

    public void setMessageLocalEx(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setMessageLocalEx(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                value(methodCall, "clientMsgID"),
                value(methodCall, "localEx")
        );
    }

    public void setAppBadge(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setAppBadge(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "count")
        );
    }

    public void sendMessageNotOss(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.sendMessageNotOss(
                new OnMsgSendListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "message"),
                value(methodCall, "userID"),
                value(methodCall, "groupID"),
                jsonValue(methodCall, "offlinePushInfo"),
                value(methodCall, "isOnlineOnly")
        );
    }

    public void createImageMessageByURL(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessageByURL(
                        value(methodCall, "operationID"),
                        value(methodCall, "sourcePath"),
                        jsonValue(methodCall, "sourcePicture"),
                        jsonValue(methodCall, "bigPicture"),
                        jsonValue(methodCall, "snapshotPicture")));
    }

    public void createSoundMessageByURL(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessageByURL(
                        value(methodCall, "operationID"),
                        jsonValue(methodCall, "soundElem")));
    }

    public void createVideoMessageByURL(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessageByURL(
                        value(methodCall, "operationID"),
                        jsonValue(methodCall, "videoElem")));
    }

    public void createFileMessageByURL(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessageByURL(
                        value(methodCall, "operationID"),
                        jsonValue(methodCall, "fileElem")));
    }

    public void setCustomBusinessListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setCustomBusinessListener(new OnCustomBusinessListener());

        result.success(null);
    }
}
