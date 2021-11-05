//
//  IMManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/28.
//

import Foundation
import OpenIMCore

public class IMMananger: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        
        self["initSDK"] = initSDK
        self["login"] = login
        self["logout"] = logout
        self["getLoginStatus"] = getLoginStatus
//        self["getLoginUid"] = getLoginUid
        self["getUsersInfo"] = getUsersInfo
        self["setSelfInfo"] = setSelfInfo
        self["forceSyncLoginUerInfo"] = forceSyncLoginUerInfo
//        self["forceReConn"] = forceReConn
        self["setSdkLog"] = setSdkLog
    }
    
    func initSDK(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInitSDK(methodCall.toJsonString(), SDKListener(channel: self.channel))
        callBack(result)
    }
    
    func login(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogin(methodCall[string: "uid"], methodCall[string: "token"], BaseCallback(result: result))
    }
    
    func logout(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogout(BaseCallback(result: result))
    }
    
    func getLoginStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        callBack(result, Open_im_sdkGetLoginStatus())
    }
    
//     func getLoginUid(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         callBack(result, Open_im_sdkGetLoginUser())
//     }
    
    func getUsersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetUsersInfo(methodCall[jsonString: "uidList"], BaseCallback(result: result))
    }
    
    func setSelfInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetSelfInfo(methodCall.toJsonString(), BaseCallback(result: result))
    }
    
    func forceSyncLoginUerInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkForceSyncLoginUerInfo()
        callBack(result)
    }

    func setSdkLog(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
         Open_im_sdkSetSdkLog(methodCall[int32: "sdkLog"])
    }
//     func forceReConn(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         Open_im_sdkForceReConn()
//         callBack(result)
//     }
}

public class SDKListener: NSObject, Open_im_sdkIMSDKListenerProtocol {
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onConnectFailed(_ errCode: Int, errMsg: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnectFailed", errCode: errCode, errMsg: errMsg, data: nil)
    }
    
    public func onConnectSuccess() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnectSuccess", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onConnecting() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnecting", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onKickedOffline() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onKickedOffline", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onSelfInfoUpdated(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onSelfInfoUpdated", errCode: nil, errMsg: nil, data: userInfo)
    }
    
    public func onUserTokenExpired() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onUserTokenExpired", errCode: nil, errMsg: nil, data: nil)
    }
}
