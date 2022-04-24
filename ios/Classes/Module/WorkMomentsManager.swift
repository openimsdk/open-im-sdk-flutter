import Foundation
import OpenIMCore

public class WorkMomentsManager: BaseServiceManager {

  public override func registerHandlers() {
        super.registerHandlers()
        self["setWorkMomentsListener"] = setWorkMomentsListener
        self["getWorkMomentsUnReadCount"] = getWorkMomentsUnReadCount
        self["getWorkMomentsNotification"] = getWorkMomentsNotification
        self["clearWorkMomentsNotification"] = clearWorkMomentsNotification
    }

    func setWorkMomentsListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetWorkMomentsListener(WorkMomentsListener(channel: channel))
        callBack(result)
    }

    func getWorkMomentsUnReadCount(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetWorkMomentsUnReadCount(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getWorkMomentsNotification(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetWorkMomentsNotification(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int: "offset"], methodCall[int: "count"])
    }
    
    func clearWorkMomentsNotification(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkClearWorkMomentsNotification(BaseCallback(result: result), methodCall[string: "operationID"])
    }
}

public class WorkMomentsListener: NSObject, Open_im_sdk_callbackOnWorkMomentsListenerProtocol {
    
    private let channel:FlutterMethodChannel

    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onRecvNewNotification() {
        CommonUtil.emitEvent(channel: self.channel, method: "workMomentsListener", type: "OnRecvNewNotification", errCode: nil, errMsg: nil, data: nil)
    }
    
}
