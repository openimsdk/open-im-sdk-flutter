import '../../flutter_openim_sdk.dart';

/// OA notification
/// oa 通知
class OANotification {
  String? notificationName;
  String? notificationFaceURL;
  int? notificationType;
  String? text;
  String? externalUrl;

  /// Notification Mix Type
  /// 0: Plain text notification
  /// 1: Text+picture notification
  /// 2: Text+video notification
  /// 3: Text+file notification
  /// 0：纯文字通知 1：文字+图片通知 2：文字+视频通知 3：文字+文件通知
  int? mixType;
  PictureElem? pictureElem;
  SoundElem? soundElem;
  VideoElem? videoElem;
  FileElem? fileElem;
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
    pictureElem = json['pictureElem'] != null
        ? PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem = json['soundElem'] != null
        ? SoundElem.fromJson(json['soundElem'])
        : null;
    videoElem = json['videoElem'] != null
        ? VideoElem.fromJson(json['videoElem'])
        : null;
    fileElem =
        json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['notificationName'] = this.notificationName;
    data['notificationFaceURL'] = this.notificationFaceURL;
    data['notificationType'] = this.notificationType;
    data['text'] = this.text;
    data['externalUrl'] = this.externalUrl;
    data['mixType'] = this.mixType;
    if (this.pictureElem != null) {
      data['pictureElem'] = this.pictureElem!.toJson();
    }
    if (this.soundElem != null) {
      data['soundElem'] = this.soundElem!.toJson();
    }
    if (this.videoElem != null) {
      data['videoElem'] = this.videoElem!.toJson();
    }
    if (this.fileElem != null) {
      data['fileElem'] = this.fileElem!.toJson();
    }
    data['ex'] = this.ex;
    return data;
  }
}

/// Group common notification
class GroupNotification {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  GroupMembersInfo? groupOwnerUser;
  List<GroupMembersInfo>? memberList;

  GroupNotification({
    this.group,
    this.opUser,
    this.groupOwnerUser,
    this.memberList,
  });

  GroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    groupOwnerUser = json['groupOwnerUser'] != null
        ? GroupMembersInfo.fromJson(json['groupOwnerUser'])
        : null;
    if (json['memberList'] != null) {
      memberList = <GroupMembersInfo>[];
      json['memberList'].forEach((v) {
        memberList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.groupOwnerUser != null) {
      data['groupOwnerUser'] = this.groupOwnerUser!.toJson();
    }
    if (this.memberList != null) {
      data['memberList'] = this.memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// User is invited to the group notification
/// 用户被邀请进群通知
class InvitedJoinGroupNotification {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  List<GroupMembersInfo>? invitedUserList;

  InvitedJoinGroupNotification({this.group, this.opUser, this.invitedUserList});

  InvitedJoinGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    if (json['invitedUserList'] != null) {
      invitedUserList = <GroupMembersInfo>[];
      json['invitedUserList'].forEach((v) {
        invitedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.invitedUserList != null) {
      data['invitedUserList'] =
          this.invitedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Group kicked member notification
/// 组踢出成员通知
class KickedGroupMemeberNotification {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  List<GroupMembersInfo>? kickedUserList;

  KickedGroupMemeberNotification(
      {this.group, this.opUser, this.kickedUserList});

  KickedGroupMemeberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    if (json['kickedUserList'] != null) {
      kickedUserList = <GroupMembersInfo>[];
      json['kickedUserList'].forEach((v) {
        kickedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.kickedUserList != null) {
      data['kickedUserList'] =
          this.kickedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Exit group notification
/// 退出群通知
class QuitGroupNotification {
  GroupInfo? group;
  GroupMembersInfo? quitUser;

  QuitGroupNotification({this.group, this.quitUser});

  QuitGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    quitUser = json['quitUser'] != null
        ? GroupMembersInfo.fromJson(json['quitUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.quitUser != null) {
      data['quitUser'] = this.quitUser!.toJson();
    }
    return data;
  }
}

/// Enter group notification
/// 进群通知
class EnterGroupNotification {
  GroupInfo? group;
  GroupMembersInfo? entrantUser;

  EnterGroupNotification({this.group, this.entrantUser});

  EnterGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    entrantUser = json['entrantUser'] != null
        ? GroupMembersInfo.fromJson(json['entrantUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.entrantUser != null) {
      data['quitUser'] = this.entrantUser!.toJson();
    }
    return data;
  }
}

/// Group rights transfer noticication
/// 群权转让通知
class GroupRightsTransferNoticication {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  GroupMembersInfo? newGroupOwner;

  GroupRightsTransferNoticication({
    this.group,
    this.opUser,
    this.newGroupOwner,
  });

  GroupRightsTransferNoticication.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    newGroupOwner = json['newGroupOwner'] != null
        ? GroupMembersInfo.fromJson(json['newGroupOwner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.newGroupOwner != null) {
      data['newGroupOwner'] = this.newGroupOwner!.toJson();
    }
    return data;
  }
}

/// Mute member notification
/// 禁言成员通知
class MuteMemberNotification {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  GroupMembersInfo? mutedUser;
  int? mutedSeconds;

  MuteMemberNotification({
    this.group,
    this.opUser,
    this.mutedUser,
    this.mutedSeconds,
  });

  MuteMemberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    mutedUser = json['mutedUser'] != null
        ? GroupMembersInfo.fromJson(json['mutedUser'])
        : null;
    mutedSeconds = json['mutedSeconds'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.mutedUser != null) {
      data['mutedUser'] = this.mutedUser!.toJson();
    }
    data['mutedSeconds'] = this.mutedSeconds;
    return data;
  }
}

/// Burn after reading notification
/// 阅后即焚通知
class BurnAfterReadingNotification {
  String? recvID;
  String? sendID;
  bool? isPrivate;

  BurnAfterReadingNotification({this.recvID, this.sendID, this.isPrivate});

  BurnAfterReadingNotification.fromJson(Map<String, dynamic> json) {
    recvID = json['recvID'];
    sendID = json['sendID'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['recvID'] = this.recvID;
    data['sendID'] = this.sendID;
    data['isPrivate'] = this.isPrivate;
    return data;
  }
}

/// Group member info changed notification
/// 禁言成员通知
class GroupMemberInfoChangedNotification {
  GroupInfo? group;
  GroupMembersInfo? opUser;
  GroupMembersInfo? changedUser;

  GroupMemberInfoChangedNotification({
    this.group,
    this.opUser,
    this.changedUser,
  });

  GroupMemberInfoChangedNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null
        ? GroupMembersInfo.fromJson(json['opUser'])
        : null;
    changedUser = json['changedUser'] != null
        ? GroupMembersInfo.fromJson(json['changedUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    if (this.opUser != null) {
      data['opUser'] = this.opUser!.toJson();
    }
    if (this.changedUser != null) {
      data['changedUser'] = this.changedUser!.toJson();
    }
    return data;
  }
}
