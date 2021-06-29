package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.BaseImpl;
import io.openim.flutter_openim_sdk.listener.FriendshipListenerImpl;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.Open_im_sdk;

public class FriendshipManager {

    final private MethodChannel channel;

    public FriendshipManager(MethodChannel channel) {
        this.channel = channel;
    }

    public void setFriendListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendListener(new FriendshipListenerImpl(channel));
    }

    public void getFriendsInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendsInfo(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void addFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addFriend(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void getFriendApplicationList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendApplicationList(new BaseImpl(result));
    }

    public void getFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getFriendList(new BaseImpl(result));
    }

    public void setFriendInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setFriendInfo(CommonUtil.getSDKJsonParam(methodCall), new BaseImpl(result));
    }

    public void addToBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.addToBlackList(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void getBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getBlackList(new BaseImpl(result));
    }

    public void deleteFromBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFromBlackList(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void checkFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.checkFriend(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void deleteFromFriendList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.deleteFromFriendList(CommonUtil.getSDKJsonParam(methodCall), new BaseImpl(result));
    }

    public void acceptFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.acceptFriendApplication(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void refuseFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.refuseFriendApplication(new BaseImpl(result), CommonUtil.getSDKJsonParam(methodCall));
    }

    public void forceSyncFriendApplication(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncFriendApplication();
    }

    public void forceSyncFriend(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncFriend();
    }

    public void forceSyncBlackList(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.forceSyncBlackList();
    }
}
