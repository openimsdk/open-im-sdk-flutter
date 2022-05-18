import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OrganizationManager {
  MethodChannel _channel;
  late OnOrganizationListener listener;

  OrganizationManager(this._channel);

  /// Observe organization info changes
  /// 组织架构发生变化回调
  Future setOrganizationListener(OnOrganizationListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setOrganizationListener', _buildParam({}));
  }

  /// Query sub department
  /// 获取子部门列表
  Future<List<DeptInfo>> getSubDept({
    required String departmentID,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getSubDepartment',
              _buildParam({
                'departmentID': departmentID,
                'offset': offset,
                'count': count,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => DeptInfo.fromJson(v)));

  /// Get member under a department
  /// 获取部门下的成员列表
  Future<List<DeptMemberInfo>> getDeptMember({
    required String departmentID,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getDepartmentMember',
              _buildParam({
                'departmentID': departmentID,
                'offset': offset,
                'count': count,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (v) => DeptMemberInfo.fromJson(v)));

  /// Get member's department
  /// 获取成员所在的部门
  Future<List<UserInDept>> getUserInDept({
    required String userID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getUserInDepartment',
              _buildParam({
                'userID': userID,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => UserInDept.fromJson(v)));

  /// Get the sub-departments and employees under the department
  /// 获取部门下的子部门跟员工
  Future<List<UserInDept>> getDeptMemberAndSubDept({
    required String departmentID,
    int departmentOffset = 0,
    int departmentCount = 40,
    int memberOffset = 0,
    int memberCount = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getDepartmentMemberAndSubDepartment',
              _buildParam({
                'departmentID': departmentID,
                'departmentOffset': departmentOffset,
                'departmentCount': departmentCount,
                'memberOffset': memberOffset,
                'memberCount': memberCount,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (v) => UserInDept.fromJson(v)));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "organizationManager";
    return param;
  }
}
