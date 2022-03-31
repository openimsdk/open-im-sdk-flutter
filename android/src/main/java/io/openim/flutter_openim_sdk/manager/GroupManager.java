package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnGroupListener;
import open_im_sdk.Open_im_sdk;

public class GroupManager extends BaseManager {

    public void setGroupListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupListener(new OnGroupListener());
    }

    public void inviteUserToGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.inviteUserToGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "uidList")
        );
    }

    public void kickGroupMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.kickGroupMember(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "uidList")
        );
    }

    public void getGroupMembersInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMembersInfo(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                jsonValue(methodCall, "uidList")
        );
    }

    public void getGroupMemberList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberList(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "filter"),
                value(methodCall, "offset"),
                value(methodCall, "count")
        );
    }


    public void getJoinedGroupList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getJoinedGroupList(
                new OnBaseListener(result),
                value(methodCall, "operationID")
        );
    }

    public void createGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.createGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "gInfo"),
                jsonValue(methodCall, "memberList")
        );
    }

    public void setGroupInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupInfo(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                jsonValue(methodCall, "gInfo")
        );
    }

    public void getGroupsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupsInfo(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "gidList")
        );
    }

    public void joinGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.joinGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "reason")
        );
    }

    public void quitGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.quitGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid")
        );
    }

    public void transferGroupOwner(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.transferGroupOwner(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "uid")
        );
    }

    public void getRecvGroupApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getRecvGroupApplicationList(
                new OnBaseListener(result),
                value(methodCall, "operationID")
        );
    }

    public void getSendGroupApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSendGroupApplicationList(
                new OnBaseListener(result),
                value(methodCall, "operationID")
        );
    }

    public void acceptGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptGroupApplication(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "uid"),
                value(methodCall, "handleMsg")
        );

    }

    public void refuseGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseGroupApplication(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "uid"),
                value(methodCall, "handleMsg")
        );

    }

    public void dismissGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.dismissGroup(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid")
        );
    }

    public void changeGroupMute(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.changeGroupMute(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "mute")
        );
    }

    public void changeGroupMemberMute(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.changeGroupMemberMute(
                new OnBaseListener(result),
                value(methodCall, "operationID"),
                value(methodCall, "gid"),
                value(methodCall, "uid"),
                int2long(methodCall, "seconds")
        );
    }
}