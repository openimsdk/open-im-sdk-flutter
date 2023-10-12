import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Group Listener
class OnGroupListener {
  Function(GroupApplicationInfo info)? onGroupApplicationAccepted;
  Function(GroupApplicationInfo info)? onGroupApplicationAdded;
  Function(GroupApplicationInfo info)? onGroupApplicationDeleted;
  Function(GroupApplicationInfo info)? onGroupApplicationRejected;
  Function(GroupInfo info)? onGroupDismissed;
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
    this.onGroupDismissed,
    this.onGroupInfoChanged,
    this.onGroupMemberAdded,
    this.onGroupMemberDeleted,
    this.onGroupMemberInfoChanged,
    this.onJoinedGroupAdded,
    this.onJoinedGroupDeleted,
  });

  /// Group application accepted
  void groupApplicationAccepted(GroupApplicationInfo info) {
    onGroupApplicationAccepted?.call(info);
  }

  /// Group application added
  void groupApplicationAdded(GroupApplicationInfo info) {
    onGroupApplicationAdded?.call(info);
  }

  /// Group application deleted
  void groupApplicationDeleted(GroupApplicationInfo info) {
    onGroupApplicationDeleted?.call(info);
  }

  /// Group application rejected
  void groupApplicationRejected(GroupApplicationInfo info) {
    onGroupApplicationRejected?.call(info);
  }

  void groupDismissed(GroupInfo info) {
    onGroupDismissed?.call(info);
  }

  /// Group information changed
  void groupInfoChanged(GroupInfo info) {
    onGroupInfoChanged?.call(info);
  }

  /// Group member added
  void groupMemberAdded(GroupMembersInfo info) {
    onGroupMemberAdded?.call(info);
  }

  /// Group member deleted
  void groupMemberDeleted(GroupMembersInfo info) {
    onGroupMemberDeleted?.call(info);
  }

  /// Group member information changed
  void groupMemberInfoChanged(GroupMembersInfo info) {
    onGroupMemberInfoChanged?.call(info);
  }

  /// Joined group added
  void joinedGroupAdded(GroupInfo info) {
    onJoinedGroupAdded?.call(info);
  }

  /// Joined group deleted
  void joinedGroupDeleted(GroupInfo info) {
    onJoinedGroupDeleted?.call(info);
  }
}
