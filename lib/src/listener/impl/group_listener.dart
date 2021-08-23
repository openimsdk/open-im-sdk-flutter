import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnGroupListener implements GroupListener {
  Function(String groupId, GroupMembersInfo opUser, int agreeOrReject,
      String opReason)? applicationProcessed;
  Function(String groupId)? groupCreated;
  Function(String groupId, GroupInfo info)? groupInfoChanged;
  Function(String groupId, List<GroupMembersInfo> list)? memberEnter;
  Function(
          String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list)?
      memberInvited;
  Function(
          String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list)?
      memberKicked;
  Function(String groupId, GroupMembersInfo info)? memberLeave;
  Function(String groupId, GroupMembersInfo info, String opReason)?
      receiveJoinApplication;

  OnGroupListener({
    this.applicationProcessed,
    this.groupCreated,
    this.groupInfoChanged,
    this.memberEnter,
    this.memberInvited,
    this.memberKicked,
    this.memberLeave,
    this.receiveJoinApplication,
  });

  @override
  void onApplicationProcessed(String groupId, GroupMembersInfo opUser,
      int agreeOrReject, String opReason) {
    if (null != applicationProcessed)
      applicationProcessed!(groupId, opUser, agreeOrReject, opReason);
  }

  @override
  void onGroupCreated(String groupId) {
    if (null != groupCreated) groupCreated!(groupId);
  }

  @override
  void onGroupInfoChanged(String groupId, GroupInfo info) {
    if (null != groupInfoChanged) groupInfoChanged!(groupId, info);
  }

  @override
  void onMemberEnter(String groupId, List<GroupMembersInfo> list) {
    if (null != memberEnter) memberEnter!(groupId, list);
  }

  @override
  void onMemberInvited(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list) {
    if (null != memberInvited) memberInvited!(groupId, opUser, list);
  }

  @override
  void onMemberKicked(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list) {
    if (null != memberKicked) memberKicked!(groupId, opUser, list);
  }

  @override
  void onMemberLeave(String groupId, GroupMembersInfo info) {
    if (null != memberLeave) memberLeave!(groupId, info);
  }

  @override
  void onReceiveJoinApplication(
      String groupId, GroupMembersInfo info, String opReason) {
    if (null != receiveJoinApplication)
      receiveJoinApplication!(groupId, info, opReason);
  }
}
