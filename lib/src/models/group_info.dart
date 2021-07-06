class GroupInfo {
  String? groupID;
  String? groupName;
  String? notification;
  String? introduction;
  String? faceUrl;
  String? ownerId;
  int? createTime;
  int? memberCount;

  GroupInfo(
      {this.groupID,
      this.groupName,
      this.notification,
      this.introduction,
      this.faceUrl,
      this.ownerId,
      this.createTime,
      this.memberCount});

  GroupInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    groupName = json['groupName'];
    notification = json['notification'];
    introduction = json['introduction'];
    faceUrl = json['faceUrl'];
    ownerId = json['ownerId'];
    createTime = json['createTime'];
    memberCount = json['memberCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['notification'] = this.notification;
    data['introduction'] = this.introduction;
    data['faceUrl'] = this.faceUrl;
    data['ownerId'] = this.ownerId;
    data['createTime'] = this.createTime;
    data['memberCount'] = this.memberCount;
    return data;
  }
}

class GroupMembersList {
  int? nextSeq;
  List<GroupMembersInfo>? data;

  GroupMembersList({this.nextSeq, this.data});

  GroupMembersList.fromJson(Map<String, dynamic> json) {
    nextSeq = json['nextSeq'];
    if (json['data'] is List) {
      data = (json['data'] as List)
          .map((e) => GroupMembersInfo.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextSeq'] = this.nextSeq;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupMembersInfo {
  String? groupID;
  String? userId;
  int? role;
  int? joinTime;
  String? nickName;
  String? faceUrl;

  GroupMembersInfo(
      {this.groupID,
      this.userId,
      this.role,
      this.joinTime,
      this.nickName,
      this.faceUrl});

  GroupMembersInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    userId = json['userId'];
    role = json['role'];
    joinTime = json['joinTime'];
    nickName = json['nickName'];
    faceUrl = json['faceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['joinTime'] = this.joinTime;
    data['nickName'] = this.nickName;
    data['faceUrl'] = this.faceUrl;
    return data;
  }
}

class GroupInviteResult {
  String? uid;
  int? result;

  GroupInviteResult({this.uid, this.result});

  GroupInviteResult.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['result'] = this.result;
    return data;
  }
}

class GroupMemberRole {
  String? uid;
  int? setRole; //0普通成员，2管理员

  GroupMemberRole({this.uid, this.setRole});

  GroupMemberRole.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    setRole = json['setRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['setRole'] = this.setRole;
    return data;
  }
}

class GroupApplicationInfo {
  String? groupID;
  String? fromUserID;
  String? fromUserNickName;
  String? fromUserFaceUrl;
  String? toUserID;
  int? addTime;
  String? requestMsg;
  String? handledMsg;
  int? type;
  int? handleStatus;
  int? handleResult;

  GroupApplicationInfo(
      {this.groupID,
      this.fromUserID,
      this.fromUserNickName,
      this.fromUserFaceUrl,
      this.toUserID,
      this.addTime,
      this.requestMsg,
      this.handledMsg,
      this.type,
      this.handleStatus,
      this.handleResult});

  GroupApplicationInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    fromUserID = json['fromUserID'];
    fromUserNickName = json['fromUserNickName'];
    fromUserFaceUrl = json['fromUserFaceUrl'];
    toUserID = json['toUserID'];
    addTime = json['addTime'];
    requestMsg = json['requestMsg'];
    handledMsg = json['handledMsg'];
    type = json['type'];
    handleStatus = json['handleStatus'];
    handleResult = json['handleResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupID'] = this.groupID;
    data['fromUserID'] = this.fromUserID;
    data['fromUserNickName'] = this.fromUserNickName;
    data['fromUserFaceUrl'] = this.fromUserFaceUrl;
    data['toUserID'] = this.toUserID;
    data['addTime'] = this.addTime;
    data['requestMsg'] = this.requestMsg;
    data['handledMsg'] = this.handledMsg;
    data['type'] = this.type;
    data['handleStatus'] = this.handleStatus;
    data['handleResult'] = this.handleResult;
    return data;
  }
}

class GroupApplicationList {
  int? count;
  List<GroupApplicationInfo>? user;

  GroupApplicationList({this.count, this.user});

  GroupApplicationList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['user'] is List) {
      user = (json['user'] as List)
          .map((e) => GroupApplicationInfo.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
