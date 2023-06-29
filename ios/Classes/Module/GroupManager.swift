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
        self["getGroupApplicationListAsRecipient"] = getGroupApplicationListAsRecipient
        self["getGroupApplicationListAsApplicant"] = getGroupApplicationListAsApplicant
        self["acceptGroupApplication"] = acceptGroupApplication
        self["refuseGroupApplication"] = refuseGroupApplication
        self["dismissGroup"] = dismissGroup
        self["changeGroupMute"] = changeGroupMute
        self["changeGroupMemberMute"] = changeGroupMemberMute
        self["setGroupMemberNickname"] = setGroupMemberNickname
        self["searchGroups"] = searchGroups
        self["setGroupMemberRoleLevel"] = setGroupMemberRoleLevel
        self["getGroupMemberListByJoinTimeFilter"] = getGroupMemberListByJoinTimeFilter
        self["setGroupVerification"] = setGroupVerification
        self["setGroupLookMemberInfo"] = setGroupLookMemberInfo
        self["setGroupApplyMemberFriend"] = setGroupApplyMemberFriend
        self["getGroupMemberOwnerAndAdmin"] = getGroupMemberOwnerAndAdmin
        self["searchGroupMembers"] = searchGroupMembers
        self["setGroupMemberInfo"] = setGroupMemberInfo
        self["isJoinGroup"] = isJoinGroup
    }

    func setGroupListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupListener(GroupListener(channel: channel))
        callBack(result)
    }

    func inviteUserToGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInviteUserToGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "reason"],
                                     methodCall[jsonString: "userIDList"])
    }
    
    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkKickGroupMember(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "reason"],
                                   methodCall[jsonString: "userIDList"])
    }
    
    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSpecifiedGroupMembersInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[jsonString: "userIDList"])
    }
    
    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32: "filter"],
                                      methodCall[int32: "offset"], methodCall[int32: "count"])
    }
    
    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetJoinedGroupList(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCreateGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }
    
    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "groupInfo"])
    }
    
    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetSpecifiedGroupsInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "groupIDList"])
    }
    
    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkJoinGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "reason"], methodCall[int32: "joinSource"])
    }
    
    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkQuitGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTransferGroupOwner(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"])
    }
    
    func getGroupApplicationListAsRecipient(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupApplicationListAsRecipient(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func getGroupApplicationListAsApplicant(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupApplicationListAsApplicant(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"], methodCall[string: "handleMsg"])
    }
    
    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"], methodCall[string: "handleMsg"])
    }
    
    func dismissGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkDismissGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func changeGroupMute(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkChangeGroupMute(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[bool: "mute"])
    }
    
    func changeGroupMemberMute(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkChangeGroupMemberMute(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string:"userID"],methodCall[int:"seconds"])
    }
    
    func setGroupMemberNickname(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupMemberNickname(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string:"userID"],methodCall[string:"groupNickname"])
    }
    
    func searchGroups(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchGroups(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }
    
    func setGroupMemberRoleLevel(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupMemberRoleLevel(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string:"userID"],methodCall[int:"roleLevel"])
    }
    
    func getGroupMemberListByJoinTimeFilter(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberListByJoinTimeFilter(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32: "offset"], methodCall[int32: "count"], methodCall[int64: "joinTimeBegin"], methodCall[int64: "joinTimeEnd"], methodCall[jsonString: "excludeUserIDList"])
    }
    
    func setGroupVerification(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupVerification(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32:"needVerification"])
    }
    
    func setGroupLookMemberInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupLookMemberInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32:"status"])
    }
    
    func setGroupApplyMemberFriend(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupApplyMemberFriend(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32:"status"])
    }
    
    func getGroupMemberOwnerAndAdmin(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberOwnerAndAdmin(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func searchGroupMembers(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSearchGroupMembers(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }
    
    func setGroupMemberInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupMemberInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "info"])
    }
    
    func isJoinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkIsJoinGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
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
    
    public func onGroupDismissed(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupDismissed", errCode: nil, errMsg: nil, data: s)
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
