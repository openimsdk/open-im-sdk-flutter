import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/src/listener/group_listener.dart';
import 'package:flutter_openim_sdk/src/models/group_info.dart';

class GroupManager {
  MethodChannel _channel;
  late GroupListener groupListener;

  GroupManager(this._channel);

  /// Set up group relationship monitoring
  /// 组关系监听
  Future setGroupListener(GroupListener listener) {
    this.groupListener = listener;
    return _channel.invokeMethod('setGroupListener', _buildParam({}));
  }

  /// Invite friends into the group
  /// 邀请进组，直接进组无需同意。
  Future<List<GroupInviteResult>> inviteUserToGroup({
    required String groupId,
    required List<String> uidList,
    String? reason,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'inviteUserToGroup',
              _buildParam({
                'gid': groupId,
                'reason': reason,
                'uidList': uidList,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupInviteResult.fromJson(e))
              .toList());

  /// Remove member from group
  /// 移除组成员
  Future<List<GroupInviteResult>> kickGroupMember({
    required String groupId,
    required List<String> uidList,
    String? reason,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'kickGroupMember',
              _buildParam({
                'gid': groupId,
                'reason': reason,
                'uidList': uidList,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupInviteResult.fromJson(e))
              .toList());

  /// Get group member's info
  /// 查询组成员资料
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupId,
    required List<String> uidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMembersInfo',
              _buildParam({
                'gid': groupId,
                'uidList': uidList,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupMembersInfo.fromJson(e))
              .toList());

  /// Get the list of group members
  /// 分页获取组成员列表
  Future<List<GroupMembersInfo>> getGroupMemberList({
    required String groupId,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberList',
              _buildParam({
                'gid': groupId,
                'filter': filter,
                'offset': offset,
                'count': count,
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupMembersInfo.fromJson(e))
              .toList());

  /// Get the list of group members
  /// 分页获取组成员列表
  Future<dynamic> getGroupMemberListMap({
    required String groupId,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberList',
              _buildParam({
                'gid': groupId,
                'filter': filter,
                'offset': offset,
                'count': count,
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) => _formatJson(value));

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<GroupInfo>> getJoinedGroupList({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': _checkOperationID(operationID),
          }))
      .then((value) => (_formatJson(value) as List)
          .map((e) => GroupInfo.fromJson(e))
          .toList());

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<dynamic>> getJoinedGroupListMap({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': _checkOperationID(operationID),
          }))
      .then((value) => _formatJson(value));

  /// Check if you are a member of the group
  /// 检查是否已加入组
  Future<bool> isJoinedGroup({
    required String gid,
    String? operationID,
  }) =>
      getJoinedGroupList(
        operationID: _checkOperationID(operationID),
      ).then((list) => list.where((e) => e.groupID == gid).length > 0);

  /// Create a group
  /// 创建一个组
  Future<GroupInfo> createGroup({
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
    int? groupType,
    String? ex,
    required List<GroupMemberRole> list,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createGroup',
              _buildParam({
                'gInfo': {
                  "groupName": groupName,
                  "notification": notification,
                  "introduction": introduction,
                  "faceURL": faceUrl,
                  "groupType": groupType,
                  "ex": ex,
                },
                'memberList': list.map((e) => e.toJson()).toList(),
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) => GroupInfo.fromJson(_formatJson(value)));

  /// Edit group information
  /// 编辑组资料
  Future<dynamic> setGroupInfo({
    required String groupID,
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupInfo',
          _buildParam({
            "gid": groupID,
            'gInfo': {
              // "groupID": groupID,
              "groupName": groupName,
              "notification": notification,
              "introduction": introduction,
              "faceURL": faceUrl,
              "ex": ex,
            },
            'operationID': _checkOperationID(operationID),
          }));

  /// Find group information by group id
  /// 查询组信息
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> gidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupsInfo',
              _buildParam({
                'gidList': gidList,
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) {
        List list = _formatJson(value);
        return list.map((e) => GroupInfo.fromJson(e)).toList();
      });

  /// Apply to join the group
  /// 申请加入组，需要通过管理员同意。
  Future<dynamic> joinGroup({
    required String gid,
    String? reason,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'joinGroup',
          _buildParam({
            'gid': gid,
            'reason': reason,
            'operationID': _checkOperationID(operationID),
          }));

  /// Leave group
  /// 退出组
  Future<dynamic> quitGroup({
    required String gid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'quitGroup',
          _buildParam({
            'gid': gid,
            'operationID': _checkOperationID(operationID),
          }));

  /// Give group permissions to others
  /// 转移组拥有者权限
  Future<dynamic> transferGroupOwner({
    required String gid,
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'transferGroupOwner',
          _buildParam({
            'gid': gid,
            'uid': uid,
            'operationID': _checkOperationID(operationID),
          }));

  /// As the group owner or administrator, get the list of received group members' applications to join the group.
  /// 作为群主或者管理员，获取收到的群成员申请进群列表。
  Future<List<GroupApplicationInfo>> getRecvGroupApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getRecvGroupApplicationList',
              _buildParam({
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupApplicationInfo.fromJson(e))
              .toList());

  /// Get the record of the group membership application issued by yourself
  /// 获取自己发出的入群申请记录
  Future<List<GroupApplicationInfo>> getSendGroupApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getSendGroupApplicationList',
              _buildParam({
                'operationID': _checkOperationID(operationID),
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupApplicationInfo.fromJson(e))
              .toList());

  /// Accept group application
  /// 管理员或者群主同意某人进入某群
  Future<dynamic> acceptGroupApplication({
    required String gid,
    required String uid,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'acceptGroupApplication',
          _buildParam({
            'gid': gid,
            'uid': uid,
            'handleMsg': handleMsg,
            'operationID': _checkOperationID(operationID),
          }));

  /// Refuse group application
  /// 管理员或者群主拒绝某人进入某群
  Future<dynamic> refuseGroupApplication({
    required String gid,
    required String uid,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'refuseGroupApplication',
          _buildParam({
            'gid': gid,
            'uid': uid,
            'handleMsg': handleMsg,
            'operationID': _checkOperationID(operationID),
          }));

  ///
  // Future forceSyncApplyGroupRequest() {
  //   return _channel.invokeMethod('forceSyncApplyGroupRequest', _buildParam({}));
  // }

  ///
  // Future forceSyncGroupRequest() {
  //   return _channel.invokeMethod('forceSyncGroupRequest', _buildParam({}));
  // }

  ///
  // Future forceSyncJoinedGroup() {
  //   return _channel.invokeMethod('forceSyncJoinedGroup', _buildParam({}));
  // }

  ///
  // Future forceSyncJoinedGroupMember() {
  //   return _channel.invokeMethod('forceSyncJoinedGroupMember', _buildParam({}));
  // }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "groupManager";
    return param;
  }

  static dynamic _formatJson(value) => jsonDecode(_printValue(value));

  static String _printValue(value) {
    return value;
  }

  static String _checkOperationID(String? obj) {
    return obj ?? DateTime.now().millisecondsSinceEpoch.toString();
  }
}
