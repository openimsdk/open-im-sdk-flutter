package io.openim.flutter_openim_sdk.manager;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.AdvancedMsgListener;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.MsgSendProgressListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnAdvancedMsgListener;
import open_im_sdk.Open_im_sdk;


public class MessageManager extends BaseManager {
    private final static String KEY_ID = "id";
    //    private final static Map<String, OnAdvancedMsgListener> listeners = new HashMap<>();
    private static boolean initializedListener = false;
    private final static Map<String, AdvancedMsgListener> listeners = new ConcurrentHashMap<>();

//    protected void clearListeners() {
//        initializedListener = false;
//        listeners.clear();
//    }

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
//        listeners.put(key, new AdvancedMsgListener(key));
//        if (!initializedListener) {
//            initializedListener = true;
//            Open_im_sdk.addAdvancedMsgListener(sdkMsgListener);
//        }
    }

    public void removeAdvancedMsgListener(MethodCall methodCall, MethodChannel.Result result) {
//        String key = methodCall.argument(KEY_ID);
//        listeners.remove(key);
//        if (listeners.isEmpty()) {
//            initializedListener = false;
//            Open_im_sdk.removeAdvancedMsgListener(sdkMsgListener);
//        }
    }
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

    public void sendMessage(MethodCall methodCall, MethodChannel.Result result) {
        MsgSendProgressListener listener = new MsgSendProgressListener(result, methodCall);
        Open_im_sdk.sendMessage(listener,
                jsonValue(methodCall, "message"),
                value(methodCall, "userID"),
                value(methodCall, "groupID"),
                value(methodCall, "onlineUserOnly"));
    }

    public void getHistoryMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getHistoryMessageList(new BaseListener(result), jsonValue(methodCall));
    }

    public void revokeMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.revokeMessage(new BaseListener(result), jsonValue(methodCall));
    }

    public void deleteMessageFromLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessageFromLocalStorage(new BaseListener(result), jsonValue(methodCall));
    }

    public void deleteMessages(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.deleteMessages(new BaseListener(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void insertSingleMessageToLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.insertSingleMessageToLocalStorage(new BaseListener(result),
                jsonValue(methodCall, "message"),
                value(methodCall, "receiverID"),
                value(methodCall, "senderID"));
    }

    public void findMessages(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.findMessages(new BaseListener(result), jsonValue(methodCall, "messageIDList"));
    }

    public void markC2CMessageAsRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markC2CMessageAsRead(new BaseListener(result),
                value(methodCall, "userID"),
                jsonValue(methodCall, "messageIDList"));
    }

    public void typingStatusUpdate(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.typingStatusUpdate(value(methodCall, "userID"),
                value(methodCall, "typing"));
    }

    public void createTextMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextMessage(
                        value(methodCall, "text")));
    }

    public void createTextAtMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextAtMessage(
                        value(methodCall, "text"),
                        jsonValue(methodCall, "atUserList")));
    }

    public void createImageMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessage(
                        value(methodCall, "imagePath")));
    }

    public void createImageMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessageFromFullPath(
                        value(methodCall, "imagePath")));
    }
    public void createSoundMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessage(
                        value(methodCall, "soundPath"),
                        int2long(methodCall, "duration")));
    }

    public void createSoundMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessageFromFullPath(
                        value(methodCall, "soundPath"),
                        int2long(methodCall, "duration")));
    }

    public void createVideoMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessage(
                        value(methodCall, "videoPath"),
                        value(methodCall, "videoType"),
                        int2long(methodCall, "duration"),
                        value(methodCall, "snapshotPath")));
    }

    public void createVideoMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessageFromFullPath(
                        value(methodCall, "videoPath"),
                        value(methodCall, "videoType"),
                        int2long(methodCall, "duration"),
                        value(methodCall, "snapshotPath")));
    }

    public void createFileMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessage(
                        value(methodCall, "filePath"),
                        value(methodCall, "fileName")));
    }

    public void createFileMessageFromFullPath(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessageFromFullPath(
                        value(methodCall, "filePath"),
                        value(methodCall, "fileName")));
    }

    public void createMergerMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createMergerMessage(
                        jsonValue(methodCall, "messageList"),
                        value(methodCall, "title"),
                        jsonValue(methodCall, "summaryList")));
    }


    public void createForwardMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createForwardMessage(
                        jsonValue(methodCall, "message")));
    }

    public void createLocationMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createLocationMessage(
                value(methodCall, "description"),
                value(methodCall, "longitude"),
                value(methodCall, "latitude")
        ));
    }

    public void createCustomMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createCustomMessage(
                value(methodCall, "data"),
                value(methodCall, "extension"),
                value(methodCall, "description")
        ));
    }

    public void createQuoteMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createQuoteMessage(
                value(methodCall, "quoteText"),
                jsonValue(methodCall, "quoteMessage")
        ));
    }

    public void createCardMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result, Open_im_sdk.createCardMessage(
                jsonValue(methodCall, "cardMessage")
        ));
    }

    public void forceSyncMsg(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncMsg();
    }

    public void clearC2CHistoryMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearC2CHistoryMessage(new BaseListener(result),
                value(methodCall, "userID"));
    }

    public void clearGroupHistoryMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.clearGroupHistoryMessage(new BaseListener(result),
                value(methodCall, "groupID"));
    }
}
