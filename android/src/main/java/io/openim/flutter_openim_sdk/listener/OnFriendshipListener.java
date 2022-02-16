package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

/**
 * 申请添加好友：
 * 主动申请者收到OnFriendApplicationAdded
 * 被添加者收到OnFriendApplicationAdded    ok  111加222
 * <p>
 * 同意好友申请：
 * 操作者收到 OnFriendApplicationAccepted OnFriendAdded；
 * 申请者收到：OnFriendApplicationAccepted OnFriendAdded  ok
 * <p>
 * 好友拒绝申请：
 * 操作者收到OnFriendApplicationRejected；
 * 申请者收到：OnFriendApplicationRejected ok
 * <p>
 * 删除好友：
 * 操作者收到OnFriendDeleted  ok
 * <p>
 * 修改备注：
 * 操作者收到OnFriendInfoChanged  ok
 * <p>
 * 添加黑名单：
 * 操作者收到OnBlackAdded；  ok
 * <p>
 * 移除黑名单：
 * 操作者收到OnBlackDeleted  ok
 */
public class OnFriendshipListener implements open_im_sdk_callback.OnFriendshipListener {

    @Override
    public void onBlackAdded(String s) {
        CommonUtil.emitEvent("friendListener", "onBlacklistAdded", s);
    }

    @Override
    public void onBlackDeleted(String s) {
        CommonUtil.emitEvent("friendListener", "onBlacklistDeleted", s);
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
