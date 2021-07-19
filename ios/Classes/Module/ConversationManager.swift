//
//  ConversationManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

import Foundation
import OpenIMCore

public class ConversationManager:NSObject{
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    func setConversationListener(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkSetConversationListener(ConversationListener(channel: channel))
    }
    
    func getAllConversationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetAllConversationList(BaseImpl(result: result))
    }
    
    func getOneConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetOneConversation(CommonUtil.getConversationSourceId(methodCall: methodCall), CommonUtil.getConversationSessionType(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getMultipleConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetMultipleConversation(CommonUtil.getConversationIds(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func deleteConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteConversation(CommonUtil.getConversationId(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func setConversationDraft(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetConversationDraft(CommonUtil.getConversationId(methodCall: methodCall), CommonUtil.getConversationDraft(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func pinConversation(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkPinConversation(CommonUtil.getConversationId(methodCall: methodCall), CommonUtil.isPinnedConversation(methodCall: methodCall), BaseImpl(result: result))
    }
}


public class ConversationListener:NSObject,Open_im_sdkOnConversationListenerProtocol {
    
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

