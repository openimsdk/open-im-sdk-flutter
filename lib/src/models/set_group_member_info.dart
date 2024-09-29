class SetGroupMemberInfo {
  SetGroupMemberInfo({
    required this.groupID,
    required this.userID,
    this.roleLevel,
    this.nickname,
    this.faceURL,
    this.ex,
  });

  final String groupID;
  final String userID;
  final int? roleLevel;
  final String? nickname;
  final String? faceURL;
  final String? ex;

  SetGroupMemberInfo.fromJson(Map<String, dynamic> json)
      : groupID = json['groupID'],
        userID = json['userID'],
        roleLevel = json['roleLevel'],
        nickname = json['nickname'],
        faceURL = json['faceURL'],
        ex = json['ex'];

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupID'] = groupID;
    data['userID'] = userID;
    data['roleLevel'] = roleLevel;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    return data;
  }

  @override
  String toString() {
    return 'SetGroupMemberInfo{groupID: $groupID, userID: $userID, roleLevel: $roleLevel, nickname: $nickname, faceURL: $faceURL, ex: $ex}';
  }
}
