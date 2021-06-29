package io.openim.flutter_openim_sdk.util;

import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;


public class CommonUtil {
    /**
     * 主线程处理器
     */
    private final static Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public static <T> T getParamValue(MethodCall methodCall, String param) {
        return methodCall.argument(param);
    }

    public static String getSDKJsonParam(MethodCall methodCall, String key) {
        return JsonUtil.toString(methodCall.argument(key));
    }

    public static String getSDKJsonParam(MethodCall methodCall) {
        return JsonUtil.toString(methodCall.arguments);
    }

    public static void runMainThreadReturn(final MethodChannel.Result result, final Object param) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                result.success(param);
            }
        });
    }

    public static void runMainThread(Runnable runnable) {
        MAIN_HANDLER.post(runnable);
    }

    /**
     * 运行主线程返回错误结果执行
     *
     * @param result       返回结果对象
     * @param errorCode    错误码
     * @param errorMessage 错误信息
     * @param errorDetails 错误内容
     */
    public static void runMainThreadReturnError(final MethodChannel.Result result, final String errorCode, final String errorMessage, final Object errorDetails) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                result.error(errorCode, errorMessage, errorDetails);
            }
        });
    }

    public static void runMainThreadReturnError(final MethodChannel.Result result, final long errorCode, final String errorMessage, final Object errorDetails) {
        runMainThreadReturnError(result, String.valueOf(errorCode), errorMessage, errorDetails);
    }

/*

    public static void returnError(final MethodChannel.Result result, int i, String s) {
        HashMap<String, Object> err = new HashMap<String, Object>();
        err.put("code", i);
        err.put("desc", s);
        result.success(err);
    }

    public static void returnError(final MethodChannel.Result result, int i, String s, HashMap<String, Object> data) {
        HashMap<String, Object> err = new HashMap<String, Object>();
        err.put("code", i);
        err.put("desc", s);
        err.put("data", data);
        result.success(err);
    }

    public static <T> void returnSuccess(final MethodChannel.Result result, T data) {
        HashMap<String, Object> succ = new HashMap<String, Object>();
        succ.put("code", 0);
        succ.put("desc", "ok");
        succ.put("data", data);
        result.success(succ);
    }
*/


    public static <T> void emitEvent(MethodChannel channel, String method, String type, Long errCode, String errMsg, T data) {
        runMainThread(new Runnable() {
            @Override
            public void run() {
                HashMap<String, Object> res = new HashMap<String, Object>();
//                if (null != type) {
                res.put("type", type);
//                }
                if (null != data) {
                    res.put("data", data);
                }
                if (null != errCode) {
                    res.put("errCode", errCode);
                }
                if (null != errMsg) {
                    res.put("errMsg", errMsg);
                }
                System.out.println("native call flutter { method:" + method + ",  type:" + type + " }");
                FlutterOpenimSdkPlugin.channel.invokeMethod(method, res);
            }
        });
    }

    public static <T> void emitEvent(MethodChannel channel, String method, String type, T data) {
        emitEvent(channel, method, type, null, null, data);
    }


    ///////////////////////////////////////
    //////////////////////////////////////
    public static String getUid(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_LOGIN_UID);
    }

    public static String getToken(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_LOGIN_TOKEN);
    }

    public static String getMessageText(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_TEXT);
    }

    public static String getAtUserList(MethodCall methodCall) {
//        return methodCall.argument(KEY_AT_USER_LIST);
        return getSDKJsonParam(methodCall, KEY_AT_USER_LIST);
    }

    public static String getImagePath(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_IMAGE_PATH);
    }

    public static String getSoundPath(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SOUND_PATH);
    }

    public static long getSoundDuration(MethodCall methodCall) {
        Integer i = getParamValue(methodCall, KEY_SOUND_DURATION);
        return Long.valueOf(i);
    }

    public static String getVideoPath(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_VIDEO_PATH);
    }

    public static String getVideoType(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_VIDEO_TYPE);
    }

    public static long getVideoDuration(MethodCall methodCall) {
        Integer i = getParamValue(methodCall, KEY_VIDEO_DURATION);
        return Long.valueOf(i);
    }

    public static String getVideoSnapshotPath(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_VIDEO_SNAPSHOT_PATH);
    }

    public static String getFilePath(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_FILE_PATH);
    }

    public static String getFileName(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_FILE_NAME);
    }

    public static String getMergerMessageList(MethodCall methodCall) {
//        return methodCall.argument(KEY_MERGER_MESSAGE_LIST);
        return getSDKJsonParam(methodCall, KEY_MERGER_MESSAGE_LIST);
    }

    public static String getMergerMessageTitle(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_MERGER_MESSAGE_TITLE);
    }

    public static String getSummaryList(MethodCall methodCall) {
//        return methodCall.argument(KEY_SUMMARY_LIST);
        return getSDKJsonParam(methodCall, KEY_SUMMARY_LIST);
    }

    public static String getForwardMessage(MethodCall methodCall) {
//        return methodCall.argument(KEY_FORWARD_MESSAGE);
        return getSDKJsonParam(methodCall, KEY_FORWARD_MESSAGE);
    }

    public static String getSendMessageContent(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_SEND_MESSAGE_CONTENT);
    }

    public static Object getSendMessageClientMsgID(MethodCall methodCall) {
        Map<String, Object> map = getParamValue(methodCall, KEY_SEND_MESSAGE_CONTENT);
        return map.get(KEY_SEND_MESSAGE_CONTENT_CLIENT_ID);
    }

    public static String getSendMessageReceiver(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SEND_MESSAGE_RECEIVER);
    }

    public static String geSendMessageGroupId(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SEND_MESSAGE_GROUP_ID);
    }

    public static boolean getSendMessageOnlineOnly(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SEND_MESSAGE_ONLINE_ONLY);
    }

    public static String getSingleMessageContent(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SINGLE_MESSAGE_CONTENT);
    }

    public static String getSingleMessageUserid(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SINGLE_MESSAGE_USERID);
    }

    public static String getSingleMessageSender(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SINGLE_MESSAGE_SENDER);
    }

    public static String getFindMessageIds(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_FIND_MESSAGE_IDS);
    }

    public static String getConversationId(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_ID);
    }

    public static String getConversationIds(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_CONVERSATION_IDS);
    }

    public static String getConversationDraft(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_DRAFT);
    }

    public static boolean isPinnedConversation(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_PINNED);
    }

    //login
    final static String KEY_LOGIN_UID = "uid";
    final static String KEY_LOGIN_TOKEN = "token";
    //create message body
    final static String KEY_TEXT = "text";
    final static String KEY_AT_USER_LIST = "atUserList";
    final static String KEY_IMAGE_PATH = "imagePath";
    final static String KEY_SOUND_PATH = "soundPath";
    final static String KEY_SOUND_DURATION = "duration";
    final static String KEY_VIDEO_PATH = "videoPath";
    final static String KEY_VIDEO_TYPE = "videoType";
    final static String KEY_VIDEO_DURATION = "duration";
    final static String KEY_VIDEO_SNAPSHOT_PATH = "snapshotPath";
    final static String KEY_FILE_PATH = "filePath";
    final static String KEY_FILE_NAME = "fileName";
    final static String KEY_MERGER_MESSAGE_LIST = "messageList";
    final static String KEY_MERGER_MESSAGE_TITLE = "title";
    final static String KEY_SUMMARY_LIST = "summaryList";
    final static String KEY_FORWARD_MESSAGE = "message";
    //send message
    final static String KEY_SEND_MESSAGE_CONTENT = "message";
    final static String KEY_SEND_MESSAGE_CONTENT_CLIENT_ID = "clientMsgID";
    final static String KEY_SEND_MESSAGE_RECEIVER = "receiver";
    final static String KEY_SEND_MESSAGE_GROUP_ID = "groupID";
    final static String KEY_SEND_MESSAGE_ONLINE_ONLY = "onlineUserOnly";
    //single chat
    final static String KEY_SINGLE_MESSAGE_CONTENT = "message";
    final static String KEY_SINGLE_MESSAGE_USERID = "userID";
    final static String KEY_SINGLE_MESSAGE_SENDER = "sender";
    // find message
    final static String KEY_FIND_MESSAGE_IDS = "messageIDList";
    // conversation
    final static String KEY_CONVERSATION_ID = "conversationID";
    final static String KEY_CONVERSATION_IDS = "conversationIDList";
    final static String KEY_CONVERSATION_DRAFT = "draftText";
    final static String KEY_CONVERSATION_PINNED = "isPinned";
}
