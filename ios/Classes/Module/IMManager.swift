import Foundation
import OpenIMCore

public class IMMananger: BaseServiceManager {
    
    let reachability = try? Reachability()
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["initSDK"] = initSDK
        self["unInitSDK"] = unInitSDK
        self["login"] = login
        self["logout"] = logout
        self["getLoginStatus"] = getLoginStatus
        self["uploadFile"] = uploadFile
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
        callBack(result, Open_im_sdkInitSDK(ConnListener(channel: self.channel), methodCall[string: "operationID"], methodCall.toJsonString()))
        addObservers()
    }

    func unInitSDK(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        callBack(result, Open_im_sdkUnInitSDK(methodCall[string: "operationID"]))
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
    
    func uploadFile(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkUploadFile(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString(), UploadFileListener(channel: self.channel,id: methodCall[string: "id"]))
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

public class UploadFileListener: NSObject, Open_im_sdk_callbackUploadFileCallbackProtocol {
    
    private let channel:FlutterMethodChannel
    private let id: String
    
    init(channel:FlutterMethodChannel, id: String) {
        self.channel = channel
        self.id = id
    }
    public func complete(_ size: Int64, url: String?, typ: Int) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["size"] = size
        values["url"] = url
        values["type"] = typ
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "complete", errCode: nil, errMsg: nil, data: values)
    }
    
    public func hashPartComplete(_ partsHash: String?, fileHash: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["partHash"] = partsHash
        values["fileHash"] = fileHash
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "hashPartComplete", errCode: nil, errMsg: nil, data: values)
    }
    
    public func hashPartProgress(_ index: Int, size: Int64, partHash: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["index"] = index
        values["size"] = size
        values["partHash"] = partHash
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "hashPartProgress", errCode: nil, errMsg: nil, data: values)
    }
    
    public func open(_ size: Int64) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["size"] = size
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "open", errCode: nil, errMsg: nil, data: values)
    }
    
    public func partSize(_ partSize: Int64, num: Int) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["partSize"] = partSize
        values["num"] = num
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "partSize", errCode: nil, errMsg: nil, data: values)
    }
    
    public func uploadComplete(_ fileSize: Int64, streamSize: Int64, storageSize: Int64) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["fileSize"] = fileSize
        values["streamSize"] = streamSize
        values["storageSize"] = storageSize
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "uploadProgress", errCode: nil, errMsg: nil, data: values)
    }
    
    public func uploadID(_ uploadID: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["uploadID"] = uploadID
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "uploadID", errCode: nil, errMsg: nil, data: values)
    }
    
    public func uploadPartComplete(_ index: Int, partSize: Int64, partHash: String?) {
        var values: [String: Any] = [:]
        values["id"] = id
        values["index"] = index
        values["partSize"] = partSize
        values["partHash"] = partHash
        CommonUtil.emitEvent(channel: channel, method: "uploadFileListener", type: "uploadPartComplete", errCode: nil, errMsg: nil, data: values)
    }
}
