import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 创建群：
/// 初始成员收到 OnJoinedGroupAdded
///
/// 退出群：
/// 退出者收到 OnJoinedGroupDeleted
/// 群成员收到 OnGroupMemberDeleted
///
/// 踢出群：
/// 被踢者收到 OnJoinedGroupDeleted
/// 群成员收到 OnGroupMemberDeleted
///
/// 邀请进群：
/// 被邀请者收到 OnJoinedGroupAdded
/// 群成员（不包括被邀请者）收到 OnGroupMemberAdded
///
/// 申请加群：
/// 申请者收到 OnGroupApplicationAdded
/// 群主+管理员收到 OnReceiveJoinGroupApplicationAdded
///
/// 同意进群：
/// 申请者收到 OnJoinedGroupAdded OnGroupApplicationAccepted
/// 群成员（不包括申请者）收到 OnGroupMemberAdded
/// 审批者（群主或者管理员）收到 OnGroupMemberAdded OnGroupApplicationAccepted
///
/// 拒绝进群：
/// 申请者收到 OnGroupApplicationRejected；
/// 审批者（群主或者管理员）收到 OnGroupApplicationRejected
///
/// 修改群资料：
/// 群成员收到 OnGroupInfoChanged
class OnGroupListener extends GroupListener {
  Function(GroupApplicationInfo info)? onGroupApplicationAccepted;
  Function(GroupApplicationInfo info)? onGroupApplicationAdded;
  Function(GroupApplicationInfo info)? onGroupApplicationDeleted;
  Function(GroupApplicationInfo info)? onGroupApplicationRejected;
  Function(GroupInfo info)? onGroupInfoChanged;
  Function(GroupMembersInfo info)? onGroupMemberAdded;
  Function(GroupMembersInfo info)? onGroupMemberDeleted;
  Function(GroupMembersInfo info)? onGroupMemberInfoChanged;
  Function(GroupInfo info)? onJoinedGroupAdded;
  Function(GroupInfo info)? onJoinedGroupDeleted;
  Function(GroupApplicationInfo info)? onReceiveJoinGroupApplicationAdded;
  Function(GroupApplicationInfo info)? onReceiveJoinGroupApplicationDeleted;

  OnGroupListener({
    this.onGroupApplicationAccepted,
    this.onGroupApplicationAdded,
    this.onGroupApplicationDeleted,
    this.onGroupApplicationRejected,
    this.onGroupInfoChanged,
    this.onGroupMemberAdded,
    this.onGroupMemberDeleted,
    this.onGroupMemberInfoChanged,
    this.onJoinedGroupAdded,
    this.onJoinedGroupDeleted,
    this.onReceiveJoinGroupApplicationAdded,
    this.onReceiveJoinGroupApplicationDeleted,
  });

  @override
  void groupApplicationAccepted(GroupApplicationInfo info) {
    onGroupApplicationAccepted?.call(info);
  }

  @override
  void groupApplicationAdded(GroupApplicationInfo info) {
    onGroupApplicationAdded?.call(info);
  }

  @override
  void groupApplicationDeleted(GroupApplicationInfo info) {
    onGroupApplicationDeleted?.call(info);
  }

  @override
  void groupApplicationRejected(GroupApplicationInfo info) {
    onGroupApplicationRejected?.call(info);
  }

  @override
  void groupInfoChanged(GroupInfo info) {
    onGroupInfoChanged?.call(info);
  }

  @override
  void groupMemberAdded(GroupMembersInfo info) {
    onGroupMemberAdded?.call(info);
  }

  @override
  void groupMemberDeleted(GroupMembersInfo info) {
    onGroupMemberDeleted?.call(info);
  }

  @override
  void groupMemberInfoChanged(GroupMembersInfo info) {
    onGroupMemberInfoChanged?.call(info);
  }

  @override
  void joinedGroupAdded(GroupInfo info) {
    onJoinedGroupAdded?.call(info);
  }

  @override
  void joinedGroupDeleted(GroupInfo info) {
    onJoinedGroupDeleted?.call(info);
  }

  @override
  void receiveJoinGroupApplicationAdded(GroupApplicationInfo info) {
    onReceiveJoinGroupApplicationAdded?.call(info);
  }

  @override
  void receiveJoinGroupApplicationDeleted(GroupApplicationInfo info) {
    onReceiveJoinGroupApplicationDeleted?.call(info);
  }
}
