import Foundation
import OpenIMCore

public class FriendshipManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["acceptFriendApplication"] = acceptFriendApplication
        self["addBlacklist"] = addBlacklist
        self["addFriend"] = addFriend
        self["checkFriend"] = checkFriend
        self["deleteFriend"] = deleteFriend
        self["getBlacklist"] = getBlacklist
        self["getFriendApplicationListAsApplicant"] = getFriendApplicationListAsApplicant
        self["getFriendApplicationListAsRecipient"] = getFriendApplicationListAsRecipient
        self["getFriendList"] = getFriendList
        self["getFriendListPage"] = getFriendListPage
        self["getFriendsInfo"] = getFriendsInfo
        self["refuseFriendApplication"] = refuseFriendApplication
        self["removeBlacklist"] = removeBlacklist
        self["searchFriends"] = searchFriends
        self["setFriendListener"] = setFriendListener
        self["updateFriends"] = updateFriends
    }
    
    func acceptFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptFriendApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }

    func addBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddBlack(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"], methodCall[string: "ex"])
    }
    
    func addFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAddFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func checkFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCheckFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDList"])
    }
    
    func deleteFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDeleteFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func getBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetBlackList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getFriendApplicationListAsApplicant(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationListAsApplicant(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getFriendApplicationListAsRecipient(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendApplicationListAsRecipient(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getFriendList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[bool: "filterBlack"])
    }
    
    func getFriendListPage(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetFriendListPage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int32: "offset"], methodCall[int32: "count"], methodCall[bool: "filterBlack"])
    }

    func getFriendsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSpecifiedFriendsInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "userIDList"], methodCall[bool: "filterBlack"])
    }
    
    func refuseFriendApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseFriendApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func removeBlacklist(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRemoveBlack(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func searchFriends(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchFriends(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }
    
    func setFriendListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetFriendListener(FriendshipListener(channel: channel))
        callBack(result)
    }
    
    func updateFriends(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkUpdateFriends(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "req"])
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
