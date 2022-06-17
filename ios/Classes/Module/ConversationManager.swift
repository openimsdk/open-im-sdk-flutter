import Foundation
import OpenIMCore

public class ConversationManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setConversationListener"] = setConversationListener
        self["getAllConversationList"] = getAllConversationList
        self["getConversationListSplit"] = getConversationListSplit
        self["getOneConversation"] = getOneConversation
        self["getMultipleConversation"] = getMultipleConversation
        self["deleteConversation"] = deleteConversation
        self["setConversationDraft"] = setConversationDraft
        self["pinConversation"] = pinConversation
        // self["markSingleMessageHasRead"] = markSingleMessageHasRead
        self["markGroupMessageHasRead"] = markGroupMessageHasRead
        self["getTotalUnreadMsgCount"] = getTotalUnreadMsgCount
        self["getConversationIDBySessionType"] = getConversationIDBySessionType
        self["setConversationRecvMessageOpt"] = setConversationRecvMessageOpt
        self["getConversationRecvMessageOpt"] = getConversationRecvMessageOpt
        self["setOneConversationPrivateChat"] = setOneConversationPrivateChat
        self["deleteConversationFromLocalAndSvr"] = deleteConversationFromLocalAndSvr
        self["deleteAllConversationFromLocal"] = deleteAllConversationFromLocal
        self["resetConversationGroupAtType"] = resetConversationGroupAtType
        self["getAtAllTag"] = getAtAllTag
        self["setGlobalRecvMessageOpt"] = setGlobalRecvMessageOpt
    }
    
    func setConversationListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationListener(ConversationListener(channel: channel))
        callBack(result)
    }
    
    func getAllConversationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAllConversationList(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getConversationListSplit(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetConversationListSplit(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "offset"], methodCall[int: "count"])
    }

    func getOneConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetOneConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "sessionType"], methodCall[string: "sourceID"])
    }
    
    func getMultipleConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMultipleConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"])
    }
    
    func deleteConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func setConversationDraft(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationDraft(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[string: "draftText"])
    }
    
    func pinConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkPinConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[bool: "isPinned"])
    }
    
    // func markSingleMessageHasRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
    //     Open_im_sdkMarkSingleMessageHasRead(BaseCallback(result: result), methodCall[string: "userID"])
    // }
    
    func markGroupMessageHasRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkGroupMessageHasRead(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func getTotalUnreadMsgCount(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetTotalUnreadMsgCount(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getConversationIDBySessionType(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let conversationID = Open_im_sdkGetConversationIDBySessionType(methodCall[string: "sourceID"], methodCall[int: "sessionType"])
        callBack(result, conversationID)
    }

    func setConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"], methodCall[int: "status"])
    }

    func getConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"])
    }
    
    func setOneConversationPrivateChat(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetOneConversationPrivateChat(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"],methodCall[bool: "isPrivate"])
    }
    
    func deleteConversationFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteConversationFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func deleteAllConversationFromLocal(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteAllConversationFromLocal(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func resetConversationGroupAtType(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkResetConversationGroupAtType(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func getAtAllTag(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkGetAtAllTag())
    }
    
    func setGlobalRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGlobalRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "status"])
    }
}


public class ConversationListener: NSObject, Open_im_sdk_callbackOnConversationListenerProtocol {
    
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onConversationChanged(_ conversationList: String?) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onConversationChanged", errCode: nil, errMsg: nil, data: conversationList)
    }
    
    public func onNewConversation(_ conversationList: String?) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onNewConversation", errCode: nil, errMsg: nil, data: conversationList)
    }
    
    public func onSyncServerFailed() {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerFailed", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onSyncServerFinish() {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerFinish", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onSyncServerStart() {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerStart", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onTotalUnreadMessageCountChanged(_ totalUnreadCount: Int32) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onTotalUnreadMessageCountChanged", errCode: nil, errMsg: nil, data: totalUnreadCount)
    }
}


