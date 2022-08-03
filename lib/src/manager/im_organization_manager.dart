import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OrganizationManager {
  MethodChannel _channel;
  late OnOrganizationListener listener;

  OrganizationManager(this._channel);

  /// 组织架构发生变化回调
  Future setOrganizationListener(OnOrganizationListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setOrganizationListener', _buildParam({}));
  }

  /// 获取子部门列表，返回当前部门下的一级子部门
  /// [departmentID] 当前部门id
  /// [offset] 开始下标
  /// [count] 每页大小
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

  /// 获取部门下的成员列表，返回当前部门下的一级成员
  /// [departmentID] 当前部门id
  /// [offset] 开始下标
  /// [count] 每页大小
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

  /// 获取成员所在的部门
  /// [userID] 成员ID
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

  /// 获取部门下的子部门跟员工
  /// [departmentID] 当前部门id
  Future<DeptMemberAndSubDept> getDeptMemberAndSubDept({
    required String departmentID,
    // int departmentOffset = 0,
    // int departmentCount = 40,
    // int memberOffset = 0,
    // int memberCount = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getDepartmentMemberAndSubDepartment',
              _buildParam({
                'departmentID': departmentID,
                // 'departmentOffset': departmentOffset,
                // 'departmentCount': departmentCount,
                // 'memberOffset': memberOffset,
                // 'memberCount': memberCount,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (v) => DeptMemberAndSubDept.fromJson(v)));

  /// 查询部门信息
  /// [departmentID] 部门ID
  Future<DeptInfo> getDeptInfo({
    required String departmentID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getDepartmentInfo',
              _buildParam({
                'departmentID': departmentID,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (v) => DeptInfo.fromJson(v)));

  /// 搜索组织人员
  /// [keyWord] 关键字
  /// [isSearchUserName] 是否匹配用户名
  /// [isSearchEnglishName] 是否匹配英文名
  /// [isSearchPosition]  是否匹配职位
  /// [isSearchUserID]  是否匹配用户ID
  /// [isSearchMobile]  是否匹配手机号
  /// [isSearchEmail] 是否匹配邮箱号
  /// [isSearchTelephone] 是否匹配电话号码
  /// [offset]  开始下标
  /// [count] 分页大小
  Future<OrganizationSearchResult> searchOrganization({
    required String keyWord,
    bool isSearchUserName = false,
    bool isSearchEnglishName = false,
    bool isSearchPosition = false,
    bool isSearchUserID = false,
    bool isSearchMobile = false,
    bool isSearchEmail = false,
    bool isSearchTelephone = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchOrganization',
              _buildParam({
                'searchParam': {
                  'keyWord': keyWord,
                  'isSearchUserName': isSearchUserName,
                  'isSearchEnglishName': isSearchEnglishName,
                  'isSearchPosition': isSearchPosition,
                  'isSearchUserID': isSearchUserID,
                  'isSearchMobile': isSearchMobile,
                  'isSearchEmail': isSearchEmail,
                  'isSearchTelephone': isSearchTelephone,
                },
                'offset': offset,
                'count': count,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (v) => OrganizationSearchResult.fromJson(v)));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "organizationManager";
    return param;
  }
}
