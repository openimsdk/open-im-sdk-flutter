import Foundation
import OpenIMCore

public class UserManager: BaseServiceManager {

  public override func registerHandlers() {
        super.registerHandlers()
        self["setUserListener"] = setUserListener
        self["getUsersInfo"] = getUsersInfo
        self["setSelfInfo"] = setSelfInfo
        self["getSelfUserInfo"] = getSelfUserInfo
        self["subscribeUsersStatus"] = subscribeUsersStatus
        self["unsubscribeUsersStatus"] = unsubscribeUsersStatus
        self["getSubscribeUsersStatus"] = getSubscribeUsersStatus
        self["getUserStatus"] = getUserStatus
        self["getUsersInfoStranger"] = getUsersInfoStranger
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

    func subscribeUsersStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSubscribeUsersStatus(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDs"])
    }

    func unsubscribeUsersStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkUnsubscribeUsersStatus(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDs"])
    }

    func getSubscribeUsersStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSubscribeUsersStatus(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getUserStatus(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetUserStatus(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDs"])
    }
    
    func getUsersInfoStranger(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetUsersInfoStranger(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDs"], methodCall[string: "groupID"])
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
    
    public func onUserStatusChanged(_ statusInfo: String?) {
        CommonUtil.emitEvent(channel: self.channel, method: "userListener", type: "onUserStatusChanged", errCode: nil, errMsg: nil, data: statusInfo)
    }

}
