class MeetingInfoList {
  List<MeetingInfo>? meetingInfoList;

  MeetingInfoList({this.meetingInfoList});

  MeetingInfoList.fromJson(Map<String, dynamic> json) {
    if (json['meetingInfoList'] != null) {
      meetingInfoList = <MeetingInfo>[];
      json['meetingInfoList'].forEach((v) {
        meetingInfoList!.add(MeetingInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.meetingInfoList != null) {
      data['meetingInfoList'] =
          this.meetingInfoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeetingInfo {
  String? meetingID;
  String? meetingName;
  String? hostUserID;
  int? createTime;
  int? startTime;
  int? endTime;
  bool? participantCanEnableVideo;
  bool? onlyHostInviteUser;
  bool? joinDisableVideo;
  bool? participantCanUnmuteSelf;
  bool? isMuteAllMicrophone;
  List<String>? inviteeUserIDList;

  MeetingInfo(
      {this.meetingID,
      this.meetingName,
      this.hostUserID,
      this.createTime,
      this.startTime,
      this.endTime,
      this.participantCanEnableVideo,
      this.onlyHostInviteUser,
      this.joinDisableVideo,
      this.participantCanUnmuteSelf,
      this.isMuteAllMicrophone,
      this.inviteeUserIDList});

  MeetingInfo.fromJson(Map<String, dynamic> json) {
    meetingID = json['meetingID'];
    meetingName = json['meetingName'];
    hostUserID = json['hostUserID'];
    createTime = json['createTime'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    participantCanEnableVideo = json['participantCanEnableVideo'];
    onlyHostInviteUser = json['onlyHostInviteUser'];
    joinDisableVideo = json['joinDisableVideo'];
    participantCanUnmuteSelf = json['participantCanUnmuteSelf'];
    isMuteAllMicrophone = json['isMuteAllMicrophone'];
    inviteeUserIDList = json['inviteeUserIDList']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['meetingID'] = this.meetingID;
    data['meetingName'] = this.meetingName;
    data['hostUserID'] = this.hostUserID;
    data['createTime'] = this.createTime;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['participantCanEnableVideo'] = this.participantCanEnableVideo;
    data['onlyHostInviteUser'] = this.onlyHostInviteUser;
    data['joinDisableVideo'] = this.joinDisableVideo;
    data['participantCanUnmuteSelf'] = this.participantCanUnmuteSelf;
    data['isMuteAllMicrophone'] = this.isMuteAllMicrophone;
    data['inviteeUserIDList'] = this.inviteeUserIDList;
    return data;
  }
}

class MeetingStreamEvent {
  String? meetingID;
  String? streamType;
  bool? mute;

  MeetingStreamEvent({this.meetingID, this.streamType, this.mute});

  MeetingStreamEvent.fromJson(Map<String, dynamic> json) {
    meetingID = json['meetingID'];
    streamType = json['streamType'];
    mute = json['mute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meetingID'] = this.meetingID;
    data['streamType'] = this.streamType;
    data['mute'] = this.mute;
    return data;
  }
}
