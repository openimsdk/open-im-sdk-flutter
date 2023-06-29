package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnFriendshipListener implements open_im_sdk_callback.OnFriendshipListener {

    @Override
    public void onBlackAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onBlackAdded", s);
    }

    @Override
    public void onBlackDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onBlackDeleted", s);
    }

    @Override
    public void onFriendAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendAdded", s);
    }

    @Override
    public void onFriendApplicationAccepted(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationAccepted", s);
    }

    @Override
    public void onFriendApplicationAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationAdded", s);
    }

    @Override
    public void onFriendApplicationDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationDeleted", s);
    }

    @Override
    public void onFriendApplicationRejected(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationRejected", s);
    }

    @Override
    public void onFriendDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendDeleted", s);
    }

    @Override
    public void onFriendInfoChanged(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendInfoChanged", s);
    }
}
