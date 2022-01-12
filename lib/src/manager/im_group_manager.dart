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
  }) =>
      _channel
          .invokeMethod(
              'inviteUserToGroup',
              _buildParam({
                'gid': groupId,
                'reason': reason,
                'uidList': uidList,
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
  }) =>
      _channel
          .invokeMethod(
              'kickGroupMember',
              _buildParam({
                'gid': groupId,
                'reason': reason,
                'uidList': uidList,
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupInviteResult.fromJson(e))
              .toList());

  /// Get group member's info
  /// 查询组成员资料
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupId,
    required List<String> uidList,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMembersInfo',
              _buildParam({
                'gid': groupId,
                'uidList': uidList,
              }))
          .then((value) => (_formatJson(value) as List)
              .map((e) => GroupMembersInfo.fromJson(e))
              .toList());

  /// Get the list of group members
  /// [filter] 0: all user, 1: group owner, 2: administrator
  /// [next] begin index, pull and fill 0 for the first time
  /// 获取组成员列表
  Future<GroupMembersList> getGroupMemberList({
    required String groupId,
    int filter = 0,
    int next = 0,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberList',
              _buildParam({
                'gid': groupId,
                'filter': filter,
                'next': next,
              }))
          .then((value) => GroupMembersList.fromJson(_formatJson(value)));

  /// Get the list of group members
  /// 获取组成员列表
  Future<dynamic> getGroupMemberListMap({
    required String groupId,
    int filter = 0,
    int next = 0,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberList',
              _buildParam({
                'gid': groupId,
                'filter': filter,
                'next': next,
              }))
          .then((value) => _formatJson(value));

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<GroupInfo>> getJoinedGroupList() => _channel
      .invokeMethod('getJoinedGroupList', _buildParam({}))
      .then((value) => (_formatJson(value) as List)
          .map((e) => GroupInfo.fromJson(e))
          .toList());

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<dynamic>> getJoinedGroupListMap() => _channel
      .invokeMethod('getJoinedGroupList', _buildParam({}))
      .then((value) => _formatJson(value));

  /// Check if you are a member of the group
  /// 检查是否已加入组
  Future<bool> isJoinedGroup({required String gid}) => getJoinedGroupList()
      .then((list) => list.where((e) => e.groupID == gid).length > 0);

  /// Create a group
  /// 创建一个组
  Future<dynamic> createGroup({
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
    required List<GroupMemberRole> list,
  }) =>
      _channel.invokeMethod(
          'createGroup',
          _buildParam({
            'gInfo': {
              "groupName": groupName,
              "notification": notification,
              "introduction": introduction,
              "faceUrl": faceUrl,
            },
            'memberList': list.map((e) => e.toJson()).toList()
          }));

  /// Edit group information
  /// 编辑组资料
  Future<dynamic> setGroupInfo({
    required String groupID,
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
  }) =>
      _channel.invokeMethod(
          'setGroupInfo',
          _buildParam({
            'gInfo': {
              "groupID": groupID,
              "groupName": groupName,
              "notification": notification,
              "introduction": introduction,
              "faceUrl": faceUrl,
            },
          }));

  /// Find group information by group id
  /// 查询组信息
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> gidList,
  }) =>
      _channel
          .invokeMethod('getGroupsInfo', _buildParam({'gidList': gidList}))
          .then((value) {
        List list = _formatJson(value);
        return list.map((e) => GroupInfo.fromJson(e)).toList();
      });

  /// Apply to join the group
  /// 申请加入组，需要通过管理员同意。
  Future<dynamic> joinGroup({
    required String gid,
    String? reason,
  }) =>
      _channel.invokeMethod(
          'joinGroup',
          _buildParam({
            'gid': gid,
            'reason': reason,
          }));

  /// Leave group
  /// 退出组
  Future<dynamic> quitGroup({
    required String gid,
  }) =>
      _channel.invokeMethod(
          'quitGroup',
          _buildParam({
            'gid': gid,
          }));

  /// Give group permissions to others
  /// 转移组拥有者权限
  Future<dynamic> transferGroupOwner({
    required String gid,
    required String uid,
  }) =>
      _channel.invokeMethod(
          'transferGroupOwner',
          _buildParam({
            'gid': gid,
            'uid': uid,
          }));

  /// Get the list of applications
  /// 获取所有进组申请
  Future<GroupApplicationList> getGroupApplicationList() => _channel
      .invokeMethod('getGroupApplicationList', _buildParam({}))
      .then((value) => GroupApplicationList.fromJson(_formatJson(value)));

  /// Accept group application
  /// 同意进组申请
  Future<dynamic> acceptGroupApplication({
    required GroupApplicationInfo info,
    required String reason,
  }) =>
      _channel.invokeMethod(
          'acceptGroupApplication',
          _buildParam({
            'application': info.toJson(),
            'reason': reason,
          }));

  /// Refuse group application
  /// 拒绝进组申请
  Future<dynamic> refuseGroupApplication({
    required GroupApplicationInfo info,
    required String reason,
  }) =>
      _channel.invokeMethod(
          'refuseGroupApplication',
          _buildParam({
            'application': info.toJson(),
            'reason': reason,
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
}
