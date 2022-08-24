import Foundation
import OpenIMCore

public class IMMananger: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["initSDK"] = initSDK
        self["login"] = login
        self["logout"] = logout
        self["getLoginStatus"] = getLoginStatus
        self["wakeUp"] = wakeUp
        self["uploadImage"] = uploadImage
        self["updateFcmToken"] = updateFcmToken
    }
    
    func initSDK(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result,Open_im_sdkInitSDK(ConnListener(channel: self.channel), methodCall[string: "operationID"], methodCall.toJsonString()))
    }
    
    func login(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogin(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "uid"], methodCall[string: "token"])
    }
    
    func logout(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogout(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getLoginStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        callBack(result, Open_im_sdkGetLoginStatus())
    }
    
    func wakeUp(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkWakeUp(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func uploadImage(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkUploadImage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "path"], methodCall[string: "token"], methodCall[string: "obj"])
    }
    
    func updateFcmToken(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkUpdateFcmToken(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "fcmToken"])
    }
}

public class ConnListener: NSObject, Open_im_sdk_callbackOnConnListenerProtocol {
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onConnectFailed(_ errCode: Int32, errMsg: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "connectListener", type: "onConnectFailed", errCode: errCode, errMsg: errMsg, data: nil)
    }

    public func onConnectSuccess() {
        CommonUtil.emitEvent(channel: self.channel, method: "connectListener", type: "onConnectSuccess", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onConnecting() {
        CommonUtil.emitEvent(channel: self.channel, method: "connectListener", type: "onConnecting", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onKickedOffline() {
        CommonUtil.emitEvent(channel: self.channel, method: "connectListener", type: "onKickedOffline", errCode: nil, errMsg: nil, data: nil)
    }
    
    public func onUserTokenExpired() {
        CommonUtil.emitEvent(channel: self.channel, method: "connectListener", type: "onUserTokenExpired", errCode: nil, errMsg: nil, data: nil)
    }
}
