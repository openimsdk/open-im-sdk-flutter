//
//  MessageManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

import Foundation
import OpenIMCore

public class MessageManager: BaseServiceManager {
    private let KEY_ID: String = "id"
    private var listeners: [String: AdvancedMsgListener] = [:]
    
    public override func registerHandlers() {
        super.registerHandlers()
        
        self["addAdvancedMsgListener"] = addAdvancedMsgListener
        self["removeAdvancedMsgListener"] = removeAdvancedMsgListener
        self["sendMessage"] = sendMessage
        self["getHistoryMessageList"] = getHistoryMessageList
        self["revokeMessage"] = revokeMessage
        self["deleteMessageFromLocalStorage"] = deleteMessageFromLocalStorage
        self["deleteMessages"] = deleteMessages
        self["insertSingleMessageToLocalStorage"] = insertSingleMessageToLocalStorage
        self["findMessages"] = findMessages
        self["markC2CMessageAsRead"] = markC2CMessageAsRead
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
        self["createMergerMessage"] = createMergerMessage
        self["createForwardMessage"] = createForwardMessage
        self["createLocationMessage"] = createLocationMessage
        self["createCustomMessage"] = createCustomMessage
        self["createQuoteMessage"] = createQuoteMessage
        self["createCardMessage"] = createCardMessage
        self["forceSyncMsg"] = forceSyncMsg
        self["clearC2CHistoryMessage"] = clearC2CHistoryMessage
        self["clearGroupHistoryMessage"] = clearGroupHistoryMessage
    }
    
    func addAdvancedMsgListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let key = methodCall[string: KEY_ID]
        if listeners[key] == nil {
            let lis = AdvancedMsgListener(channel: channel, id: key)
            listeners[key] = lis
            Open_im_sdkAddAdvancedMsgListener(lis)
            print("=================add msg listener======\n\(lis)")
        }
        callBack(result)
    }
    
    func removeAdvancedMsgListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let key = methodCall[string: KEY_ID]
        if let lis = listeners[key] {
            listeners[key] = nil
//             Open_im_sdkRemoveAdvancedMsgListener(lis)
        }
        callBack(result)
    }
    
    func sendMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let sendMsgProgressListener: SendMsgProgressListener = SendMsgProgressListener(channel: channel,result: result,methodCall: methodCall)
//         sendMsgProgressListener.setCall(methodCall: methodCall)
//         sendMsgProgressListener.setResult(result: result)
        print("===============sendMessage===============")
        Open_im_sdkSendMessage(sendMsgProgressListener, methodCall[jsonString: "message"], methodCall[string: "userID"],
                               methodCall[string: "groupID"], methodCall[bool: "onlineUserOnly"])
    }
    
    func getHistoryMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetHistoryMessageList(BaseCallback(result: result), methodCall.toJsonString())
    }
    
    func revokeMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRevokeMessage(BaseCallback(result: result), methodCall.toJsonString())
    }
    
    func deleteMessageFromLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessageFromLocalStorage(BaseCallback(result: result), methodCall.toJsonString())
    }
    
    // deprecated
    func deleteMessages(methodCall: FlutterMethodCall, result: FlutterResult){
    }
    
    func insertSingleMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertSingleMessageToLocalStorage(BaseCallback(result: result), methodCall[jsonString: "message"],
                                                     methodCall[string: "receiverID"], methodCall[string: "senderID"])
    }
    
    func findMessages(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkFindMessages(BaseCallback(result: result), methodCall[jsonString: "messageIDList"])
    }

    func markC2CMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkC2CMessageAsRead(BaseCallback(result: result), methodCall[string: "userID"], methodCall[jsonString: "messageIDList"])
    }

    func typingStatusUpdate(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTypingStatusUpdate(methodCall[string: "userID"], methodCall[string: "typing"])
        callBack(result)
    }

    func createTextMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateTextMessage(methodCall[string: "text"]))
    }
    
    func createTextAtMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateTextAtMessage(methodCall[string: "text"], methodCall[jsonString: "atUserList"]))
    }
    
    func createImageMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessage(methodCall[string: "imagePath"]))
    }
    
    func createImageMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateImageMessageFromFullPath(methodCall[string: "imagePath"]))
    }
    
    func createSoundMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateSoundMessage(methodCall[string: "soundPath"], methodCall[int64: "duration"]))
    }
    
    func createSoundMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateSoundMessageFromFullPath(methodCall[string: "soundPath"], methodCall[int64: "duration"]))
    }
    
    func createVideoMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateVideoMessage(methodCall[string: "videoPath"], methodCall[string: "videoType"],
                                                  methodCall[int64: "duration"], methodCall[string: "snapshotPath"])
        callBack(result, prama)
    }
    
    func createVideoMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateVideoMessageFromFullPath(methodCall[string: "videoPath"], methodCall[string: "videoType"],
                                                  methodCall[int64: "duration"], methodCall[string: "snapshotPath"])
        callBack(result, prama)
    }
    
    func createFileMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateFileMessage(methodCall[string: "filePath"], methodCall[string: "fileName"]))
    }

     func createFileMessageFromFullPath(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
         callBack(result, Open_im_sdkCreateFileMessageFromFullPath(methodCall[string: "filePath"], methodCall[string: "fileName"]))
     }

    func createMergerMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateMergerMessage(methodCall[jsonString: "messageList"], methodCall[string: "title"],
                                                   methodCall[jsonString: "summaryList"])
        callBack(result, prama)
    }
    
    func createForwardMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateForwardMessage(methodCall[jsonString: "message"]))
    }
    
    func createLocationMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateLocationMessage(methodCall[string: "description"],
                                                     methodCall[double: "longitude"], methodCall[double: "latitude"])
        callBack(result, prama)
    }
    
    func createCustomMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateCustomMessage(methodCall[string: "data"],
                                                   methodCall[string: "extension"], methodCall[string: "description"])
        callBack(result, prama)
    }
    
    func createQuoteMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateQuoteMessage(methodCall[string: "quoteText"], methodCall[jsonString: "quoteMessage"])
        callBack(result, prama)
    }
    
    func createCardMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkCreateCardMessage(methodCall[jsonString: "cardMessage"]))
    }

    func forceSyncMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkForceSyncMsg()
        callBack(result)
    }

    func clearC2CHistoryMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearC2CHistoryMessage(BaseCallback(result: result), methodCall[string: "userID"])
    }

    func clearGroupHistoryMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkClearGroupHistoryMessage(BaseCallback(result: result), methodCall[string: "groupID"])
    }

    public class SendMsgProgressListener: NSObject, Open_im_sdkSendMsgCallBackProtocol {
        private let channel: FlutterMethodChannel
        private let result: FlutterResult
        private let call: FlutterMethodCall

        init(channel: FlutterMethodChannel, result: @escaping FlutterResult, methodCall: FlutterMethodCall) {
            self.channel = channel
            self.result = result
            self.call = methodCall
        }

//         func setResult(result: @escaping FlutterResult){
//             self.result = result
//         }
//
//         func setCall(methodCall: FlutterMethodCall){
//             self.call = methodCall
//         }

        public func onError(_ errCode: Int, errMsg: String?) {
            print("=================onError============\nerrcode:\(errCode),errMsg:\(errMsg!)")
            DispatchQueue.main.async { self.result(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
        }

        public func onProgress(_ progress: Int) {
//             guard let call = call else {
//                 return
//             }
            var values: [String: Any] = [:]
            print("=================onProgress============\nprogress:\(progress)")
            let message = call[dict: "message"]
            values["clientMsgID"] = message["clientMsgID"]
            values["progress"] = progress
            CommonUtil.emitEvent(channel: channel, method: "msgSendProgressListener", type: "onProgress", errCode: nil, errMsg: nil, data: values)
        }

        public func onSuccess(_ data: String?) {
            print("=================onSuccess============\nsuccess:\(data!)")
            DispatchQueue.main.async { self.result(data) }
        }

    }

    public class AdvancedMsgListener: NSObject, Open_im_sdkOnAdvancedMsgListenerProtocol {
        private let channel: FlutterMethodChannel
        private let id: String

//         private var values: [String: Any] = [:]

        init(channel: FlutterMethodChannel, id: String) {
            self.channel = channel
            self.id = id
//             values["id"] = id
        }

        public func onRecvC2CReadReceipt(_ msgReceiptList: String?) {
            var values: [String: Any] = [:]
            values["id"] = id
            values["haveReadMessage"] = msgReceiptList
            CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvC2CReadReceipt", errCode: nil, errMsg: nil, data: values)
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
    }
}
