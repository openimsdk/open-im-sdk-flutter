//
//  CommonUtil.swift
//  Runner
//
//  Created by z1u24 on 2021/6/28.
//

import Foundation


public class CommonUtil {
    
    public static func getParamValue(methodCall:FlutterMethodCall, param: String)->Any? {
        let argument = methodCall.arguments as! NSDictionary
        let arg = argument.value(forKey: param)
        return arg;
    }
    
    public static func getSDKJsonParam(methodCall: FlutterMethodCall, key: String) -> String{
        let argument = methodCall.arguments as! NSDictionary
        let arg = argument.value(forKey: key) as AnyObject
        return JsonUtil.toString(object: arg);
    }
    
    public static func getSDKJsonParam(methodCall: FlutterMethodCall) -> String{
        let argument = methodCall.arguments as AnyObject
        let s = JsonUtil.toString(object: argument)
        return s
    }
    
    public static func emitEvent(channel: FlutterMethodChannel, method: String, type: String, errCode: Int?, errMsg: String?, data: Any?){
        DispatchQueue.main.async {
            let res: NSMutableDictionary = NSMutableDictionary(capacity: 0)
            res.setValue(type, forKey: "type")
            if (data != nil) {
                res.setValue(data, forKey: "data");
            }
            if (nil != errCode) {
                res.setValue(errCode, forKey: "errCode");
            }
            if (nil != errMsg) {
                res.setValue(errMsg, forKey: "errMsg");
            }
            print("native call flutter { method: \(method) type: \(type) }")
            channel.invokeMethod(method, arguments: res)
        }
    }
    
    public static func getUid(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_LOGIN_UID) as! String
        return result
    }
    
    public static func getToken(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_LOGIN_TOKEN) as! String
        return result
    }
    
    public static func getUidList(methodCall: FlutterMethodCall)->String{
        let result = getParamValue(methodCall: methodCall, param: KEY_UID_LIST) as AnyObject
        let r = JsonUtil.toString(object: result)
        return r
    }
    
    public static func getUserUid(methodCall: FlutterMethodCall)->String{
        let result = getParamValue(methodCall: methodCall, param: KEY_LOGIN_UID) as AnyObject
        let r = JsonUtil.toString(object: result)
        return r
    }
    
    public static func getDeleteUid(methodCall: FlutterMethodCall)->String{
        let result = getParamValue(methodCall: methodCall, param: KEY_DELETE_UID) as AnyObject
        let r = JsonUtil.toString(object: result)
        return r
    }
    
    public static func getMessageText(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_TEXT) as! String
        return result
    }
    
    public static func getAtUserList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_AT_USER_LIST) as! String
        return result
    }
    
    public static func getImagePath(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_IMAGE_PATH) as! String
        return result
    }
    
    public static func getSoundPath(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SOUND_PATH) as! String
        return result
    }
    
    public static func getSoundDuration(methodCall: FlutterMethodCall)->Int64{
        let result: Int64 = getParamValue(methodCall: methodCall, param: KEY_SOUND_DURATION) as! Int64
        return result
    }
    
    public static func getVideoPath(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_VIDEO_PATH) as! String
        return result
    }
    
    public static func getVideoType(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_VIDEO_TYPE) as! String
        return result
    }
    
    public static func getVideoDuration(methodCall: FlutterMethodCall)->Int64{
        let result: Int64 = getParamValue(methodCall: methodCall, param: KEY_VIDEO_DURATION) as! Int64
        return result
    }
    
    public static func getVideoSnapshotPath(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_VIDEO_SNAPSHOT_PATH) as! String
        return result
    }
    
    public static func getFilePath(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_FILE_PATH) as! String
        return result
    }
    
    public static func getFileName(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_FILE_NAME) as! String
        return result
    }
    
    public static func getMergerMessageList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_MERGER_MESSAGE_LIST) as! String
        return result
    }
    
    public static func getMergerMessageTitle(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_MERGER_MESSAGE_TITLE) as! String
        return result
    }
    
    public static func getSummaryList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SUMMARY_LIST) as! String
        return result
    }
    
    public static func getForwardMessage(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_FORWARD_MESSAGE) as! String
        return result
    }
    
    public static func getSendMessageContent(methodCall: FlutterMethodCall)->String{
        let result = getParamValue(methodCall: methodCall, param: KEY_SEND_MESSAGE_CONTENT)
        if result is NSDictionary && result != nil {
            return JsonUtil.toString(object: result as? NSDictionary)
        }
        return result as! String
    }
    
    public static func getSendMessageClientMsgID(methodCall: FlutterMethodCall)->String{
        let r = getParamValue(methodCall: methodCall, param: KEY_SEND_MESSAGE_CONTENT) as! NSDictionary
        let result = r.value(forKey: KEY_SEND_MESSAGE_CONTENT_CLIENT_ID)
        return result as! String
    }
    
    public static func getSendMessageReceiver(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SEND_MESSAGE_RECEIVER) as! String
        return result
    }
    
    public static func getSendMessageGroupId(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SEND_MESSAGE_GROUP_ID) as! String
        return result
    }
    
    public static func getSendMessageOnlineOnly(methodCall: FlutterMethodCall)->Bool{
        let result: Int = getParamValue(methodCall: methodCall, param: KEY_SEND_MESSAGE_ONLINE_ONLY) as! Int
        return (result != 0)
    }
    
    public static func getSingleMessageContent(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SINGLE_MESSAGE_CONTENT) as! String
        return result
    }
    
    public static func getSingleMessageUserid(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SINGLE_MESSAGE_USERID) as! String
        return result
    }
    
    public static func getSingleMessageSender(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_SINGLE_MESSAGE_SENDER) as! String
        return result
    }
    
    public static func getFindMessageIds(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_FIND_MESSAGE_IDS) as! String
        return result
    }
    
    public static func getConversationId(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_CONVERSATION_ID) as! String
        return result
    }
    
    public static func getConversationIds(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_CONVERSATION_IDS) as! String
        return result
    }
    
    public static func getConversationDraft(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_CONVERSATION_DRAFT) as! String
        return result
    }
    
    public static func isPinnedConversation(methodCall: FlutterMethodCall)->Bool{
        let result: Int = getParamValue(methodCall: methodCall, param: KEY_SINGLE_MESSAGE_USERID) as! Int
        return (result != 0)
    }
    
    public static func getSessionType(methodCall: FlutterMethodCall)->Int{
        let result: Int = getParamValue(methodCall: methodCall, param: KEY_CONVERSATION_SESSION) as! Int
        return result
    }
    
    /**
     * group
     */
    public static func getGroupId(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_ID) as! String
        return result
    }
    
    public static func getGroupReason(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_REASON) as! String
        return result
    }
    
    public static func getGroupUserList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_USERLIST) as! String
        return result
    }
    
    public static func getGroupFilter(methodCall: FlutterMethodCall)->Int32{
        let result: Int32 = getParamValue(methodCall: methodCall, param: KEY_GROUP_FILTER) as! Int32
        return result
    }
    
    public static func getGroupNext(methodCall: FlutterMethodCall)->Int32{
        let result: Int32 = getParamValue(methodCall: methodCall, param: KEY_GROUP_NEXT) as! Int32
        return result
    }
    
    public static func getGroupInfo(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_INFO) as! String
        return result
    }
    
    public static func getGroupMemberList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_MEMBERLIST) as! String
        return result
    }
    
    public static func getGroupJsonInfo(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_JSONINFO) as! String
        return result
    }
    
    public static func getGroupIdList(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_IDLIST) as! String
        return result
    }
    
    public static func getGroupMessage(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_MESSAGE) as! String
        return result
    }
    
    public static func getGroupUserId(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_USER_ID) as! String
        return result
    }
    
    public static func getGroupApplication(methodCall: FlutterMethodCall)->String{
        let result: String = getParamValue(methodCall: methodCall, param: KEY_GROUP_APPLICATION) as! String
        return result
    }
    
    
    //login
    private static let KEY_LOGIN_UID: String = "uid";
    private static let KEY_LOGIN_TOKEN: String = "token";
    //userinfo
    private static let KEY_UID_LIST: String = "uidList";
    private static let KEY_DELETE_UID: String = "deleteUid";
    //create message body
    private static let KEY_TEXT: String = "text";
    private static let KEY_AT_USER_LIST: String = "atUserList";
    private static let KEY_IMAGE_PATH: String = "imagePath";
    private static let KEY_SOUND_PATH: String = "soundPath";
    private static let KEY_SOUND_DURATION: String = "duration";
    private static let KEY_VIDEO_PATH: String = "videoPath";
    private static let KEY_VIDEO_TYPE: String = "videoType";
    private static let KEY_VIDEO_DURATION: String = "duration";
    private static let KEY_VIDEO_SNAPSHOT_PATH: String = "snapshotPath";
    private static let KEY_FILE_PATH: String = "filePath";
    private static let KEY_FILE_NAME: String = "fileName";
    private static let KEY_MERGER_MESSAGE_LIST: String = "messageList";
    private static let KEY_MERGER_MESSAGE_TITLE: String = "title";
    private static let KEY_SUMMARY_LIST: String = "summaryList";
    private static let KEY_FORWARD_MESSAGE: String = "message";
    //send message
    private static let KEY_SEND_MESSAGE_CONTENT: String = "message";
    private static let KEY_SEND_MESSAGE_CONTENT_CLIENT_ID: String = "clientMsgID";
    private static let KEY_SEND_MESSAGE_RECEIVER: String = "receiver";
    private static let KEY_SEND_MESSAGE_GROUP_ID: String = "groupID";
    private static let KEY_SEND_MESSAGE_ONLINE_ONLY: String = "onlineUserOnly";
    //single chat
    private static let KEY_SINGLE_MESSAGE_CONTENT: String = "message";
    private static let KEY_SINGLE_MESSAGE_USERID: String = "userID";
    private static let KEY_SINGLE_MESSAGE_SENDER: String = "sender";
    // find message
    private static let KEY_FIND_MESSAGE_IDS: String = "messageIDList";
    // conversation
    private static let KEY_CONVERSATION_ID: String = "conversationID";
    private static let KEY_CONVERSATION_IDS: String = "conversationIDList";
    private static let KEY_CONVERSATION_DRAFT: String = "draftText";
    private static let KEY_CONVERSATION_PINNED: String = "isPinned";
    private static let KEY_CONVERSATION_SESSION: String = "sessionType";
    
    //group
    private static let KEY_GROUP_ID: String = "groupid";
    private static let KEY_GROUP_USERLIST: String = "userList";
    private static let KEY_GROUP_REASON: String = "reason";
    private static let KEY_GROUP_FILTER: String = "filter";
    private static let KEY_GROUP_NEXT: String = "next";
    private static let KEY_GROUP_INFO: String = "gInfo";
    private static let KEY_GROUP_MEMBERLIST: String = "memberList";
    private static let KEY_GROUP_JSONINFO: String = "jsonGroupInfo";
    private static let KEY_GROUP_IDLIST: String = "groupIdList";
    private static let KEY_GROUP_MESSAGE: String = "message";
    private static let KEY_USER_ID: String = "userId";
    private static let KEY_GROUP_APPLICATION: String = "application";
}
