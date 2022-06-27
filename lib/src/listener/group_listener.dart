import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 群组监听
class OnGroupListener {
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
  });

  /// 群申请已被接受
  void groupApplicationAccepted(GroupApplicationInfo info) {
    onGroupApplicationAccepted?.call(info);
  }

  /// 群申请已被添加
  void groupApplicationAdded(GroupApplicationInfo info) {
    onGroupApplicationAdded?.call(info);
  }

  /// 群申请已被删除
  void groupApplicationDeleted(GroupApplicationInfo info) {
    onGroupApplicationDeleted?.call(info);
  }

  /// 群申请已被拒绝
  void groupApplicationRejected(GroupApplicationInfo info) {
    onGroupApplicationRejected?.call(info);
  }

  /// 群资料发生改变
  void groupInfoChanged(GroupInfo info) {
    onGroupInfoChanged?.call(info);
  }

  /// 群成员已添加
  void groupMemberAdded(GroupMembersInfo info) {
    onGroupMemberAdded?.call(info);
  }

  /// 群成员已删除
  void groupMemberDeleted(GroupMembersInfo info) {
    onGroupMemberDeleted?.call(info);
  }

  /// 群成员信息发送改变
  void groupMemberInfoChanged(GroupMembersInfo info) {
    onGroupMemberInfoChanged?.call(info);
  }

  /// 已加入的群有新增
  void joinedGroupAdded(GroupInfo info) {
    onJoinedGroupAdded?.call(info);
  }

  /// 已加入的群减少
  void joinedGroupDeleted(GroupInfo info) {
    onJoinedGroupDeleted?.call(info);
  }
}
