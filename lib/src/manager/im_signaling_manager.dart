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

  static Map _buildParam(Map param) {
    param["ManagerName"] = "signalingManager";
    return param;
  }
}
