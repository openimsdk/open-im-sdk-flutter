import Foundation
import OpenIMCore

public class GroupManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setGroupListener"] = setGroupListener
        self["inviteUserToGroup"] = inviteUserToGroup
        self["kickGroupMember"] = kickGroupMember
        self["getGroupMembersInfo"] = getGroupMembersInfo
        self["getGroupMemberList"] = getGroupMemberList
        self["getJoinedGroupList"] = getJoinedGroupList
        self["createGroup"] = createGroup
        self["setGroupInfo"] = setGroupInfo
        self["getGroupsInfo"] = getGroupsInfo
        self["joinGroup"] = joinGroup
        self["quitGroup"] = quitGroup
        self["transferGroupOwner"] = transferGroupOwner
        self["getRecvGroupApplicationList"] = getRecvGroupApplicationList
        self["getSendGroupApplicationList"] = getSendGroupApplicationList
        self["acceptGroupApplication"] = acceptGroupApplication
        self["refuseGroupApplication"] = refuseGroupApplication
//        self["forceSyncApplyGroupRequest"] = forceSyncApplyGroupRequest
//        self["forceSyncGroupRequest"] = forceSyncGroupRequest
//        self["forceSyncJoinedGroup"] = forceSyncJoinedGroup
//        self["forceSyncJoinedGroupMember"] = forceSyncJoinedGroupMember
    }

    func setGroupListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupListener(GroupListener(channel: channel))
        callBack(result)
    }

    func inviteUserToGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInviteUserToGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "reason"],
                                     methodCall[jsonString: "uidList"])
    }
    
    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkKickGroupMember(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "reason"],
                                   methodCall[jsonString: "uidList"])
    }
    
    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMembersInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[jsonString: "uidList"])
    }
    
    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[int32: "filter"],
                                      methodCall[int32: "offset"], methodCall[int32: "count"])
    }
    
    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetJoinedGroupList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCreateGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "gInfo"], methodCall[jsonString: "memberList"])
    }
    
    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[jsonString: "gInfo"])
    }
    
    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupsInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "gidList"])
    }
    
    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkJoinGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "reason"])
    }
    
    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkQuitGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"])
    }
    
    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTransferGroupOwner(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "uid"])
    }
    
    func getRecvGroupApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetRecvGroupApplicationList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getSendGroupApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSendGroupApplicationList(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "uid"], methodCall[string: "handleMsg"])
    }
    
    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "gid"], methodCall[string: "uid"], methodCall[string: "handleMsg"])
    }
    
//     func forceSyncApplyGroupRequest(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         Open_im_sdkForceSyncApplyGroupRequest()
//         callBack(result)
//     }
//
//     func forceSyncGroupRequest(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         Open_im_sdkForceSyncGroupRequest()
//         callBack(result)
//     }
//
//     func forceSyncJoinedGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         Open_im_sdkForceSyncJoinedGroup()
//         callBack(result)
//     }
//
//     func forceSyncJoinedGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//         Open_im_sdkForceSyncJoinedGroupMember()
//         callBack(result)
//     }

}
public class GroupListener: NSObject, Open_im_sdk_callbackOnGroupListenerProtocol {
    
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onGroupApplicationAccepted(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupApplicationAccepted", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupApplicationAdded(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupApplicationAdded", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupApplicationDeleted(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupApplicationDeleted", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupApplicationRejected(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupApplicationRejected", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupInfoChanged(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupInfoChanged", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupMemberAdded(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupMemberAdded", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupMemberDeleted(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupMemberDeleted", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onGroupMemberInfoChanged(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupMemberInfoChanged", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onJoinedGroupAdded(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onJoinedGroupAdded", errCode: nil, errMsg: nil, data: s)
    }

    public func onJoinedGroupDeleted(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onJoinedGroupDeleted", errCode: nil, errMsg: nil, data: s)
    }
}
