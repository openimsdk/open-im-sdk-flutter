class WorkMomentsInfo {
  int? notificationMsgType;
  String? replyUserName;
  String? replyUserID;
  String? content;
  String? contentID;
  String? workMomentID;
  String? userID;
  String? userName;
  String? faceURL;
  String? workMomentContent;
  int? createTime;

  WorkMomentsInfo(
      {this.notificationMsgType,
      this.replyUserName,
      this.replyUserID,
      this.content,
      this.contentID,
      this.workMomentID,
      this.userID,
      this.userName,
      this.faceURL,
      this.workMomentContent,
      this.createTime});

  WorkMomentsInfo.fromJson(Map<String, dynamic> json) {
    notificationMsgType = json['notificationMsgType'];
    replyUserName = json['replyUserName'];
    replyUserID = json['replyUserID'];
    content = json['content'];
    contentID = json['contentID'];
    workMomentID = json['workMomentID'];
    userID = json['userID'];
    userName = json['userName'];
    faceURL = json['faceURL'];
    workMomentContent = json['workMomentContent'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationMsgType'] = this.notificationMsgType;
    data['replyUserName'] = this.replyUserName;
    data['replyUserID'] = this.replyUserID;
    data['content'] = this.content;
    data['contentID'] = this.contentID;
    data['workMomentID'] = this.workMomentID;
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['faceURL'] = this.faceURL;
    data['workMomentContent'] = this.workMomentContent;
    data['createTime'] = this.createTime;
    return data;
  }
}
