//
//  GroupManager.swift
//  flutter_openim_sdk
//
//  Created by z1u24 on 2021/7/5.
//

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
        self["getGroupApplicationList"] = getGroupApplicationList
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
        Open_im_sdkInviteUserToGroup(methodCall[string: "gid"], methodCall[string: "reason"],
                                     methodCall[jsonString: "uidList"], BaseCallback(result: result))
    }
    
    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkKickGroupMember(methodCall[string: "gid"], methodCall[string: "reason"],
                                   methodCall[jsonString: "uidList"], BaseCallback(result: result))
    }
    
    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMembersInfo(methodCall[string: "gid"], methodCall[jsonString: "uidList"], BaseCallback(result: result))
    }
    
    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberList(methodCall[string: "gid"], methodCall[int32: "filter"],
                                      methodCall[int32: "next"], BaseCallback(result: result))
    }
    
    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetJoinedGroupList(BaseCallback(result: result))
    }
    
    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCreateGroup(methodCall[jsonString: "gInfo"], methodCall[jsonString: "memberList"], BaseCallback(result: result))
    }
    
    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupInfo(methodCall[jsonString: "gInfo"], BaseCallback(result: result))
    }
    
    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupsInfo(methodCall[jsonString: "gidList"], BaseCallback(result: result))
    }
    
    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkJoinGroup(methodCall[string: "gid"], methodCall[string: "reason"], BaseCallback(result: result))
    }
    
    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkQuitGroup(methodCall[string: "gid"], BaseCallback(result: result))
    }
    
    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTransferGroupOwner(methodCall[string: "gid"], methodCall[string: "uid"], BaseCallback(result: result))
    }
    
    func getGroupApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupApplicationList(BaseCallback(result: result))
    }
    
    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptGroupApplication(methodCall[jsonString: "application"], methodCall[string: "reason"], BaseCallback(result: result))
    }
    
    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseGroupApplication(methodCall[jsonString: "application"], methodCall[string: "reason"], BaseCallback(result: result))
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
public class GroupListener: NSObject, Open_im_sdkOnGroupListenerProtocol {
    
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onApplicationProcessed(_ groupId: String?, opUser: String?, agreeOrReject AgreeOrReject: Int32, opReason: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = groupId
        values["opUser"] = opUser
        values["agreeOrReject"] = AgreeOrReject
        values["opReason"] = opReason
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onApplicationProcessed", errCode: nil, errMsg: nil, data: values)
    }
    
//    public func onApplicationProcessed(_ s: String?,s1: String?,i: Int?,s2: String?) {
//        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
//        values.setValue(s, forKey: "groupId")
//        values.setValue(s1, forKey: "opUser")
//        values.setValue(i, forKey: "agreeOrReject")
//        values.setValue(s2, forKey: "opReason")
//        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onApplicationProcessed", errCode: nil, errMsg: nil, data: values)
//    }
    
    public func onGroupCreated(_ s: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupCreated", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onGroupInfoChanged(_ s: String?, groupInfo s1: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["groupInfo"] = s1
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupInfoChanged", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberEnter(_ s: String?, memberList s1: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["memberList"] = s1
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberEnter", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberInvited(_ s: String?,opUser s1: String?, memberList s2: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["opUser"] = s1
        values["memberList"] = s2
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberInvited", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberKicked(_ s: String?,opUser s1: String?,memberList s2: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["opUser"] = s1
        values["memberList"] = s2
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberKicked", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberLeave(_ s: String?,member s1: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["member"] = s1
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberLeave", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onReceiveJoinApplication(_ s: String?,member s1: String?,opReason s2: String?) {
        var values: [String: Any] = [:]
        values["groupId"] = s
        values["member"] = s1
        values["opReason"] = s2
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onReceiveJoinApplication", errCode: nil, errMsg: nil, data: values)
    }
    
}
