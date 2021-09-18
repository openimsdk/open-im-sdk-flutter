package io.openim.flutter_openim_sdk.util;

import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;


public class CommonUtil {
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

    public static <T> void emitEvent(String method, String type, Long errCode, String errMsg, T data) {
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
                Log.i("F-OpenIMSDK(native call flutter)", "{ method:" + method + ",  type:" + type + " }");
                FlutterOpenimSdkPlugin.channel.invokeMethod(method, res);
            }
        });
    }

    public static <T> void emitEvent(String method, String type, T data) {
        emitEvent(method, type, null, null, data);
    }


    ///////////////////////////////////////
    //////////////////////////////////////
    public static String getUid(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_UID);
    }

    public static String getJsonUid(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_UID);
    }

    public static String getToken(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_TOKEN);
    }

    public static String getUidList(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_USER_IDS);
    }

    public static String getMessageText(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_TEXT);
    }

    public static String getAtUserList(MethodCall methodCall) {
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
        return getSDKJsonParam(methodCall, KEY_MERGER_MESSAGE_LIST);
    }

    public static String getMergerMessageTitle(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_MERGER_MESSAGE_TITLE);
    }

    public static String getSummaryList(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_SUMMARY_LIST);
    }

    public static String getForwardMessage(MethodCall methodCall) {
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

    public static String getGroupMessageGroupid(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_GROUP_MESSAGE_GROUPID);
    }

    public static String getSingleMessageSender(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SINGLE_MESSAGE_SENDER);
    }

    public static String getSingleMessageTyping(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_SINGLE_MESSAGE_TYPING);
    }

    public static String getMessageIdList(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_FIND_MESSAGE_IDS);
    }

    public static String getConversationId(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_ID);
    }

    public static String getConversationIds(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_CONVERSATION_IDS);
    }

    public static String getConversationSourceId(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_SOURCE_ID);
    }

    public static int getConversationSessionType(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_SESSION_TYPE);
    }

    public static String getConversationDraft(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_DRAFT);
    }

    public static boolean isPinnedConversation(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_CONVERSATION_PINNED);
    }

    public static String getGid(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_GROUP_ID);
    }

    public static String getGidList(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_GROUP_IDS);
    }

    public static String getGroupOpReason(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_GROUP_OP_REASON);
    }

    public static int getGroupListFilter(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_GROUP_LIST_FILTER);
    }

    public static int getGroupListNext(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_GROUP_LIST_NEXT);
    }

    public static String getGroupInfo(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_GROUP_INFO);
    }

    public static String getGroupMemberRoleList(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_GROUP_MEMBER_ROLE_LIST);
    }

    public static String getGroupApplicationInfo(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_GROUP_APPLICATION_INFO);
    }


    public static double getLocationLatitude(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_LOCATION_MESSAGE_LA);
    }

    public static double getLocationLongitude(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_LOCATION_MESSAGE_LO);
    }

    public static String getMessageDes(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_MESSAGE_DES);
    }

    public static String getCustomMessageData(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_CUSTOM_MESSAGE_DATA);
    }

    public static String getCustomMessageExt(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_CUSTOM_MESSAGE_EXT);
    }

    public static String getQuoteMessageText(MethodCall methodCall) {
        return getParamValue(methodCall, KEY_QUOTE_MESSAGE_TEXT);
    }

    public static String getQuoteMessageBody(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_QUOTE_MESSAGE_BODY);
    }

    public static String getCardMessage(MethodCall methodCall) {
        return getSDKJsonParam(methodCall, KEY_CARD_MESSAGE);
    }

    //login
    final static String KEY_UID = "uid";
    final static String KEY_TOKEN = "token";
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
    final static String KEY_LOCATION_MESSAGE_LO = "longitude";
    final static String KEY_LOCATION_MESSAGE_LA = "latitude";
    final static String KEY_MESSAGE_DES = "description";
    final static String KEY_CUSTOM_MESSAGE_DATA = "data";
    final static String KEY_CUSTOM_MESSAGE_EXT = "extension";
    final static String KEY_QUOTE_MESSAGE_TEXT = "quoteText";
    final static String KEY_QUOTE_MESSAGE_BODY = "quoteMessage";
    final static String KEY_CARD_MESSAGE = "cardMessage";
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
    final static String KEY_SINGLE_MESSAGE_TYPING = "typing";
    //group chat
    final static String KEY_GROUP_MESSAGE_GROUPID = "groupID";
    // find message
    final static String KEY_FIND_MESSAGE_IDS = "messageIDList";
    // conversation
    final static String KEY_CONVERSATION_ID = "conversationID";
    final static String KEY_CONVERSATION_IDS = "conversationIDList";
    final static String KEY_CONVERSATION_DRAFT = "draftText";
    final static String KEY_CONVERSATION_PINNED = "isPinned";
    final static String KEY_CONVERSATION_SOURCE_ID = "sourceID";
    final static String KEY_CONVERSATION_SESSION_TYPE = "sessionType";
    // user info
    final static String KEY_USER_IDS = "uidList";
    // group
    final static String KEY_GROUP_ID = "gid";
    final static String KEY_GROUP_IDS = "gidList";
    final static String KEY_GROUP_OP_REASON = "reason";
    //    final static String KEY_GROUP_USER_ID = "uid";
//    final static String KEY_GROUP_USER_IDS = "uidList";
    final static String KEY_GROUP_LIST_FILTER = "filter";
    final static String KEY_GROUP_LIST_NEXT = "next";
    final static String KEY_GROUP_INFO = "gInfo";
    final static String KEY_GROUP_MEMBER_ROLE_LIST = "memberList";
    final static String KEY_GROUP_APPLICATION_INFO = "application";
}
