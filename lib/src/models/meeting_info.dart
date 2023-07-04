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
  String? roomID;
  String? meetingName;
  String? ex;
  String? hostUserID;
  List<String>? inviteeUserIDList; //邀请列表
  int? createTime;
  int? startTime;
  int? endTime;
  bool? participantCanUnmuteSelf; //成员是否能自己解除禁言
  bool? participantCanEnableVideo; //成员是否能开启视频
  bool? onlyHostInviteUser; //仅主持人可邀请用户
  bool? onlyHostShareScreen; //仅主持人可共享屏幕
  bool? joinDisableMicrophone; //加入是否默认关麦克风
  bool? joinDisableVideo; //加入是否默认关视频
  bool? isMuteAllVideo; // 是否全员禁用视频
  bool? isMuteAllMicrophone; // 是否全员禁用麦克风
  List<String>? canScreenUserIDList; // 可共享屏幕的ID列表
  List<String>? disableMicrophoneUserIDList; // 当前被禁言麦克风的id列表
  List<String>? disableVideoUserIDList; // 当前禁用视频流的ID列表
  List<String>? pinedUserIDList; // 置顶ID列表
  List<String>? beWatchedUserIDList; // 正在被观看用户列表

  MeetingInfo({
    this.roomID,
    this.meetingName,
    this.ex,
    this.hostUserID,
    this.inviteeUserIDList,
    this.createTime,
    this.startTime,
    this.endTime,
    this.participantCanUnmuteSelf,
    this.participantCanEnableVideo,
    this.onlyHostInviteUser,
    this.onlyHostShareScreen,
    this.joinDisableMicrophone,
    this.joinDisableVideo,
    this.isMuteAllVideo,
    this.isMuteAllMicrophone,
    this.canScreenUserIDList,
    this.disableMicrophoneUserIDList,
    this.disableVideoUserIDList,
    this.pinedUserIDList,
    this.beWatchedUserIDList,
  });

  MeetingInfo.fromJson(Map<String, dynamic> json) {
    roomID = json['roomID'];
    meetingName = json['meetingName'];
    ex = json['ex'];
    hostUserID = json['hostUserID'];
    inviteeUserIDList = json['inviteeUserIDList'] == null
        ? null
        : (json['inviteeUserIDList'] as List).cast<String>();
    createTime = json['createTime'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    participantCanUnmuteSelf = json['participantCanUnmuteSelf'];
    participantCanEnableVideo = json['participantCanEnableVideo'];
    onlyHostInviteUser = json['onlyHostInviteUser'];
    onlyHostShareScreen = json['onlyHostShareScreen'];
    joinDisableMicrophone = json['joinDisableMicrophone'];
    joinDisableVideo = json['joinDisableVideo'];
    isMuteAllVideo = json['isMuteAllVideo'];
    isMuteAllMicrophone = json['isMuteAllMicrophone'];
    canScreenUserIDList = json['canScreenUserIDList'] == null
        ? null
        : (json['canScreenUserIDList'] as List).cast<String>();
    disableMicrophoneUserIDList = json['disableMicrophoneUserIDList'] == null
        ? null
        : (json['disableMicrophoneUserIDList'] as List).cast<String>();
    disableVideoUserIDList = json['disableVideoUserIDList'] == null
        ? null
        : (json['disableVideoUserIDList'] as List).cast<String>();
    pinedUserIDList = json['pinedUserIDList'] == null
        ? null
        : (json['pinedUserIDList'] as List).cast<String>();
    beWatchedUserIDList = json['beWatchedUserIDList'] == null
        ? null
        : (json['beWatchedUserIDList'] as List).cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomID'] = roomID;
    data['meetingName'] = meetingName;
    data['ex'] = ex;
    data['hostUserID'] = hostUserID;
    data['inviteeUserIDList'] = inviteeUserIDList;
    data['createTime'] = createTime;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['participantCanUnmuteSelf'] = participantCanUnmuteSelf;
    data['participantCanEnableVideo'] = participantCanEnableVideo;
    data['onlyHostInviteUser'] = onlyHostInviteUser;
    data['onlyHostShareScreen'] = onlyHostShareScreen;
    data['joinDisableMicrophone'] = joinDisableMicrophone;
    data['joinDisableVideo'] = joinDisableVideo;
    data['isMuteAllVideo'] = isMuteAllVideo;
    data['isMuteAllMicrophone'] = isMuteAllMicrophone;
    data['canScreenUserIDList'] = canScreenUserIDList;
    data['disableMicrophoneUserIDList'] = disableMicrophoneUserIDList;
    data['disableVideoUserIDList'] = disableVideoUserIDList;
    data['pinedUserIDList'] = pinedUserIDList;
    data['beWatchedUserIDList'] = beWatchedUserIDList;
    return data;
  }
}

class MeetingStreamEvent {
  String? roomID;
  String? streamType;
  bool? mute;

  MeetingStreamEvent({this.roomID, this.streamType, this.mute});

  MeetingStreamEvent.fromJson(Map<String, dynamic> json) {
    roomID = json['roomID'];
    streamType = json['streamType'];
    mute = json['mute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomID'] = this.roomID;
    data['streamType'] = this.streamType;
    data['mute'] = this.mute;
    return data;
  }
}
