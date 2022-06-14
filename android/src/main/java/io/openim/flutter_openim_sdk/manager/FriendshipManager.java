package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnFriendshipListener;
import open_im_sdk.Open_im_sdk;

public class FriendshipManager extends BaseManager {


    public void setFriendListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendListener(new OnFriendshipListener());
    }

    public void getFriendsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getDesignatedFriendsInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "uidList")
        );
    }

    public void addFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void getRecvFriendApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getRecvFriendApplicationList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getSendFriendApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSendFriendApplicationList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void setFriendRemark(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendRemark(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void addBlacklist(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addBlack(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "uid")
        );
    }

    public void getBlacklist(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getBlackList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void removeBlacklist(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.removeBlack(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "uid")
        );
    }

    public void checkFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.checkFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "uidList")
        );
    }

    public void deleteFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "uid")
        );
    }

    public void acceptFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptFriendApplication(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void refuseFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseFriendApplication(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void searchFriends(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchFriends(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "searchParam")
        );
    }
}
