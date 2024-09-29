import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Group Information
class GroupInfo {
  /// Group ID
  String groupID;

  /// Group Name
  String? groupName;

  /// Group Announcement
  String? notification;

  /// Group Introduction
  String? introduction;

  /// Group Avatar
  String? faceURL;

  /// Owner's ID
  String? ownerUserID;

  /// Creation Time
  int? createTime;

  /// Number of Group Members
  int? memberCount;

  /// Group Status: 0 - Normal, 1 - Blocked, 2 - Dissolved, 3 - Muted
  int? status;

  /// Creator's ID
  String? creatorUserID;

  /// Group Type [GroupType]
  int? groupType;

  /// Extra Information
  String? ex;

  /// Entry Verification Method [GroupVerification]
  int? needVerification;

  /// Don't Allow Access to Member Information via the Group: 0 - Disabled, 1 - Enabled
  int? lookMemberInfo;

  /// Don't Allow Adding Friends via the Group: 0 - Disabled, 1 - Enabled
  int? applyMemberFriend;

  /// Notification Update Time
  int? notificationUpdateTime;

  /// Notification Initiator
  String? notificationUserID;

  GroupInfo({
    required this.groupID,
    this.groupName,
    this.notification,
    this.introduction,
    this.faceURL,
    this.ownerUserID,
    this.createTime,
    this.memberCount,
    this.status,
    this.creatorUserID,
    this.groupType,
    this.ex,
    this.needVerification,
    this.lookMemberInfo,
    this.applyMemberFriend,
    this.notificationUpdateTime,
    this.notificationUserID,
  });

  GroupInfo.fromJson(Map<String, dynamic> json) : groupID = json['groupID'] {
    groupName = json['groupName'];
    notification = json['notification'];
    introduction = json['introduction'];
    faceURL = json['faceURL'];
    ownerUserID = json['ownerUserID'];
    createTime = json['createTime'];
    memberCount = json['memberCount'];
    status = json['status'];
    creatorUserID = json['creatorUserID'];
    groupType = json['groupType'];
    ex = json['ex'];
    needVerification = json['needVerification'];
    lookMemberInfo = json['lookMemberInfo'];
    applyMemberFriend = json['applyMemberFriend'];
    notificationUpdateTime = json['notificationUpdateTime'];
    notificationUserID = json['notificationUserID'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['notification'] = this.notification;
    data['introduction'] = this.introduction;
    data['faceURL'] = this.faceURL;
    data['ownerUserID'] = this.ownerUserID;
    data['createTime'] = this.createTime;
    data['memberCount'] = this.memberCount;
    data['status'] = this.status;
    data['creatorUserID'] = this.creatorUserID;
    data['groupType'] = this.groupType;
    data['ex'] = this.ex;
    data['needVerification'] = this.needVerification;
    data['lookMemberInfo'] = this.lookMemberInfo;
    data['applyMemberFriend'] = this.applyMemberFriend;
    data['notificationUpdateTime'] = this.notificationUpdateTime;
    data['notificationUserID'] = this.notificationUserID;
    return data;
  }

  /// Corresponding Conversation Type for Group Type
  int get sessionType => groupType == GroupType.general ? ConversationType.group : ConversationType.superGroup;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GroupInfo && runtimeType == other.runtimeType && groupID == other.groupID;

  @override
  int get hashCode => groupID.hashCode;
}

/// Group Member Information
class GroupMembersInfo {
  /// Group ID
  String? groupID;

  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Avatar
  String? faceURL;

  /// Role [GroupRoleLevel]
  int? roleLevel;

  /// Join Time
  int? joinTime;

  /// Entry Source: 2 - Invited, 3 - Searched, 4 - QR Code
  int? joinSource;

  /// Operator's ID
  String? operatorUserID;

  /// Extra Information
  String? ex;

  /// Mute End Time (seconds)
  int? muteEndTime;

  /// Application Manager Level
  int? appManagerLevel;

  /// Inviter's User ID
  String? inviterUserID;

  GroupMembersInfo({
    this.groupID,
    this.userID,
    this.roleLevel,
    this.joinTime,
    this.nickname,
    this.faceURL,
    this.ex,
    this.joinSource,
    this.operatorUserID,
    this.muteEndTime,
    this.appManagerLevel,
    this.inviterUserID,
  });

  GroupMembersInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    userID = json['userID'];
    roleLevel = json['roleLevel'];
    joinTime = json['joinTime'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ex = json['ex'];
    joinSource = json['joinSource'];
    operatorUserID = json['operatorUserID'];
    muteEndTime = json['muteEndTime'];
    appManagerLevel = json['appManagerLevel'];
    inviterUserID = json['inviterUserID'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['userID'] = this.userID;
    data['roleLevel'] = this.roleLevel;
    data['joinTime'] = this.joinTime;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['ex'] = this.ex;
    data['joinSource'] = this.joinSource;
    data['operatorUserID'] = this.operatorUserID;
    data['muteEndTime'] = this.muteEndTime;
    data['appManagerLevel'] = this.appManagerLevel;
    data['inviterUserID'] = this.inviterUserID;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupMembersInfo &&
          runtimeType == other.runtimeType &&
          groupID == other.groupID &&
          userID == other.userID;

  @override
  int get hashCode => groupID.hashCode ^ userID.hashCode;
}

/// Group Member Role
class GroupMemberRole {
  /// User ID
  String? userID;

  /// [GroupRoleLevel] 1: Normal Member, 2: Group Owner, 3: Administrator
  int? roleLevel;

  GroupMemberRole({this.userID, this.roleLevel = 1});

  GroupMemberRole.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    roleLevel = json['roleLevel'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['roleLevel'] = this.roleLevel;
    return data;
  }
}

/// Group Application Information
class GroupApplicationInfo {
  /// Group ID
  String? groupID;

  /// Group Nickname
  String? groupName;

  /// Group Announcement
  String? notification;

  /// Group Introduction
  String? introduction;

  /// Group Avatar
  String? groupFaceURL;

  /// Group Creation Time
  int? createTime;

  /// Group Status
  int? status;

  /// Creator's ID
  String? creatorUserID;

  /// Group Type
  int? groupType;

  /// Owner's ID
  String? ownerUserID;

  /// Member Count
  int? memberCount;

  /// User ID Initiating the Group Join Request
  String? userID;

  /// User's Nickname Initiating the Group Join Request
  String? nickname;

  /// User's Avatar Initiating the Group Join Request
  String? userFaceURL;

  /// User's Gender Initiating the Group Join Request
  int? gender;

  /// Handling Result: -1 - Rejected, 1 - Accepted
  int? handleResult;

  /// Request Description
  String? reqMsg;

  /// Handling Result Description
  String? handledMsg;

  /// Request Time
  int? reqTime;

  /// Handler User ID
  String? handleUserID;

  /// Handling Time
  int? handledTime;

  /// Extra Information
  String? ex;

  /// Join Source: 2 - Invited, 3 - Searched, 4 - QR Code
  int? joinSource;

  /// Inviting User's ID
  String? inviterUserID;

  GroupApplicationInfo({
    this.groupID,
    this.groupName,
    this.notification,
    this.introduction,
    this.groupFaceURL,
    this.createTime,
    this.status,
    this.creatorUserID,
    this.groupType,
    this.ownerUserID,
    this.memberCount,
    this.userID,
    this.nickname,
    this.userFaceURL,
    this.gender,
    this.handleResult,
    this.reqMsg,
    this.handledMsg,
    this.reqTime,
    this.handleUserID,
    this.handledTime,
    this.ex,
    this.inviterUserID,
    this.joinSource,
  });

  GroupApplicationInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    groupName = json['groupName'];
    notification = json['notification'];
    introduction = json['introduction'];
    groupFaceURL = json['groupFaceURL'];
    createTime = json['createTime'];
    status = json['status'];
    creatorUserID = json['creatorUserID'];
    groupType = json['groupType'];
    ownerUserID = json['ownerUserID'];
    memberCount = json['memberCount'];
    userID = json['userID'];
    nickname = json['nickname'];
    userFaceURL = json['userFaceURL'];
    gender = json['gender'];
    handleResult = json['handleResult'];
    reqMsg = json['reqMsg'];
    handledMsg = json['handledMsg'];
    reqTime = json['reqTime'];
    handleUserID = json['handleUserID'];
    handledTime = json['handledTime'];
    ex = json['ex'];
    inviterUserID = json['inviterUserID'];
    joinSource = json['joinSource'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['notification'] = this.notification;
    data['introduction'] = this.introduction;
    data['groupFaceURL'] = this.groupFaceURL;
    data['createTime'] = this.createTime;
    data['status'] = this.status;
    data['creatorUserID'] = this.creatorUserID;
    data['groupType'] = this.groupType;
    data['ownerUserID'] = this.ownerUserID;
    data['memberCount'] = this.memberCount;
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['userFaceURL'] = this.userFaceURL;
    data['gender'] = this.gender;
    data['handleResult'] = this.handleResult;
    data['reqMsg'] = this.reqMsg;
    data['handledMsg'] = this.handledMsg;
    data['reqTime'] = this.reqTime;
    data['handleUserID'] = this.handleUserID;
    data['handledTime'] = this.handledTime;
    data['ex'] = this.ex;
    data['inviterUserID'] = this.inviterUserID;
    data['joinSource'] = this.joinSource;
    return data;
  }
}

/// Group Invitation Result
class GroupInviteResult {
  String? userID;
  int? result;

  GroupInviteResult({this.userID, this.result});

  GroupInviteResult.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['result'] = this.result;
    return data;
  }
}
