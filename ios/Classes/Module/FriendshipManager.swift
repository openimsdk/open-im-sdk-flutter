//
//  FriendshipManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/29.
//

import Foundation
import OpenIMCore

public class FriendshipManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setFriendListener"] = setFriendListener
        self["getFriendsInfo"] = getFriendsInfo
        self["addFriend"] = addFriend
        self["getFriendApplicationList"] = getFriendApplicationList
        self["getFriendList"] = getFriendList
        self["setFriendInfo"] = setFriendInfo
        self["addToBlackList"] = addToBlackList
        self["getBlackList"] = getBlackList
        self["deleteFromBlackList"] = deleteFromBlackList
        self["checkFriend"] = checkFriend
        self["deleteFromFriendList"] = deleteFromFriendList
        self["acceptFriendApplication"] = acceptFriendApplication
        self["refuseFriendApplication"] = refuseFriendApplication
//        self["forceSyncFriendApplication"] = forceSyncFriendApplication
//        self["forceSyncFriend"] = forceSyncFriend
//        self["forceSyncBlackList"] = forceSyncBlackList
    }
    
    func setFriendListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendListener(FriendshipListener(channel: channel))
        callBack(result)
    }
    
    func getFriendsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendsInfo(BaseCallback(result: result), methodCall[jsonString: "uidList"])
    }
    
    func addFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddFriend(BaseCallback(result: result), methodCall.toJsonString())
    }
    
    func getFriendApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationList(BaseCallback(result: result))
    }
    
    func getFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendList(BaseCallback(result: result))
    }
    
    func setFriendInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendInfo(methodCall.toJsonString(), BaseCallback(result: result))
    }
    
    func addToBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddToBlackList(BaseCallback(result: result), methodCall[jsonString: "uid"])
    }
    
    func getBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetBlackList(BaseCallback(result: result))
    }
    
    func deleteFromBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFromBlackList(BaseCallback(result: result), methodCall[jsonString: "uid"])
    }
    
    func checkFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCheckFriend(BaseCallback(result: result), methodCall[jsonString: "uidList"])
    }
    
    func deleteFromFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFromFriendList(methodCall[jsonString: "uid"], BaseCallback(result: result))
    }
    
    func acceptFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptFriendApplication(BaseCallback(result: result), methodCall[jsonString: "uid"])
    }
    
    func refuseFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseFriendApplication(BaseCallback(result: result), methodCall[jsonString: "uid"])
    }
    
//     func forceSyncFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
//         Open_im_sdkForceSyncFriendApplication()
//         callBack(result)
//     }
//
//     func forceSyncFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
//         Open_im_sdkForceSyncFriend()
//         callBack(result)
//     }
//
//     func forceSyncBlackList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
//         Open_im_sdkForceSyncBlackList()
//         callBack(result)
//     }
}

public class FriendshipListener: NSObject, Open_im_sdkOnFriendshipListenerProtocol {
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

