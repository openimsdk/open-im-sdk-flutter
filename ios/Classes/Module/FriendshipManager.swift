//
//  FriendshipManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

import Foundation
import OpenIMCore

public class FriendshipManager:NSObject{
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    func setFriendListener(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkSetFriendListener(FriendshipListener(channel: channel))
    }
    
    func getFriendsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendsInfo(BaseImpl(result: result), CommonUtil.getUidList(methodCall: methodCall))
    }
    
    func addFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddFriend(BaseImpl(result: result), CommonUtil.getSDKJsonParam(methodCall: methodCall))
    }
    
    func getFriendApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationList(BaseImpl(result: result))
    }
    
    func getFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendList(BaseImpl(result: result))
    }
    
    func setFriendInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendInfo(CommonUtil.getSDKJsonParam(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func addToBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddToBlackList(BaseImpl(result: result), CommonUtil.getJsonUid(methodCall: methodCall))
    }
    
    func getBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetBlackList(BaseImpl(result: result))
    }
    
    func deleteFromBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFromBlackList(BaseImpl(result: result), CommonUtil.getJsonUid(methodCall: methodCall))
    }
    
    func checkFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCheckFriend(BaseImpl(result: result), CommonUtil.getUidList(methodCall: methodCall))
    }
    
    func deleteFromFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFromFriendList(CommonUtil.getJsonUid(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func acceptFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptFriendApplication(BaseImpl(result: result), CommonUtil.getJsonUid(methodCall: methodCall))
    }
    
    func refuseFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseFriendApplication(BaseImpl(result: result), CommonUtil.getJsonUid(methodCall: methodCall))
    }
    
    func forceSyncFriendApplication(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkForceSyncFriendApplication();
    }
    
    func forceSyncFriend(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkForceSyncFriend()
    }
    
    func forceSyncBlackList(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkForceSyncBlackList()
    }
}

public class FriendshipListener:NSObject,Open_im_sdkOnFriendshipListenerProtocol {
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onBlackListAdd(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onBlackListAdd", errCode: nil, errMsg: nil, data: userInfo)
    }
    
    public func onBlackListDeleted(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onBlackListDeleted", errCode: nil, errMsg: nil, data: userInfo)
    }
    
    public func onFriendApplicationListAccept(_ applyUserInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationListAccept", errCode: nil, errMsg: nil, data: applyUserInfo)
    }
    
    public func onFriendApplicationListAdded(_ applyUserInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationListAdded", errCode: nil, errMsg: nil, data: applyUserInfo)
    }
    
    public func onFriendApplicationListDeleted(_ applyUserInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationListDeleted", errCode: nil, errMsg: nil, data: applyUserInfo)
    }
    
    public func onFriendApplicationListReject(_ applyUserInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationListReject", errCode: nil, errMsg: nil, data: applyUserInfo)
    }
    
    public func onFriendInfoChanged(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendInfoChanged", errCode: nil, errMsg: nil, data: friendInfo)
    }
    
    public func onFriendListAdded(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendListAdded", errCode: nil, errMsg: nil, data: friendInfo)
    }
    
    public func onFriendListDeleted(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendListDeleted", errCode: nil, errMsg: nil, data: friendInfo)
    }
    
}
