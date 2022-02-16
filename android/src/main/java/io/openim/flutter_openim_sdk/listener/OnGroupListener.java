package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

/**
 * 创建群：
 * 初始成员收到：OnJoinedGroupAdded   验证ok   1111 创建 2222
 * <p>
 * 退出群：
 * 退出者收到：OnJoinedGroupDeleted
 * 群成员收到：OnGroupMemberDeleted  2222退出群    验证ok
 * <p>
 * 踢出群：
 * 被踢者收到：OnJoinedGroupDeleted
 * 群成员收到：OnGroupMemberDeleted  验证ok
 * <p>
 * 邀请进群：
 * 被邀请者收到：OnJoinedGroupAdded
 * 群成员（不包括被邀请者）收到：OnGroupMemberAdded   1111邀请2222  验证ok
 * <p>
 * 申请加群：
 * 申请者收到：OnGroupApplicationAdded
 * 群主+管理员收到：OnReceiveJoinGroupApplicationAdded    验证ok
 * <p>
 * 同意进群：
 * 申请者收到：OnJoinedGroupAdded OnGroupApplicationAccepted
 * 群成员（不包括申请者）收到：OnGroupMemberAdded
 * 审批者（群主或者管理员）收到：OnGroupMemberAdded OnGroupApplicationAccepted  验证ok
 * <p>
 * 拒绝进群：
 * 申请者收到：OnGroupApplicationRejected；
 * 审批者（群主或者管理员）收到：OnGroupApplicationRejected    验证ok
 * <p>
 * 修改群资料： 群成员收到： OnGroupInfoChanged 验证ok
 */
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

    @Override
    public void onReceiveJoinGroupApplicationAdded(String s) {
        CommonUtil.emitEvent("groupListener", "onReceiveJoinGroupApplicationAdded", s);
    }

    @Override
    public void onReceiveJoinGroupApplicationDeleted(String s) {
        CommonUtil.emitEvent("groupListener", "onReceiveJoinGroupApplicationDeleted", s);
    }
}
