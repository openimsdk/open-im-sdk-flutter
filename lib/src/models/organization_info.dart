class DeptInfo {
  String? departmentID;
  String? faceURL;
  String? name;
  String? parentID;
  int? order;
  int? departmentType;
  int? createTime;
  int? subDepartmentNum;
  int? memberNum;
  String? ex;
  String? attachedInfo;

  DeptInfo(
      {this.departmentID,
      this.faceURL,
      this.name,
      this.parentID,
      this.order,
      this.departmentType,
      this.createTime,
      this.subDepartmentNum,
      this.memberNum,
      this.ex,
      this.attachedInfo});

  DeptInfo.fromJson(Map<String, dynamic> json) {
    departmentID = json['departmentID'];
    faceURL = json['faceURL'];
    name = json['name'];
    parentID = json['parentID'];
    order = json['order'];
    departmentType = json['departmentType'];
    createTime = json['createTime'];
    subDepartmentNum = json['subDepartmentNum'];
    memberNum = json['memberNum'];
    ex = json['ex'];
    attachedInfo = json['attachedInfo'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['departmentID'] = this.departmentID;
    data['faceURL'] = this.faceURL;
    data['name'] = this.name;
    data['parentID'] = this.parentID;
    data['order'] = this.order;
    data['departmentType'] = this.departmentType;
    data['createTime'] = this.createTime;
    data['subDepartmentNum'] = this.subDepartmentNum;
    data['memberNum'] = this.memberNum;
    data['ex'] = this.ex;
    data['attachedInfo'] = this.attachedInfo;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeptInfo &&
          runtimeType == other.runtimeType &&
          departmentID == other.departmentID;

  @override
  int get hashCode => departmentID.hashCode;
}

class DeptMemberInfo {
  String? userID;
  String? nickname;
  String? englishName;
  String? faceURL;
  int? gender;
  String? mobile;
  String? telephone;
  int? birth;
  String? email;
  String? departmentID;
  int? order;
  String? position;
  int? leader;
  int? status;
  int? createTime;
  String? ex;
  String? attachedInfo;

  DeptMemberInfo(
      {this.userID,
      this.nickname,
      this.englishName,
      this.faceURL,
      this.gender,
      this.mobile,
      this.telephone,
      this.birth,
      this.email,
      this.departmentID,
      this.order,
      this.position,
      this.leader,
      this.status,
      this.createTime,
      this.ex,
      this.attachedInfo});

  DeptMemberInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    englishName = json['englishName'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    mobile = json['mobile'];
    telephone = json['telephone'];
    birth = json['birth'];
    email = json['email'];
    departmentID = json['departmentID'];
    order = json['order'];
    position = json['position'];
    leader = json['leader'];
    status = json['status'];
    createTime = json['createTime'];
    ex = json['ex'];
    attachedInfo = json['attachedInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['nickname'] = this.nickname;
    data['englishName'] = this.englishName;
    data['faceURL'] = this.faceURL;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['telephone'] = this.telephone;
    data['birth'] = this.birth;
    data['email'] = this.email;
    data['departmentID'] = this.departmentID;
    data['order'] = this.order;
    data['position'] = this.position;
    data['leader'] = this.leader;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['ex'] = this.ex;
    data['attachedInfo'] = this.attachedInfo;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeptMemberInfo &&
          runtimeType == other.runtimeType &&
          userID == other.userID;

  @override
  int get hashCode => userID.hashCode;
}

/// 用户所在的部门
class UserInDept {
  DeptInfo? department;
  DeptMemberInfo? member;

  UserInDept({this.department, this.member});

  UserInDept.fromJson(Map<String, dynamic> json) {
    department = json['department'] != null
        ? DeptInfo.fromJson(json['department'])
        : null;
    member =
        json['member'] != null ? DeptMemberInfo.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    return data;
  }
}

/// 部门下的子部门跟员工
class DeptMemberAndSubDept {
  List<DeptInfo>? departmentList;
  List<DeptMemberInfo>? departmentMemberList;

  DeptMemberAndSubDept({this.departmentList, this.departmentMemberList});

  DeptMemberAndSubDept.fromJson(Map<String, dynamic> json) {
    if (json['departmentList'] != null) {
      departmentList = <DeptInfo>[];
      json['departmentList'].forEach((v) {
        departmentList!.add(DeptInfo.fromJson(v));
      });
    }
    if (json['departmentMemberList'] != null) {
      departmentMemberList = <DeptMemberInfo>[];
      json['departmentMemberList'].forEach((v) {
        departmentMemberList!.add(DeptMemberInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (this.departmentList != null) {
      data['departmentList'] =
          this.departmentList!.map((v) => v.toJson()).toList();
    }
    if (this.departmentMemberList != null) {
      data['departmentMemberList'] =
          this.departmentMemberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
