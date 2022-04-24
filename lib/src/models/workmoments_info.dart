class WorkMomentsInfo {
  /// 工作圈消息类型    0为普通评论 1为被喜欢 2为AT提醒看的朋友圈
  int? notificationMsgType;
  Comment? comment;

  /// 工作圈id
  String? workMomentID;

  /// 工作圈所属用户
  String? userID;

  /// 工作圈所属用户名字
  String? userName;

  /// 工作圈用户faceurl
  String? faceURL;

  /// 工作圈内容
  String? workMomentContent;

  WorkMomentsInfo(
      {this.notificationMsgType,
      this.comment,
      this.workMomentID,
      this.userID,
      this.userName,
      this.faceURL,
      this.workMomentContent});

  WorkMomentsInfo.fromJson(Map<String, dynamic> json) {
    notificationMsgType = json['notificationMsgType'];
    comment =
        json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    workMomentID = json['workMomentID'];
    userID = json['userID'];
    userName = json['userName'];
    faceURL = json['faceURL'];
    workMomentContent = json['workMomentContent'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['notificationMsgType'] = this.notificationMsgType;
    if (this.comment != null) {
      data['comment'] = this.comment!.toJson();
    }
    data['workMomentID'] = this.workMomentID;
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['faceURL'] = this.faceURL;
    data['workMomentContent'] = this.workMomentContent;
    return data;
  }
}

class Comment {
  /// 回复的用户
  String? userID;

  /// 回复的用户名
  String? userName;

  /// 回复的用户头像
  String? faceURL;

  /// 被回复的用户ID
  String? replyUserID;

  /// 被回复的用户名字
  String? replyUserName;

  /// 回复ID
  String? contentID;

  /// 回复内容
  String? content;

  /// 回复时间
  int? createTime;

  Comment(
      {this.userID,
      this.userName,
      this.faceURL,
      this.replyUserID,
      this.replyUserName,
      this.contentID,
      this.content,
      this.createTime});

  Comment.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    faceURL = json['faceURL'];
    replyUserID = json['replyUserID'];
    replyUserName = json['replyUserName'];
    contentID = json['contentID'];
    content = json['content'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['faceURL'] = this.faceURL;
    data['replyUserID'] = this.replyUserID;
    data['replyUserName'] = this.replyUserName;
    data['contentID'] = this.contentID;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    return data;
  }
}
