import 'package:flutter/services.dart';

import '../../flutter_openim_sdk.dart';

class SignalingManager {
  MethodChannel _channel;
  late OnSignalingListener listener;

  SignalingManager(this._channel);

  /// 信令监听
  Future setSignalingListener(OnSignalingListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setSignalingListener', _buildParam({}));
  }

  /// 邀请个人加入音视频
  /// [info] 信令对象[SignalingInfo]
  Future<SignalingCertificate> signalingInvite({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingInvite',
              _buildParam({
                'signalingInfo': info.toJson(),
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  /// 邀请群里某些人加入音视频
  /// [info] 信令对象[SignalingInfo]
  Future<SignalingCertificate> signalingInviteInGroup({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingInviteInGroup',
              _buildParam({
                'signalingInfo': info.toJson(),
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  /// 同意某人音视频邀请
  /// [info] 信令对象[SignalingInfo]
  Future<SignalingCertificate> signalingAccept({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingAccept',
              _buildParam({
                'signalingInfo': info.toJson(),
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  /// 拒绝某人音视频邀请
  /// [info] 信令对象[SignalingInfo]
  Future<dynamic> signalingReject({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingReject',
          _buildParam({
            'signalingInfo': info.toJson(),
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 邀请者取消音视频通话
  /// [info] 信令对象[SignalingInfo]
  Future<dynamic> signalingCancel({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingCancel',
          _buildParam({
            'signalingInfo': info.toJson(),
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 挂断
  /// [info] 信令对象[SignalingInfo]
  Future<dynamic> signalingHungUp({
    required SignalingInfo info,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingHungUp',
          _buildParam({
            'signalingInfo': info.toJson(),
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 获取当前群通话信息
  /// [groupID] 当前群ID
  Future<RoomCallingInfo> signalingGetRoomByGroupID({
    required String groupID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingGetRoomByGroupID',
              _buildParam({
                'groupID': groupID,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => RoomCallingInfo.fromJson(map)));

  /// 获取进入房间的信息
  /// [roomID] 当前房间ID
  Future<SignalingCertificate> signalingGetTokenByRoomID({
    required String roomID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingGetTokenByRoomID',
              _buildParam({
                'roomID': roomID,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(
              value,
              (map) => SignalingCertificate.fromJson(
                  map..addAll({'roomID': roomID}))));

  ///  会议设置
  ///  required String roomID,
  ///  String? meetingName,
  ///  String? ex,
  ///  int startTime = 0,
  ///  int endTime = 0,
  ///  bool participantCanUnmuteSelf = true,
  ///  bool participantCanEnableVideo = true,
  ///  bool onlyHostInviteUser = true,
  ///  bool onlyHostShareScreen = true,
  ///  bool joinDisableMicrophone = true,
  ///  bool joinDisableVideo = true,
  ///  bool isMuteAllVideo = true,
  ///  bool isMuteAllMicrophone = true,
  ///  List<String> addCanScreenUserIDList = const [],
  ///  List<String> reduceCanScreenUserIDList = const [],
  ///  List<String> addDisableMicrophoneUserIDList = const [],
  ///  List<String> reduceDisableMicrophoneUserIDList = const [],
  ///  List<String> addDisableVideoUserIDList = const [],
  ///  List<String> reduceDisableVideoUserIDList = const [],
  ///  List<String> addPinedUserIDList = const [],
  ///  List<String> reducePinedUserIDList = const [],
  ///  List<String> addBeWatchedUserIDList = const [],
  ///  List<String> reduceBeWatchedUserIDList = const [],
  Future<dynamic> signalingUpdateMeetingInfo({
    required Map info,
    String? operationID,
  }) {
    assert(info['roomID'] != null);
    return _channel.invokeMethod(
        'signalingUpdateMeetingInfo',
        _buildParam({
          'info': info,
          'operationID': Utils.checkOperationID(operationID),
        }));
  }

  /// 创建会议室
  /// [meetingName] 会议主题
  /// [meetingHostUserID] 会议主持人ID
  /// [startTime] 开始时间s
  /// [meetingDuration] 会议时长s
  /// [inviteeUserIDList] 被邀请人ID列表
  /// [ex] 其他
  Future<SignalingCertificate> signalingCreateMeeting({
    required String meetingName,
    String? meetingHostUserID,
    int? startTime,
    int? meetingDuration,
    List<String> inviteeUserIDList = const [],
    String? ex,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingCreateMeeting',
              _buildParam({
                'info': {
                  'meetingName': meetingName,
                  'meetingHostUserID': meetingHostUserID,
                  'startTime': startTime,
                  'meetingDuration': meetingDuration,
                  'inviteeUserIDList': inviteeUserIDList,
                  'ex': ex,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  /// 加入会议室
  /// [meetingID] 会议ID
  /// [meetingName] 会议主题
  /// [participantNickname] 加入房间显示的名称
  Future<SignalingCertificate> signalingJoinMeeting({
    required String meetingID,
    String? meetingName,
    String? participantNickname,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingJoinMeeting',
              _buildParam({
                'info': {
                  'meetingID': meetingID,
                  'meetingName': meetingName,
                  'participantNickname': participantNickname,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SignalingCertificate.fromJson(map)));

  /// 会议室 管理员对指定的某一个入会人员设置禁言
  /// [roomID] 会议ID
  /// [streamType] video/audio
  /// [userID] 被禁言的用户ID
  /// [mute] true：禁言
  /// [muteAll] true：video/audio 一起设置
  Future<dynamic> signalingOperateStream({
    required String roomID,
    String? streamType,
    required String userID,
    bool mute = false,
    bool muteAll = false,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingOperateStream',
          _buildParam({
            'roomID': roomID,
            'streamType': streamType,
            'userID': userID,
            'mute': mute,
            'muteAll': muteAll,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 获取所有的未完成会议
  /// [roomID] 会议ID
  Future<MeetingInfoList> signalingGetMeetings({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'signalingGetMeetings',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => MeetingInfoList.fromJson(map)));

  /// 结束会议
  /// [roomID] 会议ID
  Future<dynamic> signalingCloseRoom({
    required String roomID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingCloseRoom',
          _buildParam({
            'roomID': roomID,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 自定义信令
  /// [roomID] 会议ID
  /// [customInfo] 自定义信令
  Future<dynamic> signalingSendCustomSignal({
    required String roomID,
    required String customInfo,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'signalingSendCustomSignal',
          _buildParam({
            'roomID': roomID,
            'customInfo': customInfo,
            'operationID': Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "signalingManager";
    return param;
  }
}
