class GroupInfo {
  String groupID;
  String? groupName;
  String? notification;
  String? introduction;
  String? faceURL;
  String? ownerUserID;
  int? createTime;
  int? memberCount;

  /// ok = 0 blocked = 1 Dismissed = 2 Muted  = 3
  int? status;
  String? creatorUserID;
  int? groupType;
  String? ex;

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
  });

  GroupInfo.fromJson(Map<String, dynamic> json) : groupID = json['groupID'] {
    /*groupID = json['groupID'];*/
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
    return data;
  }
}

class GroupMembersInfo {
  String? groupID;
  String? userID;
  String? nickname;
  String? faceURL;
  int? roleLevel;
  int? joinTime;
  int? joinSource;
  String? operatorUserID;
  String? ext;
  int? muteEndTime;
  int? appMangerLevel;

  GroupMembersInfo({
    this.groupID,
    this.userID,
    this.roleLevel,
    this.joinTime,
    this.nickname,
    this.faceURL,
    this.ext,
    this.joinSource,
    this.operatorUserID,
    this.muteEndTime,
    this.appMangerLevel,
  });

  GroupMembersInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    userID = json['userID'];
    roleLevel = json['roleLevel'];
    joinTime = json['joinTime'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ext = json['ext'];
    joinSource = json['joinSource'];
    operatorUserID = json['operatorUserID'];
    muteEndTime = json['muteEndTime'];
    appMangerLevel = json['appMangerLevel'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['userID'] = this.userID;
    data['roleLevel'] = this.roleLevel;
    data['joinTime'] = this.joinTime;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['ext'] = this.ext;
    data['joinSource'] = this.joinSource;
    data['operatorUserID'] = this.operatorUserID;
    data['muteEndTime'] = this.muteEndTime;
    data['appMangerLevel'] = this.appMangerLevel;
    return data;
  }
}

class GroupMemberRole {
  String? userID;

  /// 1 ordinary member, 2 group owners, 3 administrators
  /// 1普通成员, 2群主，3管理员
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

class GroupApplicationInfo {
  String? groupID;
  String? groupName;
  String? notification;
  String? introduction;
  String? groupFaceURL;
  int? createTime;
  int? status;
  String? creatorUserID;
  int? groupType;
  String? ownerUserID;
  int? memberCount;
  String? userID;
  String? nickname;
  String? userFaceURL;
  int? gender;

  /// REFUSE = -1, AGREE = 1
  /// -1：拒绝，1：同意
  int? handleResult;
  String? reqMsg;
  String? handledMsg;
  int? reqTime;
  String? handleUserID;
  int? handledTime;
  String? ex;

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
    return data;
  }
}

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
