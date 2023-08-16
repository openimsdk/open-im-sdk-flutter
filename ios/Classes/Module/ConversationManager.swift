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
        self["setConversationDraft"] = setConversationDraft
        self["pinConversation"] = pinConversation
        self["hideConversation"] = hideConversation
        self["markConversationMessageAsRead"] = markConversationMessageAsRead
        self["getTotalUnreadMsgCount"] = getTotalUnreadMsgCount
        self["getConversationIDBySessionType"] = getConversationIDBySessionType
        self["setConversationRecvMessageOpt"] = setConversationRecvMessageOpt
        self["getConversationRecvMessageOpt"] = getConversationRecvMessageOpt
        self["setConversationPrivateChat"] = setConversationPrivateChat
        self["clearConversationAndDeleteAllMsg"] = clearConversationAndDeleteAllMsg
        self["deleteConversationAndDeleteAllMsg"] = deleteConversationAndDeleteAllMsg
        self["deleteAllConversationFromLocal"] = deleteAllConversationFromLocal
        self["resetConversationGroupAtType"] = resetConversationGroupAtType
        self["getAtAllTag"] = getAtAllTag
        self["setGlobalRecvMessageOpt"] = setGlobalRecvMessageOpt
        self["setConversationBurnDuration"] = setConversationBurnDuration
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
        Open_im_sdkGetOneConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int32: "sessionType"], methodCall[string: "sourceID"])
    }
    
    func getMultipleConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMultipleConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"])
    }
    
    func setConversationDraft(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationDraft(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[string: "draftText"])
    }
    
    func pinConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkPinConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[bool: "isPinned"])
    }
    
    func hideConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkHideConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func markConversationMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkConversationMessageAsRead(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func getTotalUnreadMsgCount(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetTotalUnreadMsgCount(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getConversationIDBySessionType(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let conversationID = Open_im_sdkGetConversationIDBySessionType( methodCall[string: "operationID"],methodCall[string: "sourceID"], methodCall[int: "sessionType"])
        callBack(result, conversationID)
    }

    func setConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[int: "status"])
    }

    func getConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"])
    }
    
    func setConversationPrivateChat(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationPrivateChat(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"],methodCall[bool: "isPrivate"])
    }
    
    func clearConversationAndDeleteAllMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearConversationAndDeleteAllMsg(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func deleteConversationAndDeleteAllMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteConversationAndDeleteAllMsg(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func deleteAllConversationFromLocal(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteAllConversationFromLocal(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func resetConversationGroupAtType(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkResetConversationGroupAtType(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func getAtAllTag(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkGetAtAllTag(methodCall[string: "operationID"]))
    }
    
    func setGlobalRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGlobalRecvMessageOpt(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "status"])
    }
    
    func setConversationBurnDuration(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationBurnDuration(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[int32: "burnDuration"])
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


