import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 群信息
class GroupInfo {
  /// 群ID
  String groupID;

  /// 群名
  String? groupName;

  /// 群公告
  String? notification;

  /// 群简介
  String? introduction;

  /// 群头像
  String? faceURL;

  /// 拥有者ID
  String? ownerUserID;

  /// 创建时间
  int? createTime;

  /// 群成员数
  int? memberCount;

  /// 群状态：0正常，1被封，2解散，3禁言
  int? status;

  /// 创建者ID
  String? creatorUserID;

  /// 群类型[GroupType]
  int? groupType;

  /// 扩展字段
  String? ex;

  /// 进群验证方式[GroupVerification]
  int? needVerification;

  /// 不允许通过群获取成员资料 0：关闭，1：打开
  int? lookMemberInfo;

  /// 不允许通过群添加好友 0：关闭，1：打开
  int? applyMemberFriend;

  /// 通知更新时间
  int? notificationUpdateTime;

  /// 通知发起人
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

  /// 群类型对应的会话类型
  int get sessionType => groupType == GroupType.general
      ? ConversationType.group
      : ConversationType.superGroup;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupInfo &&
          runtimeType == other.runtimeType &&
          groupID == other.groupID;

  @override
  int get hashCode => groupID.hashCode;
}

/// 群成员信息
class GroupMembersInfo {
  /// 群id
  String? groupID;

  /// 用户id
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 角色[GroupRoleLevel]
  int? roleLevel;

  /// 加入时间
  int? joinTime;

  /// 入群方式 2：邀请加入 3：搜索加入 4：通过二维码加入
  int? joinSource;

  /// 操作者id
  String? operatorUserID;

  /// 扩展字段
  String? ex;

  /// 禁言时间s
  int? muteEndTime;

  ///
  int? appMangerLevel;

  /// 邀请人id
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
    this.appMangerLevel,
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
    appMangerLevel = json['appMangerLevel'];
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
    data['appMangerLevel'] = this.appMangerLevel;
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

/// 群成员角色
class GroupMemberRole {
  /// 用户ID
  String? userID;

  /// [GroupRoleLevel] 1普通成员, 2群主，3管理员
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

/// 群申请信息
class GroupApplicationInfo {
  /// 群ID
  String? groupID;

  /// 群昵称
  String? groupName;

  /// 群公告
  String? notification;

  /// 群介绍
  String? introduction;

  /// 群头像
  String? groupFaceURL;

  /// 群创建时间
  int? createTime;

  /// 群状态
  int? status;

  /// 创建者id
  String? creatorUserID;

  /// 群类型
  int? groupType;

  /// 拥有者id
  String? ownerUserID;

  /// 成员数量
  int? memberCount;

  /// 发起入群申请的用户id
  String? userID;

  /// 发起入群申请的用户昵称
  String? nickname;

  /// 发起入群申请的用户头像
  String? userFaceURL;

  /// 发起入群申请的用户性别
  int? gender;

  /// 处理结果：-1：拒绝，1：同意
  int? handleResult;

  /// 请求说明
  String? reqMsg;

  /// 处理结果说明
  String? handledMsg;

  /// 请求时间
  int? reqTime;

  /// 处理者用户ID
  String? handleUserID;

  /// 处理时间
  int? handledTime;

  /// 扩展信息
  String? ex;

  /// 2：通过邀请  3：通过搜索  4：通过二维码
  int? joinSource;

  /// 邀请进群用户ID
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
