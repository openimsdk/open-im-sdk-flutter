class UserInfo {
  String uid;
  String? name;
  String? icon;
  int? gender; // 0 未知，1 男，2 女
  String? mobile;
  String? birth;
  String? email;
  String? ex;
  String? comment;
  int? isInBlackList; // 0 不在黑名单，1 在黑名单
  String? reqMessage;
  String? applyTime;
  int? flag; // //0请求添加好友，1同意添加好友，-1拒绝添加好友

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

  String get nickname => comment ?? name ?? uid;
}
