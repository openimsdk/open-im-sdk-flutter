import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnGroupListener extends GroupListener {
  Function(String groupId, GroupMembersInfo opUser, int agreeOrReject,
      String opReason)? onApplicationProcessed;
  Function(String groupId)? onGroupCreated;
  Function(String groupId, GroupInfo info)? onGroupInfoChanged;
  Function(String groupId, List<GroupMembersInfo> list)? onMemberEnter;
  Function(
          String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list)?
      onMemberInvited;
  Function(
          String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list)?
      onMemberKicked;
  Function(String groupId, GroupMembersInfo info)? onMemberLeave;
  Function(String groupId, GroupMembersInfo info, String opReason)?
      onReceiveJoinApplication;

  OnGroupListener({
    this.onApplicationProcessed,
    this.onGroupCreated,
    this.onGroupInfoChanged,
    this.onMemberEnter,
    this.onMemberInvited,
    this.onMemberKicked,
    this.onMemberLeave,
    this.onReceiveJoinApplication,
  });

  @override
  void applicationProcessed(String groupId, GroupMembersInfo opUser,
      int agreeOrReject, String opReason) {
    if (null != onApplicationProcessed)
      onApplicationProcessed!(groupId, opUser, agreeOrReject, opReason);
  }

  @override
  void groupCreated(String groupId) {
    if (null != onGroupCreated) onGroupCreated!(groupId);
  }

  @override
  void groupInfoChanged(String groupId, GroupInfo info) {
    if (null != onGroupInfoChanged) onGroupInfoChanged!(groupId, info);
  }

  @override
  void memberEnter(String groupId, List<GroupMembersInfo> list) {
    if (null != onMemberEnter) onMemberEnter!(groupId, list);
  }

  @override
  void memberInvited(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list) {
    if (null != onMemberInvited) onMemberInvited!(groupId, opUser, list);
  }

  @override
  void memberKicked(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list) {
    if (null != onMemberKicked) onMemberKicked!(groupId, opUser, list);
  }

  @override
  void memberLeave(String groupId, GroupMembersInfo info) {
    if (null != onMemberLeave) onMemberLeave!(groupId, info);
  }

  @override
  void receiveJoinApplication(
      String groupId, GroupMembersInfo info, String opReason) {
    if (null != onReceiveJoinApplication)
      onReceiveJoinApplication!(groupId, info, opReason);
  }
}
