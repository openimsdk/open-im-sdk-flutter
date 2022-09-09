package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnAdvancedMsgListener;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnMsgSendListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;


public class MessageManager extends BaseManager {
    private final static String KEY_ID = "id";

    //    private final static Map<String, OnAdvancedMsgListener> listeners = new HashMap<>();
 /*   private static boolean initializedListener = false;
    private final static Map<String, AdvancedMsgListener> listeners = new ConcurrentHashMap<>();

    protected void clearListeners() {
        initializedListener = false;
        listeners.clear();
    }

    private final static OnAdvancedMsgListener sdkMsgListener = new OnAdvancedMsgListener() {
        @Override
        public void onRecvC2CReadReceipt(String s) {
            for (AdvancedMsgListener l : listeners.values()) {
                l.onRecvC2CReadReceipt(s);
            }
        }

        @Override
        public void onRecvMessageRevoked(String s) {
            for (AdvancedMsgListener l : listeners.values()) {
                l.onRecvMessageRevoked(s);
            }
        }

        @Override
        public void onRecvNewMessage(String s) {
            for (AdvancedMsgListener l : listeners.values()) {
                l.onRecvNewMessage(s);
            }
        }
    };

    public void addAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        Open_im_sdk.addAdvancedMsgListener(new AdvancedMsgListener(key));
        listeners.put(key, new AdvancedMsgListener(key));
        if (!initializedListener) {
            initializedListener = true;
            Open_im_sdk.addAdvancedMsgListener(sdkMsgListener);
        }
    }

    public void removeAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        listeners.remove(key);
        if (listeners.isEmpty()) {
            initializedListener = false;
            Open_im_sdk.removeAdvancedMsgListener(sdkMsgListener);
        }
    }*/
/*

    public void addAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        if (!listeners.containsKey(key)) {
            AdvancedMsgListener listener = new AdvancedMsgListener(key);
            listeners.put(methodCall.argument(KEY_ID), listener);
            Open_im_sdk.addAdvancedMsgListener(listener);
        }
    }

    public void removeAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        OnAdvancedMsgListener listener = listeners.remove(key);
        Open_im_sdk.removeAdvancedMsgListener(listener);
    }

*/
    public void setAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
        String key = methodCall.argument(KEY_ID);
        Open_im_sdk.setAdvancedMsgListener(new OnAdvancedMsgListener(key));
    }

    public void sendMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.sendMessage(
                new OnMsgSendListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "message"),
                value(methodCall, "userID"),
                value(methodCall, "groupID"),
                jsonValue(methodCall, "offlinePushInfo")
        );
    }

    public void getHistoryMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getHistoryMessageList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void revokeMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.revokeMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void deleteMessageFromLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessageFromLocalStorage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

//    public void deleteMessages(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.deleteMessages(new OnBaseListener(result, methodCall), CommonUtil.getSDKJsonParam(methodCall));
//    }

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

    public void markC2CMessageAsRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markC2CMessageAsRead(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID"),
                jsonValue(methodCall, "messageIDList")
        );
    }

    public void markGroupMessageAsRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markGroupMessageAsRead(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
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

    public void clearC2CHistoryMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearC2CHistoryMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID")
        );
    }

    public void clearGroupHistoryMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearGroupHistoryMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public void searchLocalMessages(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchLocalMessages(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "filter")
        );
    }

    public void deleteMessageFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessageFromLocalAndSvr(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
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

    public void markMessageAsReadByConID(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markMessageAsReadByConID(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "conversationID"),
                jsonValue(methodCall, "messageIDList")
        );
    }

    public void clearC2CHistoryMessageFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearC2CHistoryMessageFromLocalAndSvr(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID")
        );
    }

    public void clearGroupHistoryMessageFromLocalAndSvr(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearGroupHistoryMessageFromLocalAndSvr(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public void getHistoryMessageListReverse(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getHistoryMessageListReverse(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void newRevokeMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.newRevokeMessage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void getAdvancedHistoryMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getAdvancedHistoryMessageList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void findMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.findMessageList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "options")
        );
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
}
