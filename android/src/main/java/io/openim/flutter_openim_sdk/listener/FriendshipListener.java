package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnFriendshipListener;

public class FriendshipListener implements OnFriendshipListener {

    @Override
    public void onBlackListAdd(String s) {
        CommonUtil.emitEvent("friendListener", "onBlackListAdd", s);
    }

    @Override
    public void onBlackListDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onBlackListDeleted", s);
    }

    @Override
    public void onFriendApplicationListAccept(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationListAccept", s);
    }

    @Override
    public void onFriendApplicationListAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationListAdded", s);
    }

    @Override
    public void onFriendApplicationListDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationListDeleted", s);
    }

    @Override
    public void onFriendApplicationListReject(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendApplicationListReject", s);
    }

    @Override
    public void onFriendInfoChanged(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendInfoChanged", s);
    }

    @Override
    public void onFriendListAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendListAdded", s);
    }

    @Override
    public void onFriendListDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onFriendListDeleted", s);
    }
}
