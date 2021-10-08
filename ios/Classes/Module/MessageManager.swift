//
//  MessageManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

import Foundation
import OpenIMCore

public class MessageManager:NSObject{
    private let KEY_ID: String = "id"
    private let channel:FlutterMethodChannel
    private let listeners: NSMutableDictionary = NSMutableDictionary(capacity: 0)
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    func addAdvancedMsgListener(methodCall: FlutterMethodCall, result: FlutterResult){
    
        let d = methodCall.arguments as! NSDictionary
        let key = d.value(forKey: KEY_ID) as! String
        if !listeners.allKeys.contains(where: {($0 as! String).compare(key) == .orderedSame}) {
            let lis = AdvancedMsgListener(channel: channel, id: key)
            let k = methodCall.arguments as! NSDictionary
            let s = k.value(forKey: KEY_ID) as! String
            listeners.setValue(lis, forKey: s)
            Open_im_sdkAddAdvancedMsgListener(lis)
            print("=================add msg listener======\n\(lis)");
        }
    }
    
    func removeAdvancedMsgListener(methodCall: FlutterMethodCall, result: FlutterResult){
        let k = methodCall.arguments as! NSDictionary
        let s = k.value(forKey: KEY_ID) as! String
        if listeners.allKeys.contains(where: {($0 as! String).compare(s) == .orderedSame}) {
            let lis = listeners.value(forKey: s) as! AdvancedMsgListener
            listeners.removeObject(forKey: s)
            Open_im_sdkRemoveAdvancedMsgListener(lis)
        }
    }
    
    func sendMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let sendMsgProgressListener: SendMsgProgressListener = SendMsgProgressListener(channel: channel)
        sendMsgProgressListener.setCall(methodCall: methodCall)
        sendMsgProgressListener.setResult(result: result)
        print("===============sendMessage===============")
        Open_im_sdkSendMessage(sendMsgProgressListener, CommonUtil.getSendMessageContent(methodCall: methodCall), CommonUtil.getSendMessageReceiver(methodCall: methodCall), CommonUtil.getSendMessageGroupId(methodCall: methodCall), CommonUtil.getSendMessageOnlineOnly(methodCall: methodCall))
    }
    
    func getHistoryMessageList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetHistoryMessageList(BaseImpl(result: result), CommonUtil.getSDKJsonParam(methodCall: methodCall))
    }
    
    func revokeMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRevokeMessage(BaseImpl(result: result), CommonUtil.getSDKJsonParam(methodCall: methodCall))
    }
    
    func deleteMessageFromLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteMessageFromLocalStorage(BaseImpl(result: result), CommonUtil.getSDKJsonParam(methodCall: methodCall))
    }
    
    func deleteMessages(methodCall: FlutterMethodCall, result: FlutterResult){
    }
    
    func insertSingleMessageToLocalStorage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInsertSingleMessageToLocalStorage(BaseImpl(result: result), CommonUtil.getSingleMessageContent(methodCall: methodCall), CommonUtil.getSingleMessageUserid(methodCall: methodCall), CommonUtil.getSingleMessageSender(methodCall: methodCall))
    }
    
    func findMessages(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkFindMessages(BaseImpl(result: result), CommonUtil.getMessageIds(methodCall: methodCall))
    }

    func markC2CMessageAsRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkC2CMessageAsRead(BaseImpl(result: result), CommonUtil.getUserid(methodCall: methodCall), CommonUtil.getMessageIds(methodCall: methodCall))
    }

    func typingStatusUpdate(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let receiver = CommonUtil.getUserid(methodCall: methodCall)
        let typing = CommonUtil.getTyping(methodCall: methodCall)
        Open_im_sdkTypingStatusUpdate(receiver, typing)
        DispatchQueue.main.async { result(nil) }
    }

    func markGroupMessageHasRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkMarkGroupMessageHasRead(BaseImpl(result: result), CommonUtil.getGroupMessageGroupid(methodCall: methodCall))
    }

    func createTextMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateTextMessage(CommonUtil.getMessageText(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createTextAtMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateTextAtMessage(CommonUtil.getMessageText(methodCall: methodCall), CommonUtil.getAtUserList(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createImageMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateImageMessage(CommonUtil.getImagePath(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createSoundMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateSoundMessage(CommonUtil.getSoundPath(methodCall: methodCall),CommonUtil.getSoundDuration(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createVideoMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateVideoMessage(CommonUtil.getVideoPath(methodCall: methodCall), CommonUtil.getVideoType(methodCall: methodCall), CommonUtil.getVideoDuration(methodCall: methodCall), CommonUtil.getVideoSnapshotPath(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createFileMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateFileMessage(CommonUtil.getFilePath(methodCall: methodCall), CommonUtil.getFileName(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createMergerMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateMergerMessage(CommonUtil.getMergerMessageList(methodCall: methodCall), CommonUtil.getMergerMessageTitle(methodCall: methodCall), CommonUtil.getSummaryList(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }
    
    func createForwardMessage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let prama = Open_im_sdkCreateForwardMessage(CommonUtil.getForwardMessage(methodCall: methodCall))
        DispatchQueue.main.async { result(prama) }
    }

    func forceSyncMsg(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkForceSyncMsg()
    }

    public class SendMsgProgressListener:NSObject, Open_im_sdkSendMsgCallBackProtocol {

        private let channel: FlutterMethodChannel
        private var result: FlutterResult?
        private var call: FlutterMethodCall?
        private let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)

        init(channel: FlutterMethodChannel) {
            self.channel = channel
        }

        func setResult(result: @escaping FlutterResult){
            self.result = result
        }

        func setCall(methodCall: FlutterMethodCall){
            self.call = methodCall
        }

        public func onError(_ errCode: Int, errMsg: String?) {
            print("=================onError============\nerrcode:\(errCode),errMsg:\(errMsg!)");
            DispatchQueue.main.async { self.result!(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
        }

        public func onProgress(_ progress: Int) {
            print("=================onProgress============\nprogress:\(progress)");
            values.setValue(CommonUtil.getSendMessageClientMsgID(methodCall: self.call!), forKey: "clientMsgID")
            values.setValue(progress, forKey: "progress")
            CommonUtil.emitEvent(channel: channel, method: "msgSendProgressListener", type: "onProgress", errCode: nil, errMsg: nil, data: values)
        }

        public func onSuccess(_ data: String?) {
            print("=================onSuccess============\nsuccess:\(data!)");
            DispatchQueue.main.async { self.result!(data) }
        }

    }

    public class AdvancedMsgListener: NSObject, Open_im_sdkOnAdvancedMsgListenerProtocol {
        private let channel: FlutterMethodChannel
        private let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)

        init(channel: FlutterMethodChannel, id: String) {
            self.channel = channel
            values.setValue(id, forKey: "id")
        }

        public func onRecvC2CReadReceipt(_ msgReceiptList: String?) {
            values.setValue(msgReceiptList, forKey: "message")
            CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvC2CReadReceipt", errCode: nil, errMsg: nil, data: values)
        }

        public func onRecvMessageRevoked(_ msgId: String?) {
            values.setValue(msgId, forKey: "message")
            CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvMessageRevoked", errCode: nil, errMsg: nil, data: values)
        }

        public func onRecvNewMessage(_ message: String?) {
            values.setValue(message, forKey: "message")
            CommonUtil.emitEvent(channel: channel, method: "advancedMsgListener", type: "onRecvNewMessage", errCode: nil, errMsg: nil, data: values)
        }
    }
}
