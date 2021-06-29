class Message {
  String? clientMsgID;
  String? serverMsgID;
  int? createTime;
  int? sendTime;
  String? sendID;
  String? recvID;
  int? msgFrom;
  int? contentType;
  int? platformID;
  List<String>? forceList;
  String? senderNickName;
  String? senderFaceUrl;
  String? groupID;
  String? content;
  int? seq;
  bool? isRead;
  int? status;
  String? remark;
  dynamic ext;
  int? sessionType;
  PictureElem? pictureElem;
  SoundElem? soundElem;
  VideoElem? videoElem;
  FileElem? fileElem;

  Message(
      {this.clientMsgID,
      this.serverMsgID,
      this.createTime,
      this.sendTime,
      this.sendID,
      this.recvID,
      this.msgFrom,
      this.contentType,
      this.platformID,
      this.forceList,
      this.senderNickName,
      this.senderFaceUrl,
      this.groupID,
      this.content,
      this.seq,
      this.isRead,
      this.status,
      this.remark,
      this.ext,
      this.sessionType,
      this.pictureElem,
      this.soundElem,
      this.videoElem,
      this.fileElem});

  Message.fromJson(Map<String, dynamic> json)
  /*  : clientMsgID = json['clientMsgID']*/ {
    clientMsgID = json['clientMsgID'];
    serverMsgID = json['serverMsgID'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    sendID = json['sendID'];
    recvID = json['RecvID'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    platformID = json['platformID'];
    forceList = json['forceList'];
    senderNickName = json['senderNickName'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    content = json['content'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    remark = json['remark'];
    ext = json['ext'];
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null
        ? new PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem = json['soundElem'] != null
        ? new SoundElem.fromJson(json['soundElem'])
        : null;
    videoElem = json['videoElem'] != null
        ? new VideoElem.fromJson(json['videoElem'])
        : null;
    fileElem = json['fileElem'] != null
        ? new FileElem.fromJson(json['fileElem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientMsgID'] = this.clientMsgID;
    data['serverMsgID'] = this.serverMsgID;
    data['createTime'] = this.createTime;
    data['sendTime'] = this.sendTime;
    data['sendID'] = this.sendID;
    data['RecvID'] = this.recvID;
    data['msgFrom'] = this.msgFrom;
    data['contentType'] = this.contentType;
    data['platformID'] = this.platformID;
    data['forceList'] = this.forceList;
    data['senderNickName'] = this.senderNickName;
    data['senderFaceUrl'] = this.senderFaceUrl;
    data['groupID'] = this.groupID;
    data['content'] = this.content;
    data['seq'] = this.seq;
    data['isRead'] = this.isRead;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['ext'] = this.ext;
    data['sessionType'] = this.sessionType;
    if (this.pictureElem != null) {
      data['pictureElem'] = this.pictureElem?.toJson();
    }
    if (this.soundElem != null) {
      data['soundElem'] = this.soundElem?.toJson();
    }
    if (this.videoElem != null) {
      data['videoElem'] = this.videoElem?.toJson();
    }
    if (this.fileElem != null) {
      data['fileElem'] = this.fileElem?.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (other is Message) {
      return other.id == id;
    }
    return super == other;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  String? get id =>
      clientMsgID == null || clientMsgID!.isEmpty ? serverMsgID : clientMsgID;
}

class PictureElem {
  String? sourcePath;
  PictureInfo? sourcePicture;
  PictureInfo? bigPicture;
  PictureInfo? snapshotPicture;

  PictureElem(
      {this.sourcePath,
      this.sourcePicture,
      this.bigPicture,
      this.snapshotPicture});

  PictureElem.fromJson(Map<String, dynamic> json) {
    sourcePath = json['sourcePath'];
    sourcePicture = json['sourcePicture'] != null
        ? new PictureInfo.fromJson(json['sourcePicture'])
        : null;
    bigPicture = json['bigPicture'] != null
        ? new PictureInfo.fromJson(json['bigPicture'])
        : null;
    snapshotPicture = json['snapshotPicture'] != null
        ? new PictureInfo.fromJson(json['snapshotPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourcePath'] = this.sourcePath;
    if (this.sourcePicture != null) {
      data['sourcePicture'] = this.sourcePicture?.toJson();
    }
    if (this.bigPicture != null) {
      data['bigPicture'] = this.bigPicture?.toJson();
    }
    if (this.snapshotPicture != null) {
      data['snapshotPicture'] = this.snapshotPicture?.toJson();
    }
    return data;
  }
}

class PictureInfo {
  String? uuID;
  String? type;
  int? size;
  int? width;
  int? height;
  String? url;

  PictureInfo(
      {this.uuID, this.type, this.size, this.width, this.height, this.url});

  PictureInfo.fromJson(Map<String, dynamic> json) {
    uuID = json['uuID'];
    type = json['type'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuID'] = this.uuID;
    data['type'] = this.type;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }
}

class SoundElem {
  String? uuID;
  String? soundPath;
  String? sourceUrl;
  int? dataSize;
  int? duration;

  SoundElem(
      {this.uuID,
      this.soundPath,
      this.sourceUrl,
      this.dataSize,
      this.duration});

  SoundElem.fromJson(Map<String, dynamic> json) {
    uuID = json['uuID'];
    soundPath = json['soundPath'];
    sourceUrl = json['sourceUrl'];
    dataSize = json['dataSize'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuID'] = this.uuID;
    data['soundPath'] = this.soundPath;
    data['sourceUrl'] = this.sourceUrl;
    data['dataSize'] = this.dataSize;
    data['duration'] = this.duration;
    return data;
  }
}

class VideoElem {
  String? videoPath;
  String? videoUUID;
  String? videoUrl;
  String? videoType;
  int? videoSize;
  int? duration;
  String? snapshotPath;
  String? snapshotUUID;
  int? snapshotSize;
  String? snapshotUrl;
  int? snapshotWidth;
  int? snapshotHeight;

  VideoElem(
      {this.videoPath,
      this.videoUUID,
      this.videoUrl,
      this.videoType,
      this.videoSize,
      this.duration,
      this.snapshotPath,
      this.snapshotUUID,
      this.snapshotSize,
      this.snapshotUrl,
      this.snapshotWidth,
      this.snapshotHeight});

  VideoElem.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoUUID = json['videoUUID'];
    videoUrl = json['videoUrl'];
    videoType = json['videoType'];
    videoSize = json['videoSize'];
    duration = json['duration'];
    snapshotPath = json['snapshotPath'];
    snapshotUUID = json['snapshotUUID'];
    snapshotSize = json['snapshotSize'];
    snapshotUrl = json['snapshotUrl'];
    snapshotWidth = json['snapshotWidth'];
    snapshotHeight = json['snapshotHeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoPath'] = this.videoPath;
    data['videoUUID'] = this.videoUUID;
    data['videoUrl'] = this.videoUrl;
    data['videoType'] = this.videoType;
    data['videoSize'] = this.videoSize;
    data['duration'] = this.duration;
    data['snapshotPath'] = this.snapshotPath;
    data['snapshotUUID'] = this.snapshotUUID;
    data['snapshotSize'] = this.snapshotSize;
    data['snapshotUrl'] = this.snapshotUrl;
    data['snapshotWidth'] = this.snapshotWidth;
    data['snapshotHeight'] = this.snapshotHeight;
    return data;
  }
}

class FileElem {
  String? filePath;
  String? uuID;
  String? sourceUrl;
  String? fileName;
  int? fileSize;

  FileElem(
      {this.filePath, this.uuID, this.sourceUrl, this.fileName, this.fileSize});

  FileElem.fromJson(Map<String, dynamic> json) {
    filePath = json['filePath'];
    uuID = json['uuID'];
    sourceUrl = json['sourceUrl'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filePath'] = this.filePath;
    data['uuID'] = this.uuID;
    data['sourceUrl'] = this.sourceUrl;
    data['fileName'] = this.fileName;
    data['fileSize'] = this.fileSize;
    return data;
  }
}
