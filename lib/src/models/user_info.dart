class UserInfo {
  /// User ID
  String? userID;

  /// User nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// Gender
  int? gender;

  /// Phone number
  String? phoneNumber;

  /// Date of birth
  int? birth;

  /// Email
  String? email;

  /// Additional information
  String? ex;

  /// Creation time
  int? createTime;

  /// Remark
  String? remark;

  /// Global do not disturb setting:
  /// 0: Normal
  /// 1: Do not accept messages
  /// 2: Accept online messages but not offline messages
  int? globalRecvMsgOpt;

  /// Allow adding as a friend:
  /// 1: Allowed
  /// 2: Not allowed
  int? allowAddFriend;

  /// New message ringtone:
  /// 1: Allowed
  /// 2: Not allowed
  int? allowBeep;

  /// New message vibration:
  /// 1: Allowed
  /// 2: Not allowed
  int? allowVibration;

  /// Prohibited from logging in
  int? forbidden;

  /// User's public information
  PublicUserInfo? publicInfo;

  /// Information visible only to friends
  FriendInfo? friendInfo;

  /// Blacklist information
  BlacklistInfo? blackInfo;

  /// Whether there is a friendship relationship
  bool? isFriendship;

  /// Whether the user is in the blacklist
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
  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// Gender
  int? gender;

  /// App Manager Level:
  /// 1: AppOrdinaryUsers
  /// 2: AppAdmin
  int? appManagerLevel;

  /// Additional information
  String? ex;

  PublicUserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.appManagerLevel,
    this.ex,
  });

  PublicUserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    appManagerLevel = json['appManagerLevel'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['appMangerLevel'] = this.appManagerLevel;
    data['ex'] = this.ex;
    return data;
  }
}

class FriendInfo {
  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// Gender
  int? gender;

  /// Phone number
  String? phoneNumber;

  /// Date of birth
  int? birth;

  /// Email
  String? email;

  /// Remark
  String? remark;

  /// Additional information
  String? ex;

  /// Creation time
  int? createTime;

  /// Add source
  int? addSource;

  /// Operator User ID
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

class BlacklistInfo {
  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// Gender
  int? gender;

  /// Creation time
  int? createTime;

  /// Add source
  int? addSource;

  /// Operator User ID
  String? operatorUserID;

  /// Additional information
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
  /// User ID
  String? userID;

  /// 1 represents a friend (and not in the blacklist)
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
  /// Initiator user ID
  String? fromUserID;

  /// Initiator user nickname
  String? fromNickname;

  /// Initiator user profile picture
  String? fromFaceURL;

  /// Initiator user gender
  int? fromGender;

  /// Recipient user ID
  String? toUserID;

  /// Recipient user nickname
  String? toNickname;

  /// Recipient user profile picture
  String? toFaceURL;

  /// Recipient user gender
  int? toGender;

  /// Handling result
  int? handleResult;

  /// Request message
  String? reqMsg;

  /// Creation time
  int? createTime;

  /// Handler user ID
  String? handlerUserID;

  /// Handling remark
  String? handleMsg;

  /// Handling time
  int? handleTime;

  /// Additional information
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

  /// Waiting to be processed
  bool get isWaitingHandle => handleResult == 0;

  /// Already agreed
  bool get isAgreed => handleResult == 1;

  /// Already rejected
  bool get isRejected => handleResult == -1;
}

class UserStatusInfo {
  /// User ID
  String? userID;

  /// Status
  int? status;

  /// Platform IDs
  List<int>? platformIDs;

  UserStatusInfo({
    this.userID,
    this.status,
    this.platformIDs,
  });

  UserStatusInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    status = json['status'];
    platformIDs = json["platformIDs"] == null
        ? []
        : List<int>.from(json["platformIDs"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['status'] = this.status;
    data['platformIDs'] = List<dynamic>.from(platformIDs!.map((x) => x));
    return data;
  }
}
