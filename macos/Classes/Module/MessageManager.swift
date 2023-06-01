import Foundation
import OpenIMCore
import FlutterMacOS

public class MessageManager: BaseServiceManager {
    private let KEY_ID: String = "id"
    // private var listeners: [String: AdvancedMsgListener] = [:]
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setAdvancedMsgListener"] = setAdvancedMsgListener
        self["sendMessage"] = sendMessage
        self["getHistoryMessageList"] = getHistoryMessageList
        self["revokeMessage"] = revokeMessage
        self["deleteMessageFromLocalStorage"] = deleteMessageFromLocalStorage
        self["insertSingleMessageToLocalStorage"] = insertSingleMessageToLocalStorage
        self["insertGroupMessageToLocalStorage"] = insertGroupMessageToLocalStorage
        self["markC2CMessageAsRead"] = markC2CMessageAsRead
        self["markGroupMessageAsRead"] = markGroupMessageAsRead
        self["typingStatusUpdate"] = typingStatusUpdate
        self["createTextMessage"] = createTextMessage
        self["createTextAtMessage"] = createTextAtMessage
        self["createImageMessage"] = createImageMessage
        self["createImageMessageFromFullPath"] = createImageMessageFromFullPath
        self["createSoundMessage"] = createSoundMessage
        self["createSoundMessageFromFullPath"] = createSoundMessageFromFullPath
        self["createVideoMessage"] = createVideoMessage
        self["createVideoMessageFromFullPath"] = createVideoMessageFromFullPath
        self["createFileMessage"] = createFileMessage
        self["createFileMessageFromFullPath"] = createFileMessageFromFullPath
        self["createMergerMessage"] = createMergerMessage
        self["createForwardMessage"] = createForwardMessage
        self["createLocationMessage"] = createLocationMessage
        self["createCustomMessage"] = createCustomMessage
        self["createQuoteMessage"] = createQuoteMessage
        self["createCardMessage"] = createCardMessage
        self["createFaceMessage"] = createFaceMessage
        self["clearC2CHistoryMessage"] = clearC2CHistoryMessage
        self["clearGroupHistoryMessage"] = clearGroupHistoryMessage
        self["searchLocalMessages"] = searchLocalMessages
        self["deleteMessageFromLocalAndSvr"] = deleteMessageFromLocalAndSvr
        self["deleteAllMsgFromLocal"] = deleteAllMsgFromLocal
        self["deleteAllMsgFromLocalAndSvr"] = deleteAllMsgFromLocalAndSvr
        self["markMessageAsReadByConID"] = markMessageAsReadByConID
        self["clearC2CHistoryMessageFromLocalAndSvr"] = clearC2CHistoryMessageFromLocalAndSvr
        self["clearGroupHistoryMessageFromLocalAndSvr"] = clearGroupHistoryMessageFromLocalAndSvr
        self["getHistoryMessageListReverse"] = getHistoryMessageListReverse
        self["newRevokeMessage"] = newRevokeMessage
        self["getAdvancedHistoryMessageList"] = getAdvancedHistoryMessageList
        self["findMessageList"] = findMessageList
        self["createAdvancedTextMessage"] = createAdvancedTextMessage
        self["createAdvancedQuoteMessage"] = createAdvancedQuoteMessage
        self["sendMessageNotOss"] = sendMessageNotOss
        self["createImageMessageByURL"] = createImageMessageByURL
        self["createSoundMessageByURL"] = createSoundMessageByURL
        self["createVideoMessageByURL"] = createVideoMessageByURL
        self["createFileMessageByURL"] = createFileMessageByURL
        self["setCustomBusinessListener"] = setCustomBusinessListener
        self["setMessageKvInfoListener"] = setMessageKvInfoListener
        self["setMessageReactionExtensions"] = setMessageReactionExtensions
        self["deleteMessageReactionExtensions"] = deleteMessageReactionExtensions
        self["getMessageListReactionExtensions"] = getMessageListReactionExtensions
        self["addMessageReactionExtensions"] = addMessageReactionExtensions
        self["getMessageListSomeReactionExtensions"] = getMessageListSomeReactionExtensions
    }
    
    func setAdvancedMsgListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let key = methodCall[string: KEY_ID]
        let lis = AdvancedMsgListener(channel: channel, id: key)
        Open_im_sdkSetAdvancedMsgListener(lis)
        callBack(result)
    }
    
    func sendMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let sendMsgProgressListener: SendMsgProgressListener = SendMsgProgressListener(channel: channel,result: result,methodCall: methodCall)
        Open_im_sdkSendMessage(sendMsgProgressListener, methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[string: "userID"],
                               methodCall[string: "groupID"], methodCall[jsonString: "offlinePushInfo"])
    }
    
    func getHistoryMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetHistoryMessageList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func revokeMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRevokeMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func deleteMessageFromLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessageFromLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    
    func insertSingleMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertSingleMessageToLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"],
                                                     methodCall[string: "receiverID"], methodCall[string: "senderID"])
    }
    
    func insertGroupMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertGroupMessageToLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"],
                                                     methodCall[string: "groupID"], methodCall[string: "senderID"])
    }
    
    func markC2CMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkC2CMessageAsRead(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"], methodCall[jsonString: "messageIDList"])
    }

    func markGroupMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkGroupMessageAsRead(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[jsonString: "messageIDList"])
    }

    func typingStatusUpdate(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTypingStatusUpdate(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"], methodCall[string: "msgTip"])
    }
    
    func createTextMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateTextMessage(methodCall[string: "operationID"], methodCall[string: "text"]))
    }
    
    func createTextAtMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateTextAtMessage(methodCall[string: "operationID"], methodCall[string: "text"],
                                                        methodCall[jsonString: "atUserIDList"], methodCall[jsonString: "atUserInfoList"], methodCall[jsonString: "quoteMessage"]))
    }
    
    func createImageMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessage(methodCall[string: "operationID"], methodCall[string: "imagePath"]))
    }
    
    func createImageMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessageFromFullPath(methodCall[string: "operationID"], methodCall[string: "imagePath"]))
    }
    
    func createSoundMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateSoundMessage(methodCall[string: "operationID"], methodCall[string: "soundPath"], methodCall[int64: "duration"]))
    }
    
    func createSoundMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateSoundMessageFromFullPath(methodCall[string: "operationID"], methodCall[string: "soundPath"], methodCall[int64: "duration"]))
    }
    
    func createVideoMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateVideoMessage(methodCall[string: "operationID"], methodCall[string: "videoPath"], methodCall[string: "videoType"],
                                                  methodCall[int64: "duration"], methodCall[string: "snapshotPath"])
        callBack(result, prama)
    }
    
    func createVideoMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateVideoMessageFromFullPath(methodCall[string: "operationID"], methodCall[string: "videoPath"], methodCall[string: "videoType"],
                                                              methodCall[int64: "duration"], methodCall[string: "snapshotPath"])
        callBack(result, prama)
    }
    
    func createFileMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateFileMessage(methodCall[string: "operationID"], methodCall[string: "filePath"], methodCall[string: "fileName"]))
    }
    
    func createFileMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateFileMessageFromFullPath(methodCall[string: "operationID"], methodCall[string: "filePath"], methodCall[string: "fileName"]))
    }
    
    func createMergerMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateMergerMessage(methodCall[string: "operationID"], methodCall[jsonString: "messageList"], methodCall[string: "title"],
                                                   methodCall[jsonString: "summaryList"])
        callBack(result, prama)
    }
    
    func createForwardMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateForwardMessage(methodCall[string: "operationID"], methodCall[jsonString: "message"]))
    }
    
    func createLocationMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateLocationMessage(methodCall[string: "operationID"], methodCall[string: "description"],
                                                     methodCall[double: "longitude"], methodCall[double: "latitude"])
        callBack(result, prama)
    }
    
    func createCustomMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateCustomMessage(methodCall[string: "operationID"], methodCall[string: "data"],
                                                   methodCall[string: "extension"], methodCall[string: "description"])
        callBack(result, prama)
    }
    
    func createQuoteMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateQuoteMessage(methodCall[string: "operationID"], methodCall[string: "quoteText"], methodCall[jsonString: "quoteMessage"])
        callBack(result, prama)
    }
    
    func createCardMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateCardMessage(methodCall[string: "operationID"], methodCall[jsonString: "cardMessage"]))
    }
    
    func createFaceMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateFaceMessage(methodCall[string: "operationID"], methodCall[int: "index"], methodCall[string: "data"]))
    }

    func createAdvancedTextMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateAdvancedTextMessage(methodCall[string: "operationID"], methodCall[string: "text"], methodCall[jsonString: "richMessageInfoList"])
        callBack(result, prama)
    }
    
    func createAdvancedQuoteMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateAdvancedQuoteMessage(methodCall[string: "operationID"], methodCall[string: "quoteText"], methodCall[jsonString: "quoteMessage"], methodCall[jsonString: "richMessageInfoList"])
        callBack(result, prama)
    }
    
    func clearC2CHistoryMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearC2CHistoryMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func clearGroupHistoryMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearGroupHistoryMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func searchLocalMessages(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchLocalMessages(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "filter"])
    }
    
    func deleteMessageFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkDeleteMessageFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }

    func deleteAllMsgFromLocal(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkDeleteAllMsgFromLocal(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func deleteAllMsgFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkDeleteAllMsgFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func markMessageAsReadByConID(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkMarkMessageAsReadByConID(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[jsonString: "messageIDList"])
    }
    
    func clearC2CHistoryMessageFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearC2CHistoryMessageFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func clearGroupHistoryMessageFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearGroupHistoryMessageFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func getHistoryMessageListReverse(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetHistoryMessageListReverse(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func newRevokeMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkNewRevokeMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func getAdvancedHistoryMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAdvancedHistoryMessageList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func findMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkFindMessageList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParams"])
    }
    
    func sendMessageNotOss(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let sendMsgProgressListener: SendMsgProgressListener = SendMsgProgressListener(channel: channel,result: result,methodCall: methodCall)
        Open_im_sdkSendMessageNotOss(sendMsgProgressListener, methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[string: "userID"],
                               methodCall[string: "groupID"], methodCall[jsonString: "offlinePushInfo"])
    }
    
    func createImageMessageByURL(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessageByURL(methodCall[string: "operationID"], methodCall[jsonString: "sourcePicture"], methodCall[jsonString: "bigPicture"], methodCall[jsonString: "snapshotPicture"]))
    }
    
    func createSoundMessageByURL(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateSoundMessageByURL(methodCall[string: "operationID"], methodCall[jsonString: "soundElem"]))
    }
    
    func createVideoMessageByURL(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateVideoMessageByURL(methodCall[string: "operationID"], methodCall[jsonString: "videoElem"]))
    }
    
    func createFileMessageByURL(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateFileMessageByURL(methodCall[string: "operationID"], methodCall[jsonString: "fileElem"]))
    }
    
    func setCustomBusinessListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetCustomBusinessListener(CustomBusinessListener(channel: channel))
        callBack(result)
    }
    
    func setMessageKvInfoListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetMessageKvInfoListener(MessageKvInfoListener(channel: channel))
        callBack(result)
    }
    
    func setMessageReactionExtensions(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetMessageReactionExtensions(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[jsonString: "list"])
    }
    
    func deleteMessageReactionExtensions(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessageReactionExtensions(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[jsonString: "list"])
    }
    
    func getMessageListReactionExtensions(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMessageListReactionExtensions(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "messageList"])
    }
    
    func addMessageReactionExtensions(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddMessageReactionExtensions(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[jsonString: "list"])
    }
    
    func getMessageListSomeReactionExtensions(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMessageListSomeReactionExtensions(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "messageList"], methodCall[jsonString: "list"])
    }
}

public class SendMsgProgressListener: NSObject, Open_im_sdk_callbackSendMsgCallBackProtocol {
    private let channel: FlutterMethodChannel
    private let result: FlutterResult
    private let call: FlutterMethodCall
    
    init(channel: FlutterMethodChannel, result: @escaping FlutterResult, methodCall: FlutterMethodCall) {
        self.channel = channel
        self.result = result
        self.call = methodCall
    }
    
    public func onError(_ errCode: Int32, errMsg: String?) {
        DispatchQueue.main.async { self.result(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
    }
    
    public func onProgress(_ progress: Int) {
        var values: [String: Any] = [:]
        let message = call[dict: "message"]
        values["clientMsgID"] = message["clientMsgID"]
        values["progress"] = progress
        CommonUtil.emitEvent(channel: channel, method: "msgSendProgressListener", type: "onProgress", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onSuccess(_ data: String?) {
        DispatchQueue.main.async { self.result(data) }
    }
    
}

public class AdvancedMsgListener: NSObject, Open_im_sdk_callbackOnAdvancedMsgListenerProtocol {
 
    private let channel: FlutterMethodChannel
    private let id: String
    
    init(channel: FlutterMethodChannel, id: String) {
        self.channel = channel
        self.id = id
    }
    
    public func onRecvC2CReadReceipt(_ msgReceiptList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["c2cMessageReadReceipt"] = msgReceiptList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvC2CReadReceipt", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvGroupReadReceipt(_ groupMsgReceiptList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["groupMessageReadReceipt"] = groupMsgReceiptList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvGroupReadReceipt", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvMessageRevoked(_ msgId: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["revokedMessage"] = msgId
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvMessageRevoked", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvNewMessage(_ message: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["newMessage"] = message
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvNewMessage", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onNewRecvMessageRevoked(_ messageRevoked: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["revokedMessageV2"] = messageRevoked
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onNewRecvMessageRevoked", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvMessageExtensionsChanged(_ msgID: String?, reactionExtensionList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["msgID"] = msgID
        values["list"] = reactionExtensionList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvMessageExtensionsChanged", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvMessageExtensionsDeleted(_ msgID: String?, reactionExtensionKeyList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["msgID"] = msgID
        values["list"] = reactionExtensionKeyList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvMessageExtensionsDeleted", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvMessageExtensionsAdded(_ msgID: String?, reactionExtensionList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["msgID"] = msgID
        values["list"] = reactionExtensionList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvMessageExtensionsAdded", errCode: nil, errMsg: nil, data: values)
    }
    
}

public class CustomBusinessListener: NSObject, Open_im_sdk_callbackOnCustomBusinessListenerProtocol {
    private let channel: FlutterMethodChannel
    
    init(channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onRecvCustomBusinessMessage(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "customBusinessListener", type: "onRecvCustomBusinessMessage", errCode: nil, errMsg: nil, data: s)
    }
}


public class MessageKvInfoListener: NSObject, Open_im_sdk_callbackOnMessageKvInfoListenerProtocol {
  
    
    private let channel: FlutterMethodChannel
    
    init(channel: FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onMessageKvInfoChanged(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "messageKvInfoListener", type: "onMessageKvInfoChanged", errCode: nil, errMsg: nil, data: s)
    }

}
