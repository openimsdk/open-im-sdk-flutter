import Foundation
import OpenIMCore

public class ConversationManager: BaseServiceManager {

    public override func registerHandlers() {
        super.registerHandlers()
        self["changeInputStates"] = changeInputStates
        self["clearConversationAndDeleteAllMsg"] = clearConversationAndDeleteAllMsg
        self["deleteConversationAndDeleteAllMsg"] = deleteConversationAndDeleteAllMsg
        self["getAllConversationList"] = getAllConversationList
        self["getAtAllTag"] = getAtAllTag
        self["getConversationIDBySessionType"] = getConversationIDBySessionType
        self["getConversationListSplit"] = getConversationListSplit
        self["getInputStates"] = getInputStates
        self["getMultipleConversation"] = getMultipleConversation
        self["getOneConversation"] = getOneConversation
        self["getTotalUnreadMsgCount"] = getTotalUnreadMsgCount
        self["hideAllConversations"] = hideAllConversations
        self["hideConversation"] = hideConversation
        self["markConversationMessageAsRead"] = markConversationMessageAsRead
        self["searchConversation"] = searchConversation
        self["setConversationDraft"] = setConversationDraft
        self["setConversationListener"] = setConversationListener
        self["setConversation"] = setConversation
        self["searchConversations"] = searchConversations
    }

    func changeInputStates(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkChangeInputStates(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[bool: "focus"])
    }

    func clearConversationAndDeleteAllMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkClearConversationAndDeleteAllMsg(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }

    func deleteConversationAndDeleteAllMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkDeleteConversationAndDeleteAllMsg(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }

    func getAllConversationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetAllConversationList(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getAtAllTag(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        callBack(result, Open_im_sdkGetAtAllTag(methodCall[string: "operationID"]))
    }

    func getConversationIDBySessionType(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        let conversationID = Open_im_sdkGetConversationIDBySessionType(methodCall[string: "operationID"], methodCall[string: "sourceID"], methodCall[int: "sessionType"])
        callBack(result, conversationID)
    }

    func getConversationListSplit(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetConversationListSplit(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "offset"], methodCall[int: "count"])
    }

    func getInputStates(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetInputStates(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[string: "userID"])
    }

    func getMultipleConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetMultipleConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "conversationIDList"])
    }

    func getOneConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetOneConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int32: "sessionType"], methodCall[string: "sourceID"])
    }

    func getTotalUnreadMsgCount(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetTotalUnreadMsgCount(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func hideAllConversations(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkHideAllConversations(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func hideConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkHideConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }

    func markConversationMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkMarkConversationMessageAsRead(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }

    func searchConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSearchConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "name"])
    }

    func setConversationDraft(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetConversationDraft(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[string: "draftText"])
    }

    func setConversationListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetConversationListener(ConversationListener(channel: channel))
        callBack(result)
    }

    func setConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[jsonString: "req"])
    }

    func searchConversations(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSearchConversation(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "name"])
    }
}

public class ConversationListener: NSObject, Open_im_sdk_callbackOnConversationListenerProtocol {

    private let channel: FlutterMethodChannel

    init(channel: FlutterMethodChannel) {
        self.channel = channel
    }

    public func onConversationChanged(_ conversationList: String?) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onConversationChanged", errCode: nil, errMsg: nil, data: conversationList)
    }

    public func onConversationUserInputStatusChanged(_ change: String?) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onConversationUserInputStatusChanged", errCode: nil, errMsg: nil, data: change)
    }

    public func onNewConversation(_ conversationList: String?) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onNewConversation", errCode: nil, errMsg: nil, data: conversationList)
    }

    public func onSyncServerFailed(_ reinstalled: Bool) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerFailed", errCode: nil, errMsg: nil, data: reinstalled)
    }

    public func onSyncServerFinish(_ reinstalled: Bool) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerFinish", errCode: nil, errMsg: nil, data: reinstalled)
    }

    public func onSyncServerProgress(_ progress: Int) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerProgress", errCode: nil, errMsg: nil, data: progress)
    }

    public func onSyncServerStart(_ reinstalled: Bool) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onSyncServerStart", errCode: nil, errMsg: nil, data: reinstalled)
    }

    public func onTotalUnreadMessageCountChanged(_ totalUnreadCount: Int32) {
        CommonUtil.emitEvent(channel: channel, method: "conversationListener", type: "onTotalUnreadMessageCountChanged", errCode: nil, errMsg: nil, data: totalUnreadCount)
    }
}
