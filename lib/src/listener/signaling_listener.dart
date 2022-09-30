import 'package:flutter_openim_sdk/src/models/signaling_info.dart';

/// 信令监听
class OnSignalingListener {
  final Function(SignalingInfo info)? onInvitationCancelled;
  final Function(SignalingInfo info)? onInvitationTimeout;
  final Function(SignalingInfo info)? onInviteeAccepted;
  final Function(SignalingInfo info)? onInviteeRejected;
  final Function(SignalingInfo info)? onReceiveNewInvitation;
  final Function(SignalingInfo info)? onInviteeRejectedByOtherDevice;
  final Function(SignalingInfo info)? onInviteeAcceptedByOtherDevice;
  final Function(SignalingInfo info)? onHangup;
  final Function(RoomCallingInfo info)? onRoomParticipantConnected;
  final Function(RoomCallingInfo info)? onRoomParticipantDisconnected;

  OnSignalingListener({
    this.onInvitationCancelled,
    this.onInvitationTimeout,
    this.onInviteeAccepted,
    this.onInviteeRejected,
    this.onReceiveNewInvitation,
    this.onInviteeAcceptedByOtherDevice,
    this.onInviteeRejectedByOtherDevice,
    this.onHangup,
    this.onRoomParticipantConnected,
    this.onRoomParticipantDisconnected,
  });

  /// 被邀请者收到：邀请者取消音视频通话
  void invitationCancelled(SignalingInfo info) {
    onInvitationCancelled?.call(info);
  }

  /// 邀请者收到：被邀请者超时未接通
  void invitationTimeout(SignalingInfo info) {
    onInvitationTimeout?.call(info);
  }

  /// 邀请者收到：被邀请者同意音视频通话
  void inviteeAccepted(SignalingInfo info) {
    onInviteeAccepted?.call(info);
  }

  /// 邀请者收到：被邀请者拒绝音视频通话
  void inviteeRejected(SignalingInfo info) {
    onInviteeRejected?.call(info);
  }

  /// 被邀请者收到：音视频通话邀请
  void receiveNewInvitation(SignalingInfo info) {
    onReceiveNewInvitation?.call(info);
  }

  /// 被邀请者（其他端）收到：比如被邀请者在手机拒接，在pc上会收到此回调
  void inviteeAcceptedByOtherDevice(SignalingInfo info) {
    onInviteeAcceptedByOtherDevice?.call(info);
  }

  /// 被邀请者（其他端）收到：比如被邀请者在手机拒接，在pc上会收到此回调
  void inviteeRejectedByOtherDevice(SignalingInfo info) {
    onInviteeRejectedByOtherDevice?.call(info);
  }

  /// 被挂断
  void hangup(SignalingInfo info) {
    onHangup?.call(info);
  }

  void roomParticipantConnected(RoomCallingInfo info) {
    onRoomParticipantConnected?.call(info);
  }

  void roomParticipantDisconnected(RoomCallingInfo info) {
    onRoomParticipantDisconnected?.call(info);
  }
}
