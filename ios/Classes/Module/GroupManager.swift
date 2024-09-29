import Foundation
import OpenIMCore

public class GroupManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["acceptGroupApplication"] = acceptGroupApplication
        self["changeGroupMemberMute"] = changeGroupMemberMute
        self["changeGroupMute"] = changeGroupMute
        self["createGroup"] = createGroup
        self["dismissGroup"] = dismissGroup
        self["getGroupApplicationListAsApplicant"] = getGroupApplicationListAsApplicant
        self["getGroupApplicationListAsRecipient"] = getGroupApplicationListAsRecipient
        self["getGroupMemberList"] = getGroupMemberList
        self["getGroupMemberListByJoinTimeFilter"] = getGroupMemberListByJoinTimeFilter
        self["getGroupMemberOwnerAndAdmin"] = getGroupMemberOwnerAndAdmin
        self["getGroupMembersInfo"] = getGroupMembersInfo
        self["getGroupsInfo"] = getGroupsInfo
        self["getJoinedGroupList"] = getJoinedGroupList
        self["getJoinedGroupListPage"] = getJoinedGroupListPage
        self["getUsersInGroup"] = getUsersInGroup
        self["inviteUserToGroup"] = inviteUserToGroup
        self["isJoinGroup"] = isJoinGroup
        self["joinGroup"] = joinGroup
        self["kickGroupMember"] = kickGroupMember
        self["quitGroup"] = quitGroup
        self["refuseGroupApplication"] = refuseGroupApplication
        self["searchGroupMembers"] = searchGroupMembers
        self["searchGroups"] = searchGroups
        self["setGroupInfo"] = setGroupInfo
        self["setGroupListener"] = setGroupListener
        self["setGroupMemberInfo"] = setGroupMemberInfo
        self["transferGroupOwner"] = transferGroupOwner
    }

    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkAcceptGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"], methodCall[string: "handleMsg"])
    }

    func changeGroupMemberMute(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkChangeGroupMemberMute(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string:"userID"], methodCall[int:"seconds"])
    }

    func changeGroupMute(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkChangeGroupMute(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[bool: "mute"])
    }

    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkCreateGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall.toJsonString())
    }

    func dismissGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkDismissGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }

    func getGroupApplicationListAsApplicant(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetGroupApplicationListAsApplicant(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getGroupApplicationListAsRecipient(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetGroupApplicationListAsRecipient(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetGroupMemberList(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32: "filter"],
                                      methodCall[int32: "offset"], methodCall[int32: "count"])
    }

    func getGroupMemberListByJoinTimeFilter(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetGroupMemberListByJoinTimeFilter(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[int32: "offset"], methodCall[int32: "count"], methodCall[int64: "joinTimeBegin"], methodCall[int64: "joinTimeEnd"], methodCall[jsonString: "excludeUserIDList"])
    }

    func getGroupMemberOwnerAndAdmin(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetGroupMemberOwnerAndAdmin(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }

    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetSpecifiedGroupMembersInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[jsonString: "userIDList"])
    }

    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetSpecifiedGroupsInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "groupIDList"])
    }

    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetJoinedGroupList(BaseCallback(result: result), methodCall[string: "operationID"])
    }

    func getJoinedGroupListPage(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetJoinedGroupListPage(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[int32: "offset"], methodCall[int32: "count"])
    }

    func getUsersInGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
         Open_im_sdkGetUsersInGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"],
         methodCall[jsonString: "userIDs"])
    }

    func inviteUserToGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkInviteUserToGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "reason"],
                                     methodCall[jsonString: "userIDList"])
    }

    func isJoinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkIsJoinGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }

    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkJoinGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string:
        "reason"], methodCall[int32: "joinSource"], methodCall[jsonString: "ex"])
    }

    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkKickGroupMember(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "reason"],
                                   methodCall[jsonString: "userIDList"])
    }

    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkQuitGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }

    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkRefuseGroupApplication(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"], methodCall[string: "handleMsg"])
    }

    func searchGroupMembers(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSearchGroupMembers(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }

    func searchGroups(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSearchGroups(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "searchParam"])
    }

    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetGroupInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "groupInfo"])
    }

    func setGroupListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetGroupListener(GroupListener(channel: channel))
        callBack(result)
    }

    func setGroupMemberInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkSetGroupMemberInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "info"])
    }

    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkTransferGroupOwner(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"], methodCall[string: "userID"])
    }
}

public class GroupListener: NSObject, Open_im_sdk_callbackOnGroupListenerProtocol {
  
    private let channel: FlutterMethodChannel
    
    init(channel: FlutterMethodChannel) {
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
