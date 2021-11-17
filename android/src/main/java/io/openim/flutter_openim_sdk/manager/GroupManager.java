package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.GroupListener;
import open_im_sdk.Open_im_sdk;

public class GroupManager extends BaseManager {

    public void setGroupListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupListener(new GroupListener());
    }

    public void inviteUserToGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.inviteUserToGroup(
                value(methodCall, "gid"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "uidList"),
                new BaseListener(result));
    }

    public void kickGroupMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.kickGroupMember(
                value(methodCall, "gid"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "uidList"),
                new BaseListener(result));
    }

    public void getGroupMembersInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMembersInfo(
                value(methodCall, "gid"),
                jsonValue(methodCall, "uidList"),
                new BaseListener(result));
    }

    public void getGroupMemberList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberList(
                value(methodCall, "gid"),
                value(methodCall, "filter"),
                value(methodCall, "next"),
                new BaseListener(result));
    }


    public void getJoinedGroupList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getJoinedGroupList(new BaseListener(result));
    }

    public void createGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.createGroup(
                jsonValue(methodCall, "gInfo"),
                jsonValue(methodCall, "memberList"),
                new BaseListener(result));
    }

    public void setGroupInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupInfo(jsonValue(methodCall, "gInfo"), new BaseListener(result));
    }

    public void getGroupsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupsInfo(jsonValue(methodCall, "gidList"), new BaseListener(result));
    }

    public void joinGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.joinGroup(
                value(methodCall, "gid"),
                value(methodCall, "reason"),
                new BaseListener(result));
    }

    public void quitGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.quitGroup(
                value(methodCall, "gid"),
                new BaseListener(result));
    }

    public void transferGroupOwner(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.transferGroupOwner(
                value(methodCall, "gid"),
                value(methodCall, "uid"),
                new BaseListener(result));
    }

    public void getGroupApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupApplicationList(new BaseListener(result));
    }

    public void acceptGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptGroupApplication(
                jsonValue(methodCall, "application"),
                value(methodCall, "reason"),
                new BaseListener(result));

    }

    public void refuseGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseGroupApplication(
                jsonValue(methodCall, "application"),
                value(methodCall, "reason"),
                new BaseListener(result));

    }

//    public void forceSyncApplyGroupRequest(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncApplyGroupRequest();
//    }
//
//    public void forceSyncGroupRequest(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncGroupRequest();
//    }
//
//    public void forceSyncJoinedGroup(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncJoinedGroup();
//    }
//
//    public void forceSyncJoinedGroupMember(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncJoinedGroupMember();
//    }
}