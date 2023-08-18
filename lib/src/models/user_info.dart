/// Is a friend not in the blacklist
/// 是好友不在黑名单
/// Not a friend on the blacklist
/// 不是好友在黑名单
/// Not a friend is not on the blacklist
/// 不是好友不在黑名单
class UserInfo {
  /// 用户id
  String? userID;

  /// 用户昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 性别
  int? gender;

  /// 手机号
  String? phoneNumber;

  /// 出生时间
  int? birth;

  /// 邮箱
  String? email;

  /// 扩展字段
  String? ex;

  /// 创建时间
  int? createTime;

  /// 备注
  String? remark;

  /// 全局免打扰 0：正常；1：不接受消息；2：接受在线消息不接受离线消息；
  int? globalRecvMsgOpt;

  /// 是允许添加为好友  1：允许，2：否
  int? allowAddFriend;

  /// 新消息铃声   1：允许，2：否
  int? allowBeep;

  /// 新消息震动   1：允许，2：否
  int? allowVibration;

  /// 禁止登录
  int? forbidden;

  /// 用户公开的资料
  PublicUserInfo? publicInfo;

  /// 好友才能查看的资料
  FriendInfo? friendInfo;

  /// 黑名单资料
  BlacklistInfo? blackInfo;

  /// 是否好友关系
  bool? isFriendship;

  /// 是否黑名单
  bool? isBlacklist;

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
    this.allowAddFriend,
    this.allowBeep,
    this.allowVibration,
    this.forbidden,
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
    allowAddFriend = json['allowAddFriend'];
    allowBeep = json['allowBeep'];
    allowVibration = json['allowVibration'];
    forbidden = json['forbidden'];
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
    data['allowAddFriend'] = this.allowAddFriend;
    data['allowBeep'] = this.allowBeep;
    data['allowVibration'] = this.allowVibration;
    data['forbidden'] = this.forbidden;
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

/// 公开的资料
class PublicUserInfo {
  /// 用户id
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 性别
  int? gender;

  /// AppOrdinaryUsers = 1  AppAdmin = 2
  int? appMangerLevel;

  /// 扩展信息
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

/// 好友信息
class FriendInfo {
  /// 用户id
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 性别
  int? gender;

  /// 手机号
  String? phoneNumber;

  /// 出生日期
  int? birth;

  /// 邮箱
  String? email;

  /// 备注
  String? remark;

  /// 扩展字段
  String? ex;

  /// 创建时间
  int? createTime;

  /// 添加方式
  int? addSource;

  /// 操作者id
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

  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }
}

/// 黑名单信息
class BlacklistInfo {
  /// 用户id
  String? userID;

  /// 昵称
  String? nickname;

  /// 头像
  String? faceURL;

  /// 性别
  int? gender;

  /// 创建时间
  int? createTime;

  /// 添加方式
  int? addSource;

  /// 操作者
  String? operatorUserID;

  /// 扩展信息
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

/// 关系
class FriendshipInfo {
  /// 用户id
  String? userID;

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

/// 好友申请信息
class FriendApplicationInfo {
  /// 发起者用户id
  String? fromUserID;

  /// 发起者用户昵称
  String? fromNickname;

  /// 发起者用户头像
  String? fromFaceURL;

  /// 发起者性别
  int? fromGender;

  /// 接收者用户id
  String? toUserID;

  /// 接收者用户昵称
  String? toNickname;

  /// 接收者头像
  String? toFaceURL;

  /// 接收者性别
  int? toGender;

  /// 处理结果
  int? handleResult;

  /// 请求消息
  String? reqMsg;

  /// 创建时间
  int? createTime;

  /// 处理者id
  String? handlerUserID;

  /// 处理备注
  String? handleMsg;

  ///  处理时间
  int? handleTime;

  /// 扩展字段
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

  /// 等待处理
  bool get isWaitingHandle => handleResult == 0;

  /// 已同意
  bool get isAgreed => handleResult == 1;

  /// 已拒绝
  bool get isRejected => handleResult == -1;
}

class UserStatusInfo {
  /// 用户id
  String? userID;

  /// 状态
  int? status;

  /// 平台ID
  List<int>? platformIDs;

  UserStatusInfo({
    this.userID,
    this.status,
    this.platformIDs,
  });

  UserStatusInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    status = json['status'];
    platformIDs = json['platformIDs'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['status'] = this.status;
    data['platformIDs'] = this.platformIDs;
    return data;
  }
}
