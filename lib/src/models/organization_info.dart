/// 部门信息
class DeptInfo {
  /// 部门id
  String? departmentID;

  /// 头像
  String? faceURL;

  /// 显示名
  String? name;

  /// 上一级部门id
  String? parentID;

  /// 排序方式
  int? order;

  /// 部门类型
  int? departmentType;

  /// 创建时间
  int? createTime;

  /// 子部门数量
  int? subDepartmentNum;

  /// 成员数量
  int? memberNum;

  /// 扩展字段
  String? ex;

  /// 附加信息
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

/// 部门成员信息
class DeptMemberInfo {
  /// 用户id
  String? userID;

  /// 用户昵称
  String? nickname;

  /// 英文名
  String? englishName;

  /// 头像
  String? faceURL;

  /// 性别
  int? gender;

  /// 手机号
  String? mobile;

  /// 座机
  String? telephone;

  /// 出生时间
  int? birth;

  /// 邮箱
  String? email;

  /// 所在部门的id
  String? departmentID;

  /// 排序方式
  int? order;

  /// 职位
  String? position;

  /// 是否是领导
  int? leader;

  /// 状态
  int? status;

  /// 创建时间
  int? createTime;

  /// 扩展字段
  String? ex;

  /// 附加信息
  String? attachedInfo;

  /// 搜索时使用
  String? departmentName;

  /// 所在部门的所有上级部门
  List<DeptInfo>? parentDepartmentList;

  DeptMemberInfo({
    this.userID,
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
    this.attachedInfo,
    this.departmentName,
    this.parentDepartmentList,
  });

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
    departmentName = json['departmentName'];
    if (json['parentDepartmentList'] != null) {
      parentDepartmentList = <DeptInfo>[];
      json['parentDepartmentList'].forEach((v) {
        parentDepartmentList!.add(DeptInfo.fromJson(v));
      });
    }
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
    data['departmentName'] = this.departmentName;
    if (this.parentDepartmentList != null) {
      data['parentDepartmentList'] =
          this.parentDepartmentList!.map((v) => v.toJson()).toList();
    }
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
  /// 部门信息
  DeptInfo? department;

  /// 所在部门自己的信息
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
  /// 一级子部门
  List<DeptInfo>? departmentList;

  /// 一级成员
  List<DeptMemberInfo>? departmentMemberList;

  /// 当前部门的所有上一级部门
  List<DeptInfo>? parentDepartmentList;

  DeptMemberAndSubDept({
    this.departmentList,
    this.departmentMemberList,
    this.parentDepartmentList,
  });

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
    if (json['parentDepartmentList'] != null) {
      parentDepartmentList = <DeptInfo>[];
      json['parentDepartmentList'].forEach((v) {
        parentDepartmentList!.add(DeptInfo.fromJson(v));
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
    if (this.parentDepartmentList != null) {
      data['parentDepartmentList'] =
          this.parentDepartmentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 搜索结果
class OrganizationSearchResult {
  /// 部门列表
  List<DeptInfo>? departmentList;

  /// 部门成员列表
  List<DeptMemberInfo>? departmentMemberList;

  OrganizationSearchResult({
    this.departmentList,
    this.departmentMemberList,
  });

  OrganizationSearchResult.fromJson(Map<String, dynamic> json) {
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
