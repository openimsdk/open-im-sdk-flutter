package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.GroupListener;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class GroupManager {

    public void setGroupListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupListener(new GroupListener());
    }

    public void inviteUserToGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.inviteUserToGroup(
                CommonUtil.getGid(methodCall),
                CommonUtil.getGroupOpReason(methodCall),
                CommonUtil.getUidList(methodCall),
                new BaseListener(result));
    }

    public void kickGroupMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.kickGroupMember(
                CommonUtil.getGid(methodCall),
                CommonUtil.getGroupOpReason(methodCall),
                CommonUtil.getUidList(methodCall),
                new BaseListener(result));
    }

    public void getGroupMembersInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMembersInfo(
                CommonUtil.getGid(methodCall),
                CommonUtil.getUidList(methodCall),
                new BaseListener(result));
    }

    public void getGroupMemberList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberList(
                CommonUtil.getGid(methodCall),
                CommonUtil.getGroupListFilter(methodCall),
                CommonUtil.getGroupListNext(methodCall),
                new BaseListener(result));
    }


    public void getJoinedGroupList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getJoinedGroupList(new BaseListener(result));
    }

    public void createGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.createGroup(
                CommonUtil.getGroupInfo(methodCall),
                CommonUtil.getGroupMemberRoleList(methodCall),
                new BaseListener(result));
    }

    public void setGroupInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupInfo(
                CommonUtil.getGroupInfo(methodCall),
                new BaseListener(result));
    }

    public void getGroupsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupsInfo(
                CommonUtil.getGidList(methodCall),
                new BaseListener(result));
    }

    public void joinGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.joinGroup(
                CommonUtil.getGid(methodCall),
                CommonUtil.getGroupOpReason(methodCall),
                new BaseListener(result));
    }

    public void quitGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.quitGroup(
                CommonUtil.getGid(methodCall),
                new BaseListener(result));
    }

    public void transferGroupOwner(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.transferGroupOwner(
                CommonUtil.getGid(methodCall),
                CommonUtil.getUid(methodCall),
                new BaseListener(result));
    }

    public void getGroupApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupApplicationList(new BaseListener(result));
    }

    public void acceptGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptGroupApplication(
                CommonUtil.getGroupApplicationInfo(methodCall),
                CommonUtil.getGroupOpReason(methodCall),
                new BaseListener(result));

    }

    public void refuseGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseGroupApplication(
                CommonUtil.getGroupApplicationInfo(methodCall),
                CommonUtil.getGroupOpReason(methodCall),
                new BaseListener(result));

    }

    public void forceSyncApplyGroupRequest(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncApplyGroupRequest();
    }

    public void forceSyncGroupRequest(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncGroupRequest();
    }

    public void forceSyncJoinedGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncJoinedGroup();
    }

    public void forceSyncJoinedGroupMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncJoinedGroupMember();
    }
}