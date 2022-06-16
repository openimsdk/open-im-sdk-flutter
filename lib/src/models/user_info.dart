/// Is a friend not in the blacklist
/// 是好友不在黑名单
/// Not a friend on the blacklist
/// 不是好友在黑名单
/// Not a friend is not on the blacklist
/// 不是好友不在黑名单
class UserInfo {
  String? userID;
  String? nickname;
  String? faceURL;
  int? gender;
  String? phoneNumber;
  int? birth;
  String? email;
  String? ex;
  int? createTime;
  String? remark;

  /// User's public profile（用户公开的资料）
  PublicUserInfo? publicInfo;

  /// Only friends can view information（好友才能查看的资料）
  FriendInfo? friendInfo;

  /// blacklist information（黑名单资料）
  BlacklistInfo? blackInfo;

  bool? isFriendship;

  bool? isBlacklist;

  /// 全局免打扰
  int? globalRecvMsgOpt;

  UserInfo({
    this.publicInfo,
    this.friendInfo,
    this.blackInfo,
    this.isFriendship,
    this.isBlacklist,
    //
    this.userID,
    this.nickname,
    this.faceURL,
    this.phoneNumber,
    this.birth,
    this.gender,
    this.email,
    this.ex,
    this.createTime,
    this.remark,
    this.globalRecvMsgOpt,
  });

  // UserInfo.self(Map<String, dynamic> json) {
  //   userID = json['userID'];
  //   nickname = json['nickname'];
  //   faceURL = json['faceURL'];
  //   gender = json['gender'];
  //   phoneNumber = json['phoneNumber'];
  //   birth = json['birth'];
  //   email = json['email'];
  //   ex = json['ex'];
  //   createTime = json['createTime'];
  // }

  UserInfo.fromJson(Map<String, dynamic> json) {
    publicInfo = json['publicInfo'] != null
        ? PublicUserInfo.fromJson(json['publicInfo'])
        : null;
    friendInfo = json['friendInfo'] != null
        ? FriendInfo.fromJson(json['friendInfo'])
        : null;
    blackInfo = json['blackInfo'] != null
        ? BlacklistInfo.fromJson(json['blackInfo'])
        : null;
    //
    isFriendship = friendInfo != null;
    isBlacklist = blackInfo != null;

    userID = json['userID'] ?? _userID;
    nickname = json['nickname'] ?? _nickname;
    faceURL = json['faceURL'] ?? _faceUrl;
    gender = json['gender'] ?? _gender;
    phoneNumber = json['phoneNumber'] ?? _phoneNumber;
    birth = json['birth'] ?? _birth;
    email = json['email'] ?? _email;
    remark = json['remark'] ?? _remark;
    ex = json['ex'] ?? _ex;
    createTime = json['createTime'];
    globalRecvMsgOpt = json['globalRecvMsgOpt'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['publicInfo'] = this.publicInfo?.toJson();
    data['friendInfo'] = this.friendInfo?.toJson();
    data['blackInfo'] = this.blackInfo?.toJson();
    //
    data['isFriendship'] = this.isFriendship;
    data['isBlacklist'] = this.isBlacklist;
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['birth'] = this.birth;
    data['email'] = this.email;
    data['ex'] = this.ex;
    data['createTime'] = this.createTime;
    data['remark'] = this.remark;
    data['globalRecvMsgOpt'] = this.globalRecvMsgOpt;
    return data;
  }

  // bool get isFriendship => null != friendInfo;
  //
  // bool get isBlacklist => null != blackInfo;

  bool get isMale => gender == 1;

  String get _userID => isFriendship!
      ? friendInfo!.userID!
      : (isBlacklist! ? blackInfo!.userID! : publicInfo!.userID!);

  String? get _nickname => isFriendship!
      ? friendInfo?.nickname
      : (isBlacklist! ? blackInfo?.nickname : publicInfo?.nickname);

  String? get _faceUrl => isFriendship!
      ? friendInfo?.faceURL
      : (isBlacklist! ? blackInfo?.faceURL : publicInfo?.faceURL);

  int? get _gender => isFriendship!
      ? friendInfo?.gender
      : (isBlacklist! ? blackInfo?.gender : publicInfo?.gender);

  String? get _ex => isFriendship!
      ? friendInfo?.ex
      : (isBlacklist! ? blackInfo?.ex : publicInfo?.ex);

  String? get _phoneNumber => friendInfo?.phoneNumber;

  int? get _birth => friendInfo?.birth;

  String? get _email => friendInfo?.email;

  String? get _remark => friendInfo?.remark;

  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfo &&
          runtimeType == other.runtimeType &&
          userID == other.userID;

  @override
  int get hashCode => userID.hashCode;
}

class PublicUserInfo {
  String? userID;
  String? nickname;
  String? faceURL;
  int? gender;
  int? appMangerLevel;
  String? ex;

  PublicUserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.appMangerLevel,
    this.ex,
  });

  PublicUserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    appMangerLevel = json['appMangerLevel'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['appMangerLevel'] = this.appMangerLevel;
    data['ex'] = this.ex;
    return data;
  }
}

class FriendInfo {
  String? userID;
  String? nickname;
  String? faceURL;
  int? gender;
  String? phoneNumber;
  int? birth;
  String? email;
  String? remark;
  String? ex;
  int? createTime;
  int? addSource;
  String? operatorUserID;

  FriendInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.phoneNumber,
    this.birth,
    this.email,
    this.remark,
    this.ex,
    this.createTime,
    this.addSource,
    this.operatorUserID,
  });

  FriendInfo.fromJson(Map<String, dynamic> json) {
    // ownerUserID = json['ownerUserID'];
    userID = json['userID'];
    remark = json['remark'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    birth = json['birth'];
    email = json['email'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    // data['ownerUserID'] = this.ownerUserID;
    data['userID'] = this.userID;
    data['remark'] = this.remark;
    data['createTime'] = this.createTime;
    data['addSource'] = this.addSource;
    data['operatorUserID'] = this.operatorUserID;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['birth'] = this.birth;
    data['email'] = this.email;
    data['ex'] = this.ex;
    return data;
  }
}

class BlacklistInfo {
  String? userID;
  String? nickname;
  String? faceURL;
  int? gender;
  int? createTime;
  int? addSource;
  String? operatorUserID;
  String? ex;

  BlacklistInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.createTime,
    this.addSource,
    this.operatorUserID,
    this.ex,
  });

  BlacklistInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['createTime'] = this.createTime;
    data['addSource'] = this.addSource;
    data['operatorUserID'] = this.operatorUserID;
    data['ex'] = this.ex;
    return data;
  }
}

class FriendshipInfo {
  String? userID;

  /// 1 means friend (and not blacklist)
  /// 1表示好友（并且不是黑名单）
  int? result;

  FriendshipInfo({this.userID, this.result});

  FriendshipInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['result'] = this.result;
    return data;
  }
}

class FriendApplicationInfo {
  String? fromUserID;
  String? fromNickname;
  String? fromFaceURL;
  int? fromGender;
  String? toUserID;
  String? toNickname;
  String? toFaceURL;
  int? toGender;
  int? handleResult;
  String? reqMsg;
  int? createTime;
  String? handlerUserID;
  String? handleMsg;
  int? handleTime;
  String? ex;

  FriendApplicationInfo(
      {this.fromUserID,
      this.fromNickname,
      this.fromFaceURL,
      this.fromGender,
      this.toUserID,
      this.toNickname,
      this.toFaceURL,
      this.toGender,
      this.handleResult,
      this.reqMsg,
      this.createTime,
      this.handlerUserID,
      this.handleMsg,
      this.handleTime,
      this.ex});

  FriendApplicationInfo.fromJson(Map<String, dynamic> json) {
    fromUserID = json['fromUserID'];
    fromNickname = json['fromNickname'];
    fromFaceURL = json['fromFaceURL'];
    fromGender = json['fromGender'];
    toUserID = json['toUserID'];
    toNickname = json['toNickname'];
    toFaceURL = json['toFaceURL'];
    toGender = json['toGender'];
    handleResult = json['handleResult'];
    reqMsg = json['reqMsg'];
    createTime = json['createTime'];
    handlerUserID = json['handlerUserID'];
    handleMsg = json['handleMsg'];
    handleTime = json['handleTime'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['fromUserID'] = this.fromUserID;
    data['fromNickname'] = this.fromNickname;
    data['fromFaceURL'] = this.fromFaceURL;
    data['fromGender'] = this.fromGender;
    data['toUserID'] = this.toUserID;
    data['toNickname'] = this.toNickname;
    data['toFaceURL'] = this.toFaceURL;
    data['toGender'] = this.toGender;
    data['handleResult'] = this.handleResult;
    data['reqMsg'] = this.reqMsg;
    data['createTime'] = this.createTime;
    data['handlerUserID'] = this.handlerUserID;
    data['handleMsg'] = this.handleMsg;
    data['handleTime'] = this.handleTime;
    data['ex'] = this.ex;
    return data;
  }

  /// friend application waiting handle
  bool get isWaitingHandle => handleResult == 0;

  /// friend application agreed
  bool get isAgreed => handleResult == 1;

  /// friend application rejected
  bool get isRejected => handleResult == -1;
}
