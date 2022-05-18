import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class GroupManager {
  MethodChannel _channel;
  late OnGroupListener listener;

  GroupManager(this._channel);

  /// Set up group relationship monitoring
  /// 组关系监听
  Future setGroupListener(OnGroupListener listener) {
    this.listener = listener;
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
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupInviteResult.fromJson(map)));

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
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupInviteResult.fromJson(map)));

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
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// Get the list of group members
  /// 分页获取组成员列表
  /// [groupId] 群ID
  /// [filter] 过滤成员 1普通成员, 2群主，3管理员，0所有
  /// [offset] 开始下标
  /// [count] 总数
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
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// Get the list of group members
  /// 分页获取组成员列表
  /// [groupId] 群ID
  /// [filter] 过滤成员 1普通成员, 2群主，3管理员，0所有
  /// [offset] 开始下标
  /// [count] 总数
  Future<List<dynamic>> getGroupMemberListMap({
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
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toListMap(value));

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<GroupInfo>> getJoinedGroupList({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// Find all groups you have joined
  /// 查询已加入的组列表
  Future<List<dynamic>> getJoinedGroupListMap({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toListMap(value));

  /// Check if you are a member of the group
  /// 检查是否已加入组
  Future<bool> isJoinedGroup({
    required String gid,
    String? operationID,
  }) =>
      getJoinedGroupList(
        operationID: Utils.checkOperationID(operationID),
      ).then((list) => list.where((e) => e.groupID == gid).length > 0);

  /// Create a group
  /// 创建一个组
  /// [groupName] 群名
  /// [notification] 公告
  /// [introduction] 群介绍
  /// [faceUrl] 群头像
  /// [ex] 额外信息
  /// [list] 初创群成员以及其角色
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
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then(
              (value) => Utils.toObj(value, (map) => GroupInfo.fromJson(map)));

  /// Edit group information
  /// 编辑组资料
  /// [groupID] 被编辑的群ID
  /// [groupName] 新的群名
  /// [notification] 新的公告
  /// [introduction] 新的群介绍
  /// [faceUrl] 新的群头像
  /// [ex] 新的额外信息
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
            'operationID': Utils.checkOperationID(operationID),
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
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then(
              (value) => Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// Apply to join the group
  /// 申请加入组，需要通过管理员/群组同意。
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
            'operationID': Utils.checkOperationID(operationID),
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
            'operationID': Utils.checkOperationID(operationID),
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
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// As the group owner or administrator, the group member's application to join the group received
  /// 作为群主或者管理员，收到的群成员入群申请
  Future<List<GroupApplicationInfo>> getRecvGroupApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getRecvGroupApplicationList',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupApplicationInfo.fromJson(map)));

  /// Get the record of the group membership application issued by yourself
  /// 获取自己发出的入群申请记录
  Future<List<GroupApplicationInfo>> getSendGroupApplicationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getSendGroupApplicationList',
              _buildParam({
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupApplicationInfo.fromJson(map)));

  /// Accept group application
  /// 管理员或者群主同意某人进入某群
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
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
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Refuse group application
  /// 管理员或者群主拒绝某人进入某群
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
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
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Dissmiss group
  /// 解散群
  Future<dynamic> dismissGroup({
    required String groupID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'dismissGroup',
          _buildParam({
            'gid': groupID,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Enable group mute
  /// 开启群禁言，所有群成员禁止发言
  /// [groupID] 将开启群禁言的组ID
  /// [mute] true：开启，false：关闭
  Future<dynamic> changeGroupMute({
    required String groupID,
    required bool mute,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'changeGroupMute',
          _buildParam({
            'gid': groupID,
            'mute': mute,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Mute group members
  /// 禁言群成员
  /// [groupID] 群ID
  /// [userID] 将被禁言的成员ID
  /// [seconds] 被禁言的时间s，设置为0则为接触禁言
  Future<dynamic> changeGroupMemberMute({
    required String groupID,
    required String userID,
    int seconds = 0,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'changeGroupMemberMute',
          _buildParam({
            'gid': groupID,
            'uid': userID,
            'seconds': seconds,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Set group user nickname
  /// 设置群成员昵称
  /// [groupID] 群ID
  /// [userID] 群成员的用户ID
  /// [groupNickname] 群昵称
  Future<dynamic> setGroupMemberNickname({
    required String groupID,
    required String userID,
    String? groupNickname,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupMemberNickname',
          _buildParam({
            'gid': groupID,
            'uid': userID,
            'groupNickname': groupNickname ?? '',
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// Search group
  /// 查询群
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  /// [isSearchGroupID] 是否以关键词搜索群ID(注：两个不可以同时为false)，为空默认false
  /// [isSearchGroupName] 是否以关键词搜索群名字，为空默认false
  Future<List<GroupInfo>> searchGroups({
    List<String> keywordList = const [],
    bool isSearchGroupID = false,
    bool isSearchGroupName = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchGroups',
              _buildParam({
                'searchParam': {
                  'keywordList': keywordList,
                  'isSearchGroupID': isSearchGroupID,
                  'isSearchGroupName': isSearchGroupName,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then(
              (value) => Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "groupManager";
    return param;
  }
}
