import Foundation
import OpenIMCore

public class UserManager: BaseServiceManager {

  public override func registerHandlers() {
        super.registerHandlers()
        self["setUserListener"] = setUserListener
        self["getUsersInfo"] = getUsersInfo
        self["setSelfInfo"] = setSelfInfo
        self["getSelfUserInfo"] = getSelfUserInfo
    }

    func setUserListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetUserListener(UserListener(channel: channel))
        callBack(result)
    }

    func getUsersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetUsersInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDList"])
    }
    
    func setSelfInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetSelfInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func getSelfUserInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetSelfUserInfo(BaseCallback(result: result), methodCall[string: "operationID"])
    }
}

public class UserListener: NSObject, Open_im_sdk_callbackOnUserListenerProtocol {
    
    private let channel:FlutterMethodChannel

    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onSelfInfoUpdated(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "userListener", type: "onSelfInfoUpdated", errCode: nil, errMsg: nil, data: userInfo)
    }
    
    public func onUserStatusChanged(_ userInfo: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "userListener", type: "onUserStatusChanged", errCode: nil, errMsg: nil, data: userInfo)
    }

}
