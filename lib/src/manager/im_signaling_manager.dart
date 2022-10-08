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

  static Map _buildParam(Map param) {
    param["ManagerName"] = "signalingManager";
    return param;
  }
}
