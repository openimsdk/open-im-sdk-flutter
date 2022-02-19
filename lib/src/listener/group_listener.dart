import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class GroupListener {
  void joinedGroupAdded(GroupInfo info);

  void joinedGroupDeleted(GroupInfo info);

  void groupMemberAdded(GroupMembersInfo info);

  void groupMemberDeleted(GroupMembersInfo info);

  void groupApplicationAdded(GroupApplicationInfo info);

  void groupApplicationDeleted(GroupApplicationInfo info);

  void groupInfoChanged(GroupInfo info);

  void groupMemberInfoChanged(GroupMembersInfo info);

  void groupApplicationAccepted(GroupApplicationInfo info);

  void groupApplicationRejected(GroupApplicationInfo info);
}
