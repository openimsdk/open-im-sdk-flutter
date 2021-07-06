import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/src/models/group_info.dart';

class GroupManager {
  MethodChannel _channel;

  GroupManager(this._channel);

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
        .then((value) => _formatJson(value)
            .map((e) => GroupInviteResult.fromJson(e))
            .toList());
  }

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
        .then((value) => _formatJson(value)
            .map((e) => GroupInviteResult.fromJson(e))
            .toList());
  }

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
        .then((value) => _formatJson(value)
            .map((e) => GroupMembersInfo.fromJson(e))
            .toList());
  }

  ///filter 0: all user, 1: group owner, 2: administrator
  ///begin index, pull and fill 0 for the first time
  Future<GroupMembersList> getGroupMemberList({
    required String groupId,
    required int filter,
    required int next,
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

  Future<List<GroupInfo>> getJoinedGroupList() {
    return _channel.invokeMethod('getJoinedGroupList', _buildParam({})).then(
        (value) =>
            _formatJson(value).map((e) => GroupInfo.fromJson(e)).toList());
  }

  Future<String> createGroup({
    required GroupInfo groupInfo,
    required List<GroupMemberRole> list,
  }) {
    return _channel
        .invokeMethod(
            'createGroup',
            _buildParam({
              'gInfo': groupInfo.toJson(),
              'memberList': list.map((e) => e.toJson()).toList()
            }))
        .then((value) => _formatJson(value)['groupID']);
  }

  Future<dynamic> setGroupInfo({
    required GroupInfo groupInfo,
  }) {
    return _channel.invokeMethod(
        'setGroupInfo',
        _buildParam({
          'gInfo': groupInfo.toJson(),
        }));
  }

  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> gidList,
  }) {
    return _channel
        .invokeMethod('getGroupsInfo', _buildParam({'gidList': gidList}))
        .then((value) =>
            _formatJson(value).map((e) => GroupInfo.fromJson(e)).toList());
  }

  Future<dynamic> joinGroup({
    required String gid,
    required String reason,
  }) {
    return _channel.invokeMethod(
        'joinGroup',
        _buildParam({
          'gid': gid,
          'reason': reason,
        }));
  }

  Future<dynamic> quitGroup({
    required String gid,
  }) {
    return _channel.invokeMethod(
        'quitGroup',
        _buildParam({
          'gid': gid,
        }));
  }

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

  Future<GroupApplicationList> getGroupApplicationList({
    required String gid,
    required String uid,
  }) {
    return _channel
        .invokeMethod('getGroupApplicationList', _buildParam({}))
        .then((value) => GroupApplicationList.fromJson(_formatJson(value)));
  }

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
