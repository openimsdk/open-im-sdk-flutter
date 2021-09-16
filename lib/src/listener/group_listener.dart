import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class GroupListener {
  void memberEnter(String groupId, List<GroupMembersInfo> list);

  void memberLeave(String groupId, GroupMembersInfo info);

  void memberInvited(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list);

  void memberKicked(
      String groupId, GroupMembersInfo opUser, List<GroupMembersInfo> list);

  void groupCreated(String groupId);

  void groupInfoChanged(String groupId, GroupInfo info);

  void receiveJoinApplication(
      String groupId, GroupMembersInfo info, String opReason);

  void applicationProcessed(String groupId, GroupMembersInfo opUser,
      int agreeOrReject, String opReason);
}
