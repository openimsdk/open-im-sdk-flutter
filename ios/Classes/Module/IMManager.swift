//
//  IMManager.swift
//  Runner
//
//  Created by z1u24 on 2021/6/28.
//

import Foundation
import OpenIMCore

public class IMMananger:NSObject{
    
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    func initSDK(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkInitSDK(CommonUtil.getSDKJsonParam(methodCall: methodCall), SDKListener(channel: self.channel))
    }
    
    func login(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogin(CommonUtil.getUid(methodCall: methodCall), CommonUtil.getToken(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func logout(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogout(BaseImpl(result: result))
    }
    
    func getLoginStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.main.async { result(Open_im_sdkGetLoginStatus()) }
    }
    
    func getLoginUid(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.main.async { result(Open_im_sdkGetLoginUser()) }
    }
    
    func getUsersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetUsersInfo(CommonUtil.getUidList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func setSelfInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetSelfInfo(CommonUtil.getSDKJsonParam(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func forceSyncLoginUerInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkForceSyncLoginUerInfo()
    }

    func forceReConn(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkForceReConn()
    }
}

public class SDKListener:NSObject,Open_im_sdkIMSDKListenerProtocol {
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onConnectFailed(_ errCode: Int, errMsg: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnectFailed", errCode: errCode, errMsg: errMsg, data: nil)
    }
    
    public func onConnectSuccess() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnectSuccess", errCode: nil, errMsg: nil, data: nil);
    }
    
    public func onConnecting() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onConnecting", errCode: nil, errMsg: nil, data: nil);
    }
    
    public func onKickedOffline() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onKickedOffline", errCode: nil, errMsg: nil, data: nil);
    }
    
    public func onSelfInfoUpdated(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onSelfInfoUpdated", errCode: nil, errMsg: nil, data: userInfo);
    }
    
    public func onUserTokenExpired() {
        CommonUtil.emitEvent(channel: self.channel, method: "initSDKListener", type: "onUserTokenExpired", errCode: nil, errMsg: nil, data: nil);
    }
}

public class BaseImpl:NSObject,Open_im_sdkBaseProtocol {
    
    private let result:FlutterResult
    
    init(result:@escaping FlutterResult) {
        self.result = result
    }
    
    public func onError(_ errCode: Int, errMsg: String?) {
        print("BaseImpl: " + errMsg!)
        DispatchQueue.main.async { self.result(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
    }
    
    public func onSuccess(_ data: String?) {
        DispatchQueue.main.async { self.result(data) }
    }
    
}
