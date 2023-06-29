package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnGroupListener implements open_im_sdk_callback.OnGroupListener {

    @Override
    public void onGroupApplicationAccepted(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupApplicationAccepted", s);
    }

    @Override
    public void onGroupApplicationAdded(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupApplicationAdded", s);
    }

    @Override
    public void onGroupApplicationDeleted(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupApplicationDeleted", s);
    }

    @Override
    public void onGroupApplicationRejected(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupApplicationRejected", s);
    }

    @Override
    public void onGroupDismissed(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupDismissed", s);
    }

    @Override
    public void onGroupInfoChanged(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupInfoChanged", s);
    }

    @Override
    public void onGroupMemberAdded(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupMemberAdded", s);
    }

    @Override
    public void onGroupMemberDeleted(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupMemberDeleted", s);
    }

    @Override
    public void onGroupMemberInfoChanged(String s) {
        CommonUtil.emitEvent("groupListener", "onGroupMemberInfoChanged", s);
    }

    @Override
    public void onJoinedGroupAdded(String s) {
        CommonUtil.emitEvent("groupListener", "onJoinedGroupAdded", s);
    }

    @Override
    public void onJoinedGroupDeleted(String s) {
        CommonUtil.emitEvent("groupListener", "onJoinedGroupDeleted", s);
    }
}
