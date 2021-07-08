import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class GroupListener {
  void onMemberEnter(String groupId, List<GroupMembersInfo> list) {}

  void onMemberLeave(String groupId, GroupMembersInfo info) {}

  void onMemberInvited(
    String groupId,
    GroupMembersInfo opUser,
    List<GroupMembersInfo> list,
  ) {}

  void onMemberKicked(
    String groupId,
    GroupMembersInfo opUser,
    List<GroupMembersInfo> list,
  ) {}

  void onGroupCreated(String groupId) {}

  void onGroupInfoChanged(String groupId, GroupInfo info) {}

  void onReceiveJoinApplication(
    String groupId,
    GroupMembersInfo info,
    String opReason,
  ) {}

  void onApplicationProcessed(
    String groupId,
    GroupMembersInfo opUser,
    int agreeOrReject,
    String opReason,
  ) {}
}
