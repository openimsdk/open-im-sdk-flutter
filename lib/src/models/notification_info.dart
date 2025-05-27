import '../../flutter_openim_sdk.dart';

/// OA Notification
class OANotification {
  /// Title
  String? notificationName;

  /// Avatar
  String? notificationFaceURL;

  /// Type
  int? notificationType;

  /// Text content
  String? text;

  /// Redirect link
  String? externalUrl;

  /// 0: Text-only notification
  /// 1: Text + Image notification
  /// 2: Text + Video notification
  /// 3: Text + File notification
  int? mixType;

  /// Image information
  PictureElem? pictureElem;

  /// Sound information
  SoundElem? soundElem;

  /// Video information
  VideoElem? videoElem;

  /// File information
  FileElem? fileElem;

  /// Additional field
  String? ex;

  OANotification(
      {this.notificationName,
      this.notificationFaceURL,
      this.notificationType,
      this.text,
      this.externalUrl,
      this.mixType,
      this.pictureElem,
      this.soundElem,
      this.videoElem,
      this.fileElem,
      this.ex});

  OANotification.fromJson(Map<String, dynamic> json) {
    notificationName = json['notificationName'];
    notificationFaceURL = json['notificationFaceURL'];
    notificationType = json['notificationType'];
    text = json['text'];
    externalUrl = json['externalUrl'];
    mixType = json['mixType'];
    pictureElem = json['pictureElem'] != null ? PictureElem.fromJson(json['pictureElem']) : null;
    soundElem = json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem = json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem = json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['notificationName'] = notificationName;
    data['notificationFaceURL'] = notificationFaceURL;
    data['notificationType'] = notificationType;
    data['text'] = text;
    data['externalUrl'] = externalUrl;
    data['mixType'] = mixType;
    if (pictureElem != null) {
      data['pictureElem'] = pictureElem!.toJson();
    }
    if (soundElem != null) {
      data['soundElem'] = soundElem!.toJson();
    }
    if (videoElem != null) {
      data['videoElem'] = videoElem!.toJson();
    }
    if (fileElem != null) {
      data['fileElem'] = fileElem!.toJson();
    }
    data['ex'] = ex;
    return data;
  }
}

/// Group Event Notification
class GroupNotification {
  /// Group information
  GroupInfo? group;

  /// Current event operator information
  GroupMembersInfo? opUser;

  /// Group owner information
  GroupMembersInfo? groupOwnerUser;

  /// List of affected group members
  List<GroupMembersInfo>? memberList;

  GroupNotification({
    this.group,
    this.opUser,
    this.groupOwnerUser,
    this.memberList,
  });

  GroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    groupOwnerUser = json['groupOwnerUser'] != null ? GroupMembersInfo.fromJson(json['groupOwnerUser']) : null;
    if (json['memberList'] != null) {
      memberList = <GroupMembersInfo>[];
      json['memberList'].forEach((v) {
        memberList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (groupOwnerUser != null) {
      data['groupOwnerUser'] = groupOwnerUser!.toJson();
    }
    if (memberList != null) {
      data['memberList'] = memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// User Invited to Join Group Notification
class InvitedJoinGroupNotification {
  /// Group information
  GroupInfo? group;

  /// Operator information
  GroupMembersInfo? opUser;

  /// Inviter information
  GroupMembersInfo? inviterUser;

  /// List of members invited to join the group
  List<GroupMembersInfo>? invitedUserList;

  InvitedJoinGroupNotification({this.group, this.opUser, this.invitedUserList});

  InvitedJoinGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    inviterUser = json['inviterUser'] != null ? GroupMembersInfo.fromJson(json['inviterUser']) : null;
    if (json['invitedUserList'] != null) {
      invitedUserList = <GroupMembersInfo>[];
      json['invitedUserList'].forEach((v) {
        invitedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (inviterUser != null) {
      data['inviterUser'] = inviterUser!.toJson();
    }
    if (invitedUserList != null) {
      data['invitedUserList'] = invitedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Group Member Kicked Notification
class KickedGroupMemeberNotification {
  /// Group information
  GroupInfo? group;

  /// Operator information
  GroupMembersInfo? opUser;

  /// List of members kicked from the group
  List<GroupMembersInfo>? kickedUserList;

  KickedGroupMemeberNotification({this.group, this.opUser, this.kickedUserList});

  KickedGroupMemeberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    if (json['kickedUserList'] != null) {
      kickedUserList = <GroupMembersInfo>[];
      json['kickedUserList'].forEach((v) {
        kickedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (kickedUserList != null) {
      data['kickedUserList'] = kickedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Quit Group Notification
class QuitGroupNotification {
  /// Group information
  GroupInfo? group;

  /// Information of the member who quit the group
  GroupMembersInfo? quitUser;

  QuitGroupNotification({this.group, this.quitUser});

  QuitGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    quitUser = json['quitUser'] != null ? GroupMembersInfo.fromJson(json['quitUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (quitUser != null) {
      data['quitUser'] = quitUser!.toJson();
    }
    return data;
  }
}

/// Enter Group Notification
class EnterGroupNotification {
  /// Group information
  GroupInfo? group;

  /// Information of the member who entered the group
  GroupMembersInfo? entrantUser;

  EnterGroupNotification({this.group, this.entrantUser});

  EnterGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    entrantUser = json['entrantUser'] != null ? GroupMembersInfo.fromJson(json['entrantUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (entrantUser != null) {
      data['entrantUser'] = entrantUser!.toJson();
    }
    return data;
  }
}

/// Group Rights Transfer Notification
class GroupRightsTransferNoticication {
  /// Group information
  GroupInfo? group;

  /// Operator information
  GroupMembersInfo? opUser;

  /// New group owner information
  GroupMembersInfo? newGroupOwner;

  GroupRightsTransferNoticication({
    this.group,
    this.opUser,
    this.newGroupOwner,
  });

  GroupRightsTransferNoticication.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    newGroupOwner = json['newGroupOwner'] != null ? GroupMembersInfo.fromJson(json['newGroupOwner']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (newGroupOwner != null) {
      data['newGroupOwner'] = newGroupOwner!.toJson();
    }
    return data;
  }
}

/// Mute Member Notification
class MuteMemberNotification {
  /// Group information
  GroupInfo? group;

  /// Operator information
  GroupMembersInfo? opUser;

  /// Muted member information
  GroupMembersInfo? mutedUser;

  /// Mute duration in seconds
  int? mutedSeconds;

  MuteMemberNotification({
    this.group,
    this.opUser,
    this.mutedUser,
    this.mutedSeconds,
  });

  MuteMemberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    mutedUser = json['mutedUser'] != null ? GroupMembersInfo.fromJson(json['mutedUser']) : null;
    mutedSeconds = json['mutedSeconds'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (mutedUser != null) {
      data['mutedUser'] = mutedUser!.toJson();
    }
    data['mutedSeconds'] = mutedSeconds;
    return data;
  }
}

/// Burn After Reading Notification
class BurnAfterReadingNotification {
  /// Receiver
  String? recvID;

  /// Sender
  String? sendID;

  /// Whether enabled
  bool? isPrivate;

  BurnAfterReadingNotification({this.recvID, this.sendID, this.isPrivate});

  BurnAfterReadingNotification.fromJson(Map<String, dynamic> json) {
    recvID = json['recvID'];
    sendID = json['sendID'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['recvID'] = recvID;
    data['sendID'] = sendID;
    data['isPrivate'] = isPrivate;
    return data;
  }
}

/// Group Member Information Changed Notification
class GroupMemberInfoChangedNotification {
  /// Group information
  GroupInfo? group;

  /// Operator information
  GroupMembersInfo? opUser;

  /// Member with changed information
  GroupMembersInfo? changedUser;

  GroupMemberInfoChangedNotification({
    this.group,
    this.opUser,
    this.changedUser,
  });

  GroupMemberInfoChangedNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    changedUser = json['changedUser'] != null ? GroupMembersInfo.fromJson(json['changedUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (changedUser != null) {
      data['changedUser'] = changedUser!.toJson();
    }
    return data;
  }
}