package io.openim.flutter_openim_sdk.manager;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.AdvancedMsgListener;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.MsgSendProgressListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnAdvancedMsgListener;
import open_im_sdk.Open_im_sdk;


public class MessageManager {
    private final static String KEY_ID = "id";
    private final static Map<String, OnAdvancedMsgListener> listeners = new HashMap<>();

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

    public void sendMessage(MethodCall methodCall, MethodChannel.Result result) {
        MsgSendProgressListener listener = new MsgSendProgressListener(result, methodCall);
        Open_im_sdk.sendMessage(listener,
                CommonUtil.getSendMessageContent(methodCall),
                CommonUtil.getSendMessageReceiver(methodCall),
                CommonUtil.geSendMessageGroupId(methodCall),
                CommonUtil.getSendMessageOnlineOnly(methodCall));
    }

    public void getHistoryMessageList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getHistoryMessageList(new BaseListener(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void revokeMessage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.revokeMessage(new BaseListener(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void deleteMessageFromLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteMessageFromLocalStorage(new BaseListener(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void deleteMessages(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.deleteMessages(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void insertSingleMessageToLocalStorage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.insertSingleMessageToLocalStorage(new BaseListener(result),
                CommonUtil.getSingleMessageContent(methodCall),
                CommonUtil.getSingleMessageUserid(methodCall),
                CommonUtil.getSingleMessageSender(methodCall));
    }

    public void findMessages(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.findMessages(new BaseListener(result), CommonUtil.getFindMessageIds(methodCall));
    }

    public void markSingleMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markSingleMessageHasRead(new BaseListener(result), CommonUtil.getSingleMessageUserid(methodCall));
    }

    public void markGroupMessageHasRead(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.markGroupMessageHasRead(new BaseListener(result), CommonUtil.getGroupMessageGroupid(methodCall));
    }

    public void markC2CMessageAsRead(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.markC2CMessageAsRead(new BaseImpl(result), CommonUtil.getSingleMessageUserid(methodCall));
    }

    public void createTextMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextMessage(
                        CommonUtil.getMessageText(methodCall)));
    }

    public void createTextAtMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createTextAtMessage(
                        CommonUtil.getMessageText(methodCall),
                        CommonUtil.getAtUserList(methodCall)));
    }

    public void createImageMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createImageMessage(
                        CommonUtil.getImagePath(methodCall)));
    }

    public void createSoundMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createSoundMessage(
                        CommonUtil.getSoundPath(methodCall),
                        CommonUtil.getSoundDuration(methodCall)));
    }

    public void createVideoMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createVideoMessage(
                        CommonUtil.getVideoPath(methodCall),
                        CommonUtil.getVideoType(methodCall),
                        CommonUtil.getVideoDuration(methodCall),
                        CommonUtil.getVideoSnapshotPath(methodCall)));
    }

    public void createFileMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createFileMessage(
                        CommonUtil.getFilePath(methodCall),
                        CommonUtil.getFileName(methodCall)));
    }

    public void createMergerMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createMergerMessage(
                        CommonUtil.getMergerMessageList(methodCall),
                        CommonUtil.getMergerMessageTitle(methodCall),
                        CommonUtil.getSummaryList(methodCall)));
    }

    public void createForwardMessage(MethodCall methodCall, MethodChannel.Result result) {
        CommonUtil.runMainThreadReturn(result,
                Open_im_sdk.createForwardMessage(
                        CommonUtil.getForwardMessage(methodCall)));
    }

    public void getTotalUnreadMsgCount(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getTotalUnreadMsgCount(new BaseListener(result));
    }

    public void forceSyncMsg(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncMsg();
    }
}
