import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SignalingInfo {
  String? opUserID;
  InvitationInfo? invitation;
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
  String? inviterUserID; //邀请者UserID
  List<String>? inviteeUserIDList; //被邀请者UserID列表，如果是单聊只有一个元素
  String? groupID; //如果是单聊，为""
  String? roomID; //房间ID，必须唯一，可以不设置。
  int? timeout; //邀请超时时间（秒）
  String? mediaType; //video 或者audio
  int? sessionType; //1为单聊，2为群聊
  int? platformID; //和之前定义一致

  InvitationInfo(
      {this.inviterUserID,
      this.inviteeUserIDList,
      this.groupID,
      this.roomID,
      this.timeout,
      this.mediaType,
      this.sessionType,
      this.platformID});

  InvitationInfo.fromJson(Map<String, dynamic> json) {
    inviterUserID = json['inviterUserID'];
    inviteeUserIDList = json['inviteeUserIDList'].cast<String>();
    groupID = json['groupID'];
    roomID = json['roomID'];
    timeout = json['timeout'];
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
    data['mediaType'] = this.mediaType;
    data['sessionType'] = this.sessionType;
    data['platformID'] = this.platformID;
    return data;
  }
}

class SignalingCertificate {
  String? token;
  String? roomID;
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
