//
//  ConversationManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

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
        self["markSingleMessageHasRead"] = markSingleMessageHasRead
        self["markGroupMessageHasRead"] = markGroupMessageHasRead
        self["getTotalUnreadMsgCount"] = getTotalUnreadMsgCount
        self["getConversationIDBySessionType"] = getConversationIDBySessionType
        self["setConversationRecvMessageOpt"] = setConversationRecvMessageOpt
        self["getConversationRecvMessageOpt"] = getConversationRecvMessageOpt
    }
    
    func setConversationListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationListener(ConversationListener(channel: channel))
        callBack(result)
    }
    
    func getAllConversationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAllConversationList(BaseCallback(result: result))
    }

    func getConversationListSplit(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetConversationListSplit(BaseCallback(result: result), methodCall[int: "offset"], methodCall[int: "count"])
    }

    func getOneConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetOneConversation(methodCall[string: "sourceID"], methodCall[int: "sessionType"], BaseCallback(result: result))
    }
    
    func getMultipleConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMultipleConversation(methodCall[jsonString: "conversationIDList"], BaseCallback(result: result))
    }
    
    func deleteConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteConversation(methodCall[string: "conversationID"], BaseCallback(result: result))
    }
    
    func setConversationDraft(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationDraft(methodCall[string: "conversationID"], methodCall[string: "draftText"], BaseCallback(result: result))
    }
    
    func pinConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkPinConversation(methodCall[string: "conversationID"], methodCall[bool: "isPinned"], BaseCallback(result: result))
    }
    
    func markSingleMessageHasRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkSingleMessageHasRead(BaseCallback(result: result), methodCall[string: "userID"])
    }
    
    func markGroupMessageHasRead(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkMarkGroupMessageHasRead(BaseCallback(result: result), methodCall[string: "groupID"])
    }
    
    func getTotalUnreadMsgCount(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetTotalUnreadMsgCount(BaseCallback(result: result))
    }
    
    func getConversationIDBySessionType(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        let conversationID = Open_im_sdkGetConversationIDBySessionType(methodCall[string: "sourceID"], methodCall[int: "sessionType"])
        callBack(result, conversationID)
    }

    func setConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[jsonString: "conversationIDList"], methodCall[int: "status"])
    }

    func getConversationRecvMessageOpt(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetConversationRecvMessageOpt(BaseCallback(result: result), methodCall[jsonString: "conversationIDList"])
    }
}


public class ConversationListener: NSObject, Open_im_sdkOnConversationListenerProtocol {
    
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


