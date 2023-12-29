import Foundation
import OpenIMCore

public class FriendshipManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setFriendListener"] = setFriendListener
        self["getFriendsInfo"] = getFriendsInfo
        self["addFriend"] = addFriend
        self["getFriendApplicationListAsRecipient"] = getFriendApplicationListAsRecipient
        self["getFriendApplicationListAsApplicant"] = getFriendApplicationListAsApplicant
        self["getFriendList"] = getFriendList
        self["setFriendRemark"] = setFriendRemark
        self["addBlacklist"] = addBlacklist
        self["getBlacklist"] = getBlacklist
        self["removeBlacklist"] = removeBlacklist
        self["checkFriend"] = checkFriend
        self["deleteFriend"] = deleteFriend
        self["acceptFriendApplication"] = acceptFriendApplication
        self["refuseFriendApplication"] = refuseFriendApplication
        self["searchFriends"] = searchFriends
        self["setFriendsEx"] = setFriendsEx
    }
    
    func setFriendListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendListener(FriendshipListener(channel: channel))
        callBack(result)
    }
    
    func getFriendsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSpecifiedFriendsInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDList"])
    }
    
    func addFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func getFriendApplicationListAsRecipient(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationListAsRecipient(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getFriendApplicationListAsApplicant(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationListAsApplicant(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func setFriendRemark(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendRemark(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func addBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddBlack(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"], methodCall[string: "ex"])
    }
    
    func getBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetBlackList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func removeBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRemoveBlack(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func checkFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCheckFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDList"])
    }
    
    func deleteFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func acceptFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptFriendApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func refuseFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseFriendApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func searchFriends(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchFriends(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }

    func setFriendsEx(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendsEx(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "friendIDs"], methodCall[string: "ex"])
    }
}

public class FriendshipListener: NSObject, Open_im_sdk_callbackOnFriendshipListenerProtocol {
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onBlackAdded(_ blackInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onBlackAdded", errCode: nil, errMsg: nil, data: blackInfo)
    }
    
    public func onBlackDeleted(_ blackInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onBlackDeleted", errCode: nil, errMsg: nil, data: blackInfo)
    }
    
    public func onFriendAdded(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendAdded", errCode: nil, errMsg: nil, data: friendInfo)
    }
    
    public func onFriendApplicationAccepted(_ friendApplication: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationAccepted", errCode: nil, errMsg: nil, data: friendApplication)
    }
    
    public func onFriendApplicationAdded(_ friendApplication: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationAdded", errCode: nil, errMsg: nil, data: friendApplication)
    }
    
    public func onFriendApplicationDeleted(_ friendApplication: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationDeleted", errCode: nil, errMsg: nil, data: friendApplication)
    }
    
    public func onFriendApplicationRejected(_ friendApplication: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendApplicationRejected", errCode: nil, errMsg: nil, data: friendApplication)
    }
    
    public func onFriendDeleted(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendDeleted", errCode: nil, errMsg: nil, data: friendInfo)
    }
    
    public func onFriendInfoChanged(_ friendInfo: String?) {
        CommonUtil.emitEvent(channel: channel, method: "friendListener", type: "onFriendInfoChanged", errCode: nil, errMsg: nil, data: friendInfo)
    }
}

