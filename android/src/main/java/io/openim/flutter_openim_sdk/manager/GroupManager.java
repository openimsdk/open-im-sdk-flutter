package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnGroupListener;
import open_im_sdk.Open_im_sdk;

public class GroupManager extends BaseManager {

    public void setGroupListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupListener(new OnGroupListener());

        result.success(null);
    }

    public void inviteUserToGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.inviteUserToGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "userIDList")
        );
    }

    public void kickGroupMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.kickGroupMember(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "reason"),
                jsonValue(methodCall, "userIDList")
        );
    }

    public void getGroupMembersInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSpecifiedGroupMembersInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                jsonValue(methodCall, "userIDList")
        );
    }

    public void getGroupMemberList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "filter"),
                value(methodCall, "offset"),
                value(methodCall, "count")
        );
    }


    public void getJoinedGroupList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getJoinedGroupList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getJoinedGroupListPage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getJoinedGroupListPage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "offset"),
                value(methodCall, "count")
        );
    }

    public void createGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.createGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void setGroupInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "groupInfo")
        );
    }

    public void getGroupsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSpecifiedGroupsInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "groupIDList")
        );
    }

    public void joinGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.joinGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "reason"),
                value(methodCall, "joinSource"),
                value(methodCall, "ex")
        );
    }

    public void quitGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.quitGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public void transferGroupOwner(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.transferGroupOwner(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "userID")
        );
    }

    public void getGroupApplicationListAsRecipient(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupApplicationListAsRecipient(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getGroupApplicationListAsApplicant(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupApplicationListAsApplicant(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void acceptGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptGroupApplication(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "userID"),
                value(methodCall, "handleMsg")
        );

    }

    public void refuseGroupApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseGroupApplication(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "userID"),
                value(methodCall, "handleMsg")
        );

    }

    public void dismissGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.dismissGroup(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public void changeGroupMute(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.changeGroupMute(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "mute")
        );
    }

    public void changeGroupMemberMute(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.changeGroupMemberMute(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "userID"),
                int2long(methodCall, "seconds")
        );
    }

    public void searchGroups(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchGroups(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "searchParam")
        );
    }

    public void getGroupMemberListByJoinTimeFilter(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberListByJoinTimeFilter(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                value(methodCall, "offset"),
                value(methodCall, "count"),
                int2long(methodCall, "joinTimeBegin"),
                int2long(methodCall, "joinTimeEnd"),
                jsonValue(methodCall, "excludeUserIDList")
        );
    }

    public void getGroupMemberOwnerAndAdmin(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getGroupMemberOwnerAndAdmin(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public void searchGroupMembers(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchGroupMembers(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "searchParam")
        );
    }

    public void setGroupMemberInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setGroupMemberInfo(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "info")
        );
    }

    public void isJoinGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.isJoinGroup(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID")
        );
    }

    public  void getUsersInGroup(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getUsersInGroup(new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "groupID"),
                jsonValue(methodCall, "userIDs")
        );
    }
}