import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class GroupManager {
  MethodChannel _channel;
  late OnGroupListener listener;

  GroupManager(this._channel);

  /// 组关系监听
  Future setGroupListener(OnGroupListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setGroupListener', _buildParam({}));
  }

  /// 邀请进组，直接进组无需同意。
  /// [groupId] 组ID
  /// [uidList] 用户ID列表
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

  /// 移除组成员
  /// [groupId] 组ID
  /// [uidList] 用户ID列表
  /// [reason]  备注说明
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

  /// 查询组成员资料
  /// [groupId] 组ID
  /// [uidList] 用户ID列表
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

  /// 分页获取组成员列表
  /// [groupId] 群ID
  /// [filter] 过滤成员 0所有，1普通成员, 2群主，3管理员，4管理员+普通成员
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

  /// 分页获取组成员列表
  /// [groupId] 群ID
  /// [filter] 过滤成员 0所有，1普通成员, 2群主，3管理员，4管理员+普通成员
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

  /// 查询已加入的组列表
  Future<List<GroupInfo>> getJoinedGroupList({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// 查询已加入的组列表
  Future<List<dynamic>> getJoinedGroupListMap({String? operationID}) => _channel
      .invokeMethod(
          'getJoinedGroupList',
          _buildParam({
            'operationID': Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toListMap(value));

  /// 检查是否已加入组
  /// [gid] 组ID
  Future<bool> isJoinedGroup({
    required String gid,
    String? operationID,
  }) =>
      getJoinedGroupList(
        operationID: Utils.checkOperationID(operationID),
      ).then((list) => list.where((e) => e.groupID == gid).length > 0);

  /// 创建一个组
  /// [groupName] 群名
  /// [notification] 公告
  /// [introduction] 群介绍
  /// [faceUrl] 群头像
  /// [groupType] 组类型 [GroupType]
  /// [ex] 额外信息
  /// [list] 初创群成员以及其角色列表[GroupMemberRole]
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

  /// 查询组信息
  /// [gidList] 组ID列表
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

  /// 申请加入组，需要通过管理员/群组同意。
  /// [joinSource] 2：通过邀请  3：通过搜索  4：通过二维码
  Future<dynamic> joinGroup({
    required String gid,
    String? reason,
    String? operationID,
    int joinSource = 3,
  }) =>
      _channel.invokeMethod(
          'joinGroup',
          _buildParam({
            'gid': gid,
            'reason': reason,
            'joinSource': joinSource,
            'operationID': Utils.checkOperationID(operationID),
          }));

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

  /// 转移组拥有者权限
  /// [gid] 组ID
  /// [uid] 新拥有者ID
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

  /// 管理员或者群主同意某人进入某群
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
  /// [gid] 组id
  /// [uid] 申请者用户ID
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

  /// 管理员或者群主拒绝某人进入某群
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
  /// [gid] 组id
  /// [uid] 申请者用户ID
  /// [handleMsg] 说明
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

  /// 解散群
  /// [groupID] 群ID
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

  /// 禁言群成员
  /// [groupID] 群ID
  /// [userID] 将被禁言的成员ID
  /// [seconds] 被禁言的时间s，设置为0则为解除禁言
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

  /// 设置群成员权限
  /// [groupID] 群ID
  /// [userID] 群成员的用户ID
  /// [roleLevel] 角色等级，参考[GroupRoleLevel]
  Future<dynamic> setGroupMemberRoleLevel({
    required String groupID,
    required String userID,
    required int roleLevel,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupMemberRoleLevel',
          _buildParam({
            'groupID': groupID,
            'userID': userID,
            'roleLevel': roleLevel,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 根据加入时间分页获取组成员列表
  /// [groupID] 群ID
  /// [joinTimeBegin] 加入开始时间
  /// [joinTimeEnd] 加入结束时间
  /// [offset] 开始下标
  /// [count] 总数
  /// [excludeUserIDList] 排除的用户
  Future<List<GroupMembersInfo>> getGroupMemberListByJoinTime({
    required String groupID,
    int offset = 0,
    int count = 0,
    int joinTimeBegin = 0,
    int joinTimeEnd = 0,
    List<String> excludeUserIDList = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberListByJoinTimeFilter',
              _buildParam({
                'groupID': groupID,
                'offset': offset,
                'count': count,
                'joinTimeBegin': joinTimeBegin,
                'joinTimeEnd': joinTimeEnd,
                'excludeUserIDList': excludeUserIDList,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 进群验证设置
  /// [groupID] 群ID
  /// [needVerification] 进群设置，参考[GroupVerification]类
  Future<dynamic> setGroupVerification({
    required String groupID,
    required int needVerification,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupVerification',
          _buildParam({
            'groupID': groupID,
            'needVerification': needVerification,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 不允许通过群获取成员资料
  /// [groupID] 群ID
  /// [status] 0：关闭，1：打开
  Future<dynamic> setGroupLookMemberInfo({
    required String groupID,
    required int status,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupLookMemberInfo',
          _buildParam({
            'groupID': groupID,
            'status': status,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 不允许通过群添加好友
  /// [groupID] 群ID
  /// [status] 0：关闭，1：打开
  Future<dynamic> setGroupApplyMemberFriend({
    required String groupID,
    required int status,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGroupApplyMemberFriend',
          _buildParam({
            'groupID': groupID,
            'status': status,
            'operationID': Utils.checkOperationID(operationID),
          }));

  /// 获取群拥有者，管理员
  /// [groupId] 群ID
  Future<List<GroupMembersInfo>> getGroupOwnerAndAdmin({
    required String groupID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getGroupMemberOwnerAndAdmin',
              _buildParam({
                'groupID': groupID,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 查询群
  /// [groupID] 群id
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  /// [isSearchUserID] 是否以关键词搜成员id
  /// [isSearchMemberNickname] 是否以关键词搜索成员昵称
  /// [offset] 开始index
  /// [count] 每次获取的总数
  Future<List<GroupMembersInfo>> searchGroupMembers({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchGroupMembers',
              _buildParam({
                'searchParam': {
                  'groupID': groupID,
                  'keywordList': keywordList,
                  'isSearchUserID': isSearchUserID,
                  'isSearchMemberNickname': isSearchMemberNickname,
                  'offset': offset,
                  'count': count,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 查询群
  /// [groupID] 群id
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  /// [isSearchUserID] 是否以关键词搜成员id
  /// [isSearchMemberNickname] 是否以关键词搜索成员昵称
  /// [offset] 开始index
  /// [count] 每次获取的总数
  Future<List<dynamic>> searchGroupMembersListMap({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchGroupMembers',
              _buildParam({
                'searchParam': {
                  'groupID': groupID,
                  'keywordList': keywordList,
                  'isSearchUserID': isSearchUserID,
                  'isSearchMemberNickname': isSearchMemberNickname,
                  'offset': offset,
                  'count': count,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toListMap(value));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "groupManager";
    return param;
  }
}
