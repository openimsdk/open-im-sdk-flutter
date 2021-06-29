package io.openim.flutter_openim_sdk.listener;

import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnFriendshipListener;

public class FriendshipListenerImpl implements OnFriendshipListener {
    private final MethodChannel channel;

    public FriendshipListenerImpl(MethodChannel channel) {
        this.channel = channel;
    }

    @Override
    public void onBlackListAdd(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onBlackListAdd", s);
    }

    @Override
    public void onBlackListDeleted(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onBlackListDeleted", s);
    }

    @Override
    public void onFriendApplicationListAccept(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendApplicationListAccept", s);
    }

    @Override
    public void onFriendApplicationListAdded(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendApplicationListAdded", s);
    }

    @Override
    public void onFriendApplicationListDeleted(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendApplicationListDeleted", s);
    }

    @Override
    public void onFriendApplicationListReject(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendApplicationListReject", s);
    }

    @Override
    public void onFriendInfoChanged(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendInfoChanged", s);
    }

    @Override
    public void onFriendListAdded(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendListAdded", s);
    }

    @Override
    public void onFriendListDeleted(String s) {
        CommonUtil.emitEvent(channel, "friendListener", "onFriendListDeleted", s);
    }
}
