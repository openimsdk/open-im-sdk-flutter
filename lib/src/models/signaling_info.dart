import 'dart:io';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SignalingInfo {
  /// 操作者
  String? opUserID;

  /// 邀请信息
  InvitationInfo? invitation;

  /// 离线显示内容
  OfflinePushInfo? offlinePushInfo;

  SignalingInfo({
    this.opUserID,
    this.invitation,
    this.offlinePushInfo,
  });

  SignalingInfo.fromJson(Map<String, dynamic> json) {
    opUserID = json['opUserID'];
    invitation = json['invitation'] == null
        ? null
        : InvitationInfo.fromJson(json['invitation']);
    offlinePushInfo = json['offlinePushInfo'] == null
        ? null
        : OfflinePushInfo.fromJson(json['offlinePushInfo']);
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['opUserID'] = this.opUserID;
    data['invitation'] = this.invitation?.toJson();
    data['offlinePushInfo'] = this.offlinePushInfo?.toJson();
    return data;
  }
}

class InvitationInfo {
  /// 邀请者UserID
  String? inviterUserID;

  /// 被邀请者UserID列表，如果是单聊只有一个元素
  List<String>? inviteeUserIDList;

  /// 如果是单聊，为""
  String? groupID;

  /// 房间ID，必须唯一，可以不设置。
  String? roomID;

  /// 邀请超时时间（秒）
  int? timeout;

  /// 发起时间
  int? initiateTime;

  /// video 或者 audio
  String? mediaType;

  /// [ConversationType]1为单聊，2为群聊
  int? sessionType;

  /// 平台[Platform]
  int? platformID;

  InvitationInfo(
      {this.inviterUserID,
      this.inviteeUserIDList,
      this.groupID,
      this.roomID,
      this.timeout,
      this.initiateTime,
      this.mediaType,
      this.sessionType,
      this.platformID});

  InvitationInfo.fromJson(Map<String, dynamic> json) {
    inviterUserID = json['inviterUserID'];
    inviteeUserIDList = json['inviteeUserIDList'].cast<String>();
    groupID = json['groupID'];
    roomID = json['roomID'];
    timeout = json['timeout'];
    initiateTime = json['initiateTime'];
    mediaType = json['mediaType'];
    sessionType = json['sessionType'];
    platformID = json['platformID'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['inviterUserID'] = this.inviterUserID;
    data['inviteeUserIDList'] = this.inviteeUserIDList;
    data['groupID'] = this.groupID;
    data['roomID'] = this.roomID;
    data['timeout'] = this.timeout;
    data['initiateTime'] = this.initiateTime;
    data['mediaType'] = this.mediaType;
    data['sessionType'] = this.sessionType;
    data['platformID'] = this.platformID;
    return data;
  }
}

/// 信令凭证
class SignalingCertificate {
  /// 登录token
  String? token;

  /// 房间id
  String? roomID;

  /// 服务器地址
  String? liveURL;

  SignalingCertificate({this.token, this.roomID, this.liveURL});

  SignalingCertificate.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roomID = json['roomID'];
    liveURL = json['liveURL'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['token'] = this.token;
    data['roomID'] = this.roomID;
    data['liveURL'] = this.liveURL;
    return data;
  }
}
