package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseListener;
import io.openim.flutter_openim_sdk.listener.FriendshipListener;
import open_im_sdk.Open_im_sdk;

public class FriendshipManager extends BaseManager {


    public void setFriendListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendListener(new FriendshipListener());
    }

    public void getFriendsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendsInfo(new BaseListener(result),
                jsonValue(methodCall, "uidList"));
    }

    public void addFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addFriend(new BaseListener(result),
                jsonValue(methodCall));
    }

    public void getFriendApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendApplicationList(new BaseListener(result));
    }

    public void getFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendList(new BaseListener(result));
    }

    public void setFriendInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendInfo(
                jsonValue(methodCall), new BaseListener(result));
    }

    public void addToBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addToBlackList(new BaseListener(result),
                jsonValue(methodCall, "uid"));
    }

    public void getBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getBlackList(new BaseListener(result));
    }

    public void deleteFromBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFromBlackList(new BaseListener(result),
                jsonValue(methodCall, "uid"));
    }

    public void checkFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.checkFriend(new BaseListener(result),
                jsonValue(methodCall, "uidList"));
    }

    public void deleteFromFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFromFriendList(
                jsonValue(methodCall, "uid"), new BaseListener(result));
    }

    public void acceptFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptFriendApplication(new BaseListener(result),
                jsonValue(methodCall, "uid"));
    }

    public void refuseFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseFriendApplication(new BaseListener(result),
                jsonValue(methodCall, "uid"));
    }

//    public void forceSyncFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncFriendApplication();
//    }
//
//    public void forceSyncFriend(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncFriend();
//    }
//
//    public void forceSyncBlackList(MethodCall methodCall, MethodChannel.Result result) {
//        Open_im_sdk.forceSyncBlackList();
//    }
}
