package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnFriendshipListener;
import open_im_sdk.Open_im_sdk;

public class FriendshipManager extends BaseManager {


    public void setFriendListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendListener(new OnFriendshipListener());

        result.success(null);
    }

    public void getFriendsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSpecifiedFriendsInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "userIDList"),
                value(methodCall, "filterBlack")
        );
    }

    public void addFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall)
        );
    }

    public void getFriendApplicationListAsRecipient(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendApplicationListAsRecipient(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getFriendApplicationListAsApplicant(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendApplicationListAsApplicant(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID")
        );
    }

    public void getFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendList(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "filterBlack")
        );
    }

    public void getFriendListPage(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendListPage(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "offset"),
                value(methodCall, "count"),
                value(methodCall, "filterBlack")
        );
    }

    public void addBlacklist(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addBlack(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID"),
                value(methodCall, "ex")
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
                value(methodCall, "userID")
        );
    }

    public void checkFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.checkFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "userIDList")
        );
    }

    public void deleteFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFriend(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID")
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

    public void updateFriends(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.updateFriends(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "req")
        );
    }
}
