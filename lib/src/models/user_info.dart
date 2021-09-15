class UserInfo {
  String uid;
  String? name;
  String? icon;
  int? gender;
  String? mobile;
  String? birth;
  String? email;
  String? ex;
  String? comment;
  int? isInBlackList;
  String? reqMessage;
  String? applyTime;
  int? flag;

  UserInfo(
      {required this.uid,
      this.name,
      this.icon,
      this.gender,
      this.mobile,
      this.birth,
      this.email,
      this.ex,
      this.comment,
      this.isInBlackList,
      this.reqMessage,
      this.applyTime,
      this.flag});

  UserInfo.fromJson(Map<String, dynamic> json) : uid = json['uid'] {
    name = json['name'];
    icon = json['icon'];
    gender = json['gender'];
    mobile = json['mobile'];
    birth = json['birth'];
    email = json['email'];
    ex = json['ex'];
    comment = json['comment'];
    isInBlackList = json['isInBlackList'];
    reqMessage = json['reqMessage'];
    applyTime = json['applyTime'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['birth'] = this.birth;
    data['email'] = this.email;
    data['ex'] = this.ex;
    data['comment'] = this.comment;
    data['isInBlackList'] = this.isInBlackList;
    data['reqMessage'] = this.reqMessage;
    data['applyTime'] = this.applyTime;
    data['flag'] = this.flag;
    return data;
  }

  String getShowName() {
    if (null != comment && comment!.trim().isNotEmpty) {
      return comment!;
    } else if (null != name && name!.trim().isNotEmpty) {
      return name!;
    }
    return uid;
  }

  bool get isMan => gender == 1;

  bool get isWoman => gender == 2;

  ///  blacklist
  bool get isBlocked => isInBlackList == 1;

  /// friend application waiting handle
  bool get isWaitingHandle => flag == 0;

  /// friend application agreed
  bool get isAgreed => flag == 1;

  /// friend application rejected
  bool get isRejected => flag == -1;

  /// exist friendship
  bool get isFriendship => isAgreed;
}
