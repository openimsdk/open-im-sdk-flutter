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

    func inviteUserToGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkInviteUserToGroup(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupReason(methodCall: methodCall), CommonUtil.getGroupUserList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func kickGroupMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkKickGroupMember(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupUserList(methodCall: methodCall), CommonUtil.getGroupReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupMembersInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMembersInfo(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupUserList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupMemberList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupMemberList(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupFilter(methodCall: methodCall), CommonUtil.getGroupNext(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getJoinedGroupList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetJoinedGroupList(BaseImpl(result: result))
    }
    
    func createGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkCreateGroup(CommonUtil.getGroupInfo(methodCall: methodCall), CommonUtil.getGroupMemberList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func setGroupInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetGroupInfo(CommonUtil.getGroupJsonInfo(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupsInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupsInfo(CommonUtil.getGroupIdList(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func joinGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkJoinGroup(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupMessage(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func quitGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkQuitGroup(CommonUtil.getGroupId(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func transferGroupOwner(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkTransferGroupOwner(CommonUtil.getGroupId(methodCall: methodCall), CommonUtil.getGroupUserId(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func getGroupApplicationList(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkGetGroupApplicationList(BaseImpl(result: result))
    }
    
    func acceptGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkAcceptGroupApplication(CommonUtil.getGroupApplication(methodCall: methodCall), CommonUtil.getGroupReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
    func refuseGroupApplication(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkRefuseGroupApplication(CommonUtil.getGroupApplication(methodCall: methodCall), CommonUtil.getGroupReason(methodCall: methodCall), BaseImpl(result: result))
    }
    
}
