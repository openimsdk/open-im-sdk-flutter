import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/src/listener/group_listener.dart';
import 'package:flutter_openim_sdk/src/models/group_info.dart';

class GroupManager {
  MethodChannel _channel;
  late GroupListener groupListener;

  GroupManager(this._channel);

  /// Set up group relationship monitoring
  Future setGroupListener(GroupListener listener) {
    this.groupListener = listener;
    return _channel.invokeMethod('setGroupListener', _buildParam({}));
  }

  /// Invite friends into the group
  Future<List<GroupInviteResult>> inviteUserToGroup({
    required String groupId,
    required List<String> uidList,
    String? reason,
  }) {
    return _channel
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
  }

  /// Remove member from group
  Future<List<GroupInviteResult>> kickGroupMember({
    required String groupId,
    required List<String> uidList,
    String? reason,
  }) {
    return _channel
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
  }

  /// Get group member's info
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupId,
    required List<String> uidList,
  }) {
    return _channel
        .invokeMethod(
            'getGroupMembersInfo',
            _buildParam({
              'gid': groupId,
              'uidList': uidList,
            }))
        .then((value) => (_formatJson(value) as List)
            .map((e) => GroupMembersInfo.fromJson(e))
            .toList());
  }

  /// Get the list of group members
  /// [filter] 0: all user, 1: group owner, 2: administrator
  /// [next] begin index, pull and fill 0 for the first time
  Future<GroupMembersList> getGroupMemberList({
    required String groupId,
    int filter = 0,
    int next = 0,
  }) {
    return _channel
        .invokeMethod(
            'getGroupMemberList',
            _buildParam({
              'gid': groupId,
              'filter': filter,
              'next': next,
            }))
        .then((value) => GroupMembersList.fromJson(_formatJson(value)));
  }

  /// Get the list of group members
  Future<dynamic> getGroupMemberListMap({
    required String groupId,
    int filter = 0,
    int next = 0,
  }) {
    return _channel
        .invokeMethod(
            'getGroupMemberList',
            _buildParam({
              'gid': groupId,
              'filter': filter,
              'next': next,
            }))
        .then((value) => _formatJson(value));
  }

  /// Find all groups you have joined
  Future<List<GroupInfo>> getJoinedGroupList() {
    return _channel.invokeMethod('getJoinedGroupList', _buildParam({})).then(
        (value) => (_formatJson(value) as List)
            .map((e) => GroupInfo.fromJson(e))
            .toList());
  }

  /// Find all groups you have joined
  Future<List<dynamic>> getJoinedGroupListMap() {
    return _channel
        .invokeMethod('getJoinedGroupList', _buildParam({}))
        .then((value) => _formatJson(value));
  }

  /// Check if you are a member of the group
  Future<bool> isJoinedGroup({required String gid}) {
    return getJoinedGroupList()
        .then((list) => list.where((e) => e.groupID == gid).length > 0);
  }

  /// Create a group
  Future<dynamic> createGroup({
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
    required List<GroupMemberRole> list,
  }) {
    return _channel.invokeMethod(
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
    /*.then((value) => _formatJson(value)['groupID'])*/
  }

  /// Edit group information
  Future<dynamic> setGroupInfo({
    required String groupID,
    String? groupName,
    String? notification,
    String? introduction,
    String? faceUrl,
  }) {
    return _channel.invokeMethod(
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
  }

  /// Find group information by group id
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> gidList,
  }) {
    return _channel
        .invokeMethod('getGroupsInfo', _buildParam({'gidList': gidList}))
        .then((value) {
      List list = _formatJson(value);
      return list.map((e) => GroupInfo.fromJson(e)).toList();
    });
  }

  /// Apply to join the group
  Future<dynamic> joinGroup({
    required String gid,
    String? reason,
  }) {
    return _channel.invokeMethod(
        'joinGroup',
        _buildParam({
          'gid': gid,
          'reason': reason,
        }));
  }

  /// Leave group
  Future<dynamic> quitGroup({
    required String gid,
  }) {
    return _channel.invokeMethod(
        'quitGroup',
        _buildParam({
          'gid': gid,
        }));
  }

  /// Give group permissions to others
  Future<dynamic> transferGroupOwner({
    required String gid,
    required String uid,
  }) {
    return _channel.invokeMethod(
        'transferGroupOwner',
        _buildParam({
          'gid': gid,
          'uid': uid,
        }));
  }

  /// Get the list of applications
  Future<GroupApplicationList> getGroupApplicationList() {
    return _channel
        .invokeMethod('getGroupApplicationList', _buildParam({}))
        .then((value) => GroupApplicationList.fromJson(_formatJson(value)));
  }

  /// Accept group application
  Future<dynamic> acceptGroupApplication({
    required GroupApplicationInfo info,
    required String reason,
  }) {
    return _channel.invokeMethod(
        'acceptGroupApplication',
        _buildParam({
          'application': info.toJson(),
          'reason': reason,
        }));
  }

  /// Refuse group application
  Future<dynamic> refuseGroupApplication({
    required GroupApplicationInfo info,
    required String reason,
  }) {
    return _channel.invokeMethod(
        'refuseGroupApplication',
        _buildParam({
          'application': info.toJson(),
          'reason': reason,
        }));
  }

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

  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
