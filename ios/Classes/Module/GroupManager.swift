//
//  GroupManager.swift
//  flutter_openim_sdk
//
//  Created by z1u24 on 2021/7/5.
//

import Foundation
import OpenIMCore

public class GroupManager:NSObject{
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }

    func setGroupListener(methodCall: FlutterMethodCall, result: FlutterResult){
        Open_im_sdkSetGroupListener(GroupListener(channel: channel))
    }

    func inviteUserToGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInviteUserToGroup(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getGroupOpReason(methodCall: methodCall), CommonUtil.getUidList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkKickGroupMember(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getGroupOpReason(methodCall: methodCall), CommonUtil.getUidList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMembersInfo(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getUidList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberList(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getGroupListFilter(methodCall: methodCall), CommonUtil.getGroupListNext(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetJoinedGroupList(BaseImpl(result: result))
    }
    
    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCreateGroup(CommonUtil.getGroupInfo(methodCall: methodCall), CommonUtil.getGroupMemberRoleList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupInfo(CommonUtil.getGroupInfo(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupsInfo(CommonUtil.getGidList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkJoinGroup(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getGroupOpReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkQuitGroup(CommonUtil.getGid(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTransferGroupOwner(CommonUtil.getGid(methodCall: methodCall), CommonUtil.getUid(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupApplicationList(BaseImpl(result: result))
    }
    
    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptGroupApplication(CommonUtil.getGroupApplicationInfo(methodCall: methodCall), CommonUtil.getGroupOpReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseGroupApplication(CommonUtil.getGroupApplicationInfo(methodCall: methodCall), CommonUtil.getGroupOpReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
//    func forceSyncApplyGroupRequest(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//        Open_im_sdkForceSyncApplyGroupRequest()
//    }
//
//    func forceSyncGroupRequest(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//        Open_im_sdkForceSyncGroupRequest()
//    }
//
//    func forceSyncJoinedGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//        Open_im_sdkForceSyncJoinedGroup()
//    }
//
//    func forceSyncJoinedGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
//        Open_im_sdkForceSyncJoinedGroupMember()
//    }

}
public class GroupListener:NSObject,Open_im_sdkOnGroupListenerProtocol {
    
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onApplicationProcessed(_ groupId: String?, opUser: String?, agreeOrReject AgreeOrReject: Int32, opReason: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(groupId, forKey: "groupId")
        values.setValue(opUser, forKey: "opUser")
        values.setValue(AgreeOrReject, forKey: "agreeOrReject")
        values.setValue(opReason, forKey: "opReason")
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
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupCreated", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onGroupInfoChanged(_ s: String?,groupInfo s1: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "groupInfo")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onGroupInfoChanged", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberEnter(_ s: String?,memberList s1: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "memberList")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberEnter", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberInvited(_ s: String?,opUser s1: String?,memberList s2: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "opUser")
        values.setValue(s2, forKey: "memberList")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberInvited", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberKicked(_ s: String?,opUser s1: String?,memberList s2: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "opUser")
        values.setValue(s2, forKey: "memberList")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberKicked", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onMemberLeave(_ s: String?,member s1: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "member")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onMemberLeave", errCode: nil, errMsg: nil, data: values)
    }
    
    public func onReceiveJoinApplication(_ s: String?,member s1: String?,opReason s2: String?) {
        let values: NSMutableDictionary = NSMutableDictionary(capacity: 0)
        values.setValue(s, forKey: "groupId")
        values.setValue(s1, forKey: "member")
        values.setValue(s2, forKey: "opReason")
        CommonUtil.emitEvent(channel: channel, method: "groupListener", type: "onReceiveJoinApplication", errCode: nil, errMsg: nil, data: values)
    }
    
}
