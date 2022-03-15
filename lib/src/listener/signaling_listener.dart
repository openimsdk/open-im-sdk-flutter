import 'package:flutter_openim_sdk/src/models/signaling_info.dart';

class OnSignalingListener {
  final Function(SignalingInfo info)? onInvitationCancelled;
  final Function(SignalingInfo info)? onInvitationTimeout;
  final Function(SignalingInfo info)? onInviteeAccepted;
  final Function(SignalingInfo info)? onInviteeRejected;
  final Function(SignalingInfo info)? onReceiveNewInvitation;

  OnSignalingListener({
    this.onInvitationCancelled,
    this.onInvitationTimeout,
    this.onInviteeAccepted,
    this.onInviteeRejected,
    this.onReceiveNewInvitation,
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
}
