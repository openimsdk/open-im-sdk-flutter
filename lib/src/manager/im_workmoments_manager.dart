import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class WorkMomentsManager {
  MethodChannel _channel;
  late OnWorkMomentsListener listener;

  WorkMomentsManager(this._channel);

  /// Observe work moments changes
  Future setWorkMomentsListener(OnWorkMomentsListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setWorkMomentsListener', _buildParam({}));
  }

  /// Get work moments unread count
  Future<int> getWorkMomentsUnReadCount({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getWorkMomentsUnReadCount',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => map['unreadCount']));

  /// Get work moments notification list
  Future<List<WorkMomentsInfo>> getWorkMomentsNotification({
    required int offset,
    required int count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getWorkMomentsNotification',
              _buildParam({
                'offset': offset,
                'count': count,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => WorkMomentsInfo.fromJson(map)));

  /// Clear work moments notification
  Future clearWorkMomentsNotification({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearWorkMomentsNotification',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "workMomentsManager";
    return param;
  }
}
