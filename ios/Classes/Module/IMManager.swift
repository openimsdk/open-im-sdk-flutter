import Foundation
import OpenIMCore

public class IMMananger: BaseServiceManager {
    
    let reachability = try? Reachability()
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["initSDK"] = initSDK
        self["login"] = login
        self["logout"] = logout
        self["getLoginStatus"] = getLoginStatus
        self["putFile"] = putFile
        self["updateFcmToken"] = updateFcmToken
        self["setAppBackgroundStatus"] = setAppBackgroundStatus
        self["networkStatusChanged"] = networkStatusChanged
    }
    
    fileprivate func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
                
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationDidEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
        
        if let reachability {
            do {
                try reachability.startNotifier()
            } catch (let e) {
                print("reachability: \(e)")
            }
            
            reachability.whenReachable = { _ in
                Open_im_sdkNetworkStatusChanged(BaseCallback(result: { _ in
                }), UUID().uuidString)
            }
            reachability.whenUnreachable = { _ in
                Open_im_sdkNetworkStatusChanged(BaseCallback(result: { _ in
                }), UUID().uuidString)
            }
        }
    }
    
    @objc
    fileprivate func applicationDidEnterBackground() {
        Open_im_sdkSetAppBackgroundStatus(BaseCallback(result: { _ in
        }), UUID().uuidString, true)
    }

    @objc
    fileprivate func applicationWillEnterForeground() {
        Open_im_sdkSetAppBackgroundStatus(BaseCallback(result: { _ in
        }), UUID().uuidString, false)
    }
    
    func initSDK(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result,Open_im_sdkInitSDK(ConnListener(channel: self.channel), methodCall[string: "operationID"], methodCall.toJsonString()))
        addObservers()
    }
    
    func login(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogin(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"], methodCall[string: "token"])
    }
    
    func logout(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkLogout(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getLoginStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        callBack(result, Open_im_sdkGetLoginStatus(methodCall[string: "operationID"]))
    }
    
    func putFile(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkPutFile(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString(),PutFileListener(channel: self.channel,putID: methodCall[string: "putID"]))
    }
    
    func updateFcmToken(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkUpdateFcmToken(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "fcmToken"])
    }
    
    func setAppBackgroundStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetAppBackgroundStatus(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[bool: "isBackground"])
    }
    
    func networkStatusChanged(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkNetworkStatusChanged(BaseCallback(result: result), methodCall[string: "operationID"])
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

public class PutFileListener: NSObject, Open_im_sdk_callbackPutFileCallbackProtocol {
    private let channel:FlutterMethodChannel
    private let putID: String
    
    init(channel:FlutterMethodChannel, putID: String) {
        self.channel = channel
        self.putID = putID
    }
    
    public func hashComplete(_ hash: String?, total: Int64) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["hash"] = hash
        values["total"] = total
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "hashComplete", errCode: nil, errMsg: nil, data: values)
    }
    
    public func hashProgress(_ current: Int64, total: Int64) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["current"] = current
        values["total"] = total
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "hashProgress", errCode: nil, errMsg: nil, data: values)
    }
    
    public func open(_ size: Int64) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["size"] = size
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "open", errCode: nil, errMsg: nil, data: values)
    }
    
    public func putComplete(_ total: Int64, putType: Int) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["putType"] = putType
        values["total"] = total
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "putComplete", errCode: nil, errMsg: nil, data: values)
    }
    
    public func putProgress(_ save: Int64, current: Int64, total: Int64) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["save"] = save
        values["current"] = current
        values["total"] = total
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "putProgress", errCode: nil, errMsg: nil, data: values)
    }
    
    public func putStart(_ current: Int64, total: Int64) {
        var values: [String: Any] = [:]
        values["putID"] = putID
        values["current"] = current
        values["total"] = total
        CommonUtil.emitEvent(channel: channel, method: "putFileListener", type: "putStart", errCode: nil, errMsg: nil, data: values)
    }
}
