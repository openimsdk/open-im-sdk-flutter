import Foundation
import OpenIMCore

public class MessageManager: BaseServiceManager {
    private let KEY_ID: String = "id"

    public override func registerHandlers() {
        super.registerHandlers()
        self["setAdvancedMsgListener"] = setAdvancedMsgListener
        self["sendMessage"] = sendMessage
        self["revokeMessage"] = revokeMessage
        self["deleteMessageFromLocalStorage"] = deleteMessageFromLocalStorage
        self["deleteMessageFromLocalAndSvr"] = deleteMessageFromLocalAndSvr
        self["deleteAllMsgFromLocal"] = deleteAllMsgFromLocal
        self["deleteAllMsgFromLocalAndSvr"] = deleteAllMsgFromLocalAndSvr
        self["insertSingleMessageToLocalStorage"] = insertSingleMessageToLocalStorage
        self["insertGroupMessageToLocalStorage"] = insertGroupMessageToLocalStorage
        self["markMessagesAsReadByMsgID"] = markMessagesAsReadByMsgID
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
        self["createAdvancedTextMessage"] = createAdvancedTextMessage
        self["createAdvancedQuoteMessage"] = createAdvancedQuoteMessage

        self["searchLocalMessages"] = searchLocalMessages
        self["clearConversationAndDeleteAllMsg"] = clearConversationAndDeleteAllMsg
    
        self["getAdvancedHistoryMessageList"] = getAdvancedHistoryMessageList
        self["getAdvancedHistoryMessageListReverse"] = getAdvancedHistoryMessageListReverse

        self["findMessageList"] = findMessageList
        self["setMessageLocalEx"] = setMessageLocalEx
        self["setAppBadge"] = setAppBadge

        self["sendMessageNotOss"] = sendMessageNotOss
        self["createImageMessageByURL"] = createImageMessageByURL
        self["createSoundMessageByURL"] = createSoundMessageByURL
        self["createVideoMessageByURL"] = createVideoMessageByURL
        self["createFileMessageByURL"] = createFileMessageByURL
        self["setCustomBusinessListener"] = setCustomBusinessListener
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
                               methodCall[string: "groupID"], methodCall[jsonString: "offlinePushInfo"], methodCall[bool: "isOnlineOnly"])
    }
    
    func revokeMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRevokeMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"],methodCall[string: "clientMsgID"])
    }
    
    func deleteMessageFromLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessageFromLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"],methodCall[string: "clientMsgID"])
    }
    
    func deleteMessageFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"],methodCall[string: "clientMsgID"])
    }
    
    func deleteAllMsgFromLocal(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteAllMsgFromLocal(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func deleteAllMsgFromLocalAndSvr(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteAllMsgFromLocalAndSvr(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func insertSingleMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertSingleMessageToLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"],
                                                     methodCall[string: "receiverID"], methodCall[string: "senderID"])
    }
    
    func insertGroupMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertGroupMessageToLocalStorage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "message"],
                                                     methodCall[string: "groupID"], methodCall[string: "senderID"])
    }
    
    func markMessagesAsReadByMsgID(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkMessagesAsReadByMsgID(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[jsonString: "messageIDList"])
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
    
    func searchLocalMessages(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchLocalMessages(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "filter"])
    }
    
    func clearConversationAndDeleteAllMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearConversationAndDeleteAllMsg(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"])
    }
    
    func getAdvancedHistoryMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAdvancedHistoryMessageList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func getAdvancedHistoryMessageListReverse(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAdvancedHistoryMessageListReverse(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
   
    
    func findMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkFindMessageList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParams"])
    }

    func setMessageLocalEx(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetMessageLocalEx(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "conversationID"], methodCall[string: "clientMsgID"], methodCall[string: "localEx"])
    }

    func setAppBadge(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetAppBadge(BaseCallback(result: result), methodCall[string: "operationID"], Int32(methodCall[int64: "count"]))
    }
    
    func sendMessageNotOss(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let sendMsgProgressListener: SendMsgProgressListener = SendMsgProgressListener(channel: channel,result: result,methodCall: methodCall)
        Open_im_sdkSendMessageNotOss(sendMsgProgressListener, methodCall[string: "operationID"], methodCall[jsonString: "message"], methodCall[string: "userID"], methodCall[string: "groupID"], methodCall[jsonString: "offlinePushInfo"], methodCall[bool: "isOnlineOnly"])
    }
    
    func createImageMessageByURL(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessageByURL(methodCall[string: "operationID"], methodCall[string: "sourcePath"], methodCall[jsonString: "sourcePicture"], methodCall[jsonString: "bigPicture"], methodCall[jsonString: "snapshotPicture"]))
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
    
    public func onMsgDeleted(_ message: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["message"] = message
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onMsgDeleted", errCode: nil, errMsg: nil, data: values);
    }
    
    public func onNewRecvMessageRevoked(_ messageRevoked: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["messageRevoked"] = messageRevoked
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onNewRecvMessageRevoked", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvC2CReadReceipt(_ msgReceiptList: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["msgReceiptList"] = msgReceiptList
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvC2CReadReceipt", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onRecvNewMessage(_ message: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["message"] = message
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvNewMessage", errCode: nil, errMsg: nil, data: values)
    }

    public func onRecvOfflineNewMessage(_ message: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["message"] = message
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvOfflineNewMessage", errCode: nil, errMsg: nil, data: values);
    }

    public func onRecvOnlineOnlyMessage(_ message: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["message"] = message
        CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvOnlineOnlyMessage", errCode: nil, errMsg: nil, data: values);
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
