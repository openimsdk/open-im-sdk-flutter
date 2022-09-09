import 'dart:io';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class Message {
  /// 消息id，唯一标识
  String? clientMsgID;

  /// 服务端生成的id
  String? serverMsgID;

  /// 创建时间
  int? createTime;

  /// 发送时间
  int? sendTime;

  /// 会话类型[ConversationType]
  int? sessionType;

  /// 发送者id
  String? sendID;

  /// 接收者id
  String? recvID;

  /// 来源
  int? msgFrom;

  /// 消息类型[MessageType]
  int? contentType;

  /// 平台[Platform]
  int? platformID;

  /// 发送者昵称
  String? senderNickname;

  /// 发送者头像
  String? senderFaceUrl;

  /// 群ID
  String? groupID;

  /// 消息内容
  String? content;

  /// 消息的seq
  int? seq;

  /// 是否已读
  bool? isRead;

  /// 已读时间
  int? hasReadTime;

  /// 消息发送状态[MessageStatus]
  int? status;

  /// 离线显示内容
  OfflinePushInfo? offlinePush;

  /// 附加信息
  String? attachedInfo;

  /// 扩展信息
  String? ex;

  /// 自定义扩展信息，目前用于客服端处理消息时间分段
  dynamic ext;

  /// 图片
  PictureElem? pictureElem;

  /// 语音
  SoundElem? soundElem;

  /// 视频
  VideoElem? videoElem;

  /// 文件
  FileElem? fileElem;

  /// @信息
  AtElem? atElem;

  /// 位置
  LocationElem? locationElem;

  /// 自定义
  CustomElem? customElem;

  /// 引用
  QuoteElem? quoteElem;

  /// 合并
  MergeElem? mergeElem;

  /// 通知
  NotificationElem? notificationElem;

  /// 自定义表情
  FaceElem? faceElem;

  /// 附加信息
  AttachedInfoElem? attachedInfoElem;

  Message({
    this.clientMsgID,
    this.serverMsgID,
    this.createTime,
    this.sendTime,
    this.sessionType,
    this.sendID,
    this.recvID,
    this.msgFrom,
    this.contentType,
    this.platformID,
    this.senderNickname,
    this.senderFaceUrl,
    this.groupID,
    this.content,
    this.seq,
    this.isRead,
    this.hasReadTime,
    this.status,
    this.offlinePush,
    this.attachedInfo,
    this.ex,
    this.ext,
    this.pictureElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.atElem,
    this.locationElem,
    this.customElem,
    this.quoteElem,
    this.mergeElem,
    this.notificationElem,
    this.faceElem,
    this.attachedInfoElem,
  });

  Message.fromJson(Map<String, dynamic> json) {
    clientMsgID = json['clientMsgID'];
    serverMsgID = json['serverMsgID'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    sendID = json['sendID'];
    recvID = json['recvID'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    platformID = json['platformID'];
    senderNickname = json['senderNickname'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    content = json['content'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    offlinePush = json['offlinePush'] != null
        ? OfflinePushInfo.fromJson(json['offlinePush'])
        : null;
    attachedInfo = json['attachedInfo'];
    ex = json['ex'];
    ext = json['ext'];
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null
        ? PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem = json['soundElem'] != null
        ? SoundElem.fromJson(json['soundElem'])
        : null;
    videoElem = json['videoElem'] != null
        ? VideoElem.fromJson(json['videoElem'])
        : null;
    fileElem =
        json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    atElem = json['atElem'] != null ? AtElem.fromJson(json['atElem']) : null;
    locationElem = json['locationElem'] != null
        ? LocationElem.fromJson(json['locationElem'])
        : null;

    customElem = json['customElem'] != null
        ? CustomElem.fromJson(json['customElem'])
        : null;
    quoteElem = json['quoteElem'] != null
        ? QuoteElem.fromJson(json['quoteElem'])
        : null;
    mergeElem = json['mergeElem'] != null
        ? MergeElem.fromJson(json['mergeElem'])
        : null;
    notificationElem = json['notificationElem'] != null
        ? NotificationElem.fromJson(json['notificationElem'])
        : null;
    faceElem =
        json['faceElem'] != null ? FaceElem.fromJson(json['faceElem']) : null;
    attachedInfoElem = json['attachedInfoElem'] != null
        ? AttachedInfoElem.fromJson(json['attachedInfoElem'])
        : null;
    hasReadTime = json['hasReadTime'] ?? attachedInfoElem?.hasReadTime;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['clientMsgID'] = this.clientMsgID;
    data['serverMsgID'] = this.serverMsgID;
    data['createTime'] = this.createTime;
    data['sendTime'] = this.sendTime;
    data['sendID'] = this.sendID;
    data['recvID'] = this.recvID;
    data['msgFrom'] = this.msgFrom;
    data['contentType'] = this.contentType;
    data['platformID'] = this.platformID;
    data['senderNickname'] = this.senderNickname;
    data['senderFaceUrl'] = this.senderFaceUrl;
    data['groupID'] = this.groupID;
    data['content'] = this.content;
    data['seq'] = this.seq;
    data['isRead'] = this.isRead;
    data['hasReadTime'] = this.hasReadTime;
    data['status'] = this.status;
    data['offlinePush'] = this.offlinePush?.toJson();
    data['attachedInfo'] = this.attachedInfo;
    data['ex'] = this.ex;
    data['ext'] = this.ext;
    data['sessionType'] = this.sessionType;
    data['pictureElem'] = this.pictureElem?.toJson();
    data['soundElem'] = this.soundElem?.toJson();
    data['videoElem'] = this.videoElem?.toJson();
    data['fileElem'] = this.fileElem?.toJson();
    data['atElem'] = this.atElem?.toJson();
    data['locationElem'] = this.locationElem?.toJson();
    data['customElem'] = this.customElem?.toJson();
    data['quoteElem'] = this.quoteElem?.toJson();
    data['mergeElem'] = this.mergeElem?.toJson();
    data['notificationElem'] = this.notificationElem?.toJson();
    data['faceElem'] = this.faceElem?.toJson();
    data['attachedInfoElem'] = this.attachedInfoElem?.toJson();
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          clientMsgID == other.clientMsgID;

  @override
  int get hashCode => clientMsgID.hashCode;

  void update(Message message) {
    if (this != message) return;
    serverMsgID = message.serverMsgID;
    createTime = message.createTime;
    sendTime = message.sendTime;
    sendID = message.sendID;
    recvID = message.recvID;
    msgFrom = message.msgFrom;
    contentType = message.contentType;
    platformID = message.platformID;
    senderNickname = message.senderNickname;
    senderFaceUrl = message.senderFaceUrl;
    groupID = message.groupID;
    content = message.content;
    seq = message.seq;
    isRead = message.isRead;
    hasReadTime = message.hasReadTime;
    status = message.status;
    offlinePush = message.offlinePush;
    attachedInfo = message.attachedInfo;
    ex = message.ex;
    ext = message.ext;
    sessionType = message.sessionType;
    pictureElem = message.pictureElem;
    soundElem = message.soundElem;
    videoElem = message.videoElem;
    fileElem = message.fileElem;
    atElem = message.atElem;
    locationElem = message.locationElem;
    customElem = message.customElem;
    quoteElem = message.quoteElem;
    mergeElem = message.mergeElem;
    notificationElem = message.notificationElem;
    faceElem = message.faceElem;
    attachedInfoElem = message.attachedInfoElem;
  }

  /// 单聊消息
  bool get isSingleChat => sessionType == ConversationType.single;

  /// 群聊消息
  bool get isGroupChat =>
      sessionType == ConversationType.group ||
      sessionType == ConversationType.superGroup;
}

/// 图片消息内容
class PictureElem {
  /// 原路径
  String? sourcePath;

  /// 原图对象
  PictureInfo? sourcePicture;

  /// 大图对象
  PictureInfo? bigPicture;

  /// 缩率图对象
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
    final data = Map<String, dynamic>();
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

/// 图片信息
class PictureInfo {
  /// id
  String? uuid;

  /// 图片mime类型
  String? type;

  /// 大小
  int? size;

  /// 宽度
  int? width;

  /// 长度
  int? height;

  /// 图片URL地址
  String? url;

  PictureInfo(
      {this.uuid, this.type, this.size, this.width, this.height, this.url});

  PictureInfo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }
}

/// 语音消息内容
class SoundElem {
  /// id
  String? uuid;

  /// 原路径
  String? soundPath;

  /// url地址
  String? sourceUrl;

  /// 大小
  int? dataSize;

  /// 时间s
  int? duration;

  SoundElem(
      {this.uuid,
      this.soundPath,
      this.sourceUrl,
      this.dataSize,
      this.duration});

  SoundElem.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    soundPath = json['soundPath'];
    sourceUrl = json['sourceUrl'];
    dataSize = json['dataSize'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['soundPath'] = this.soundPath;
    data['sourceUrl'] = this.sourceUrl;
    data['dataSize'] = this.dataSize;
    data['duration'] = this.duration;
    return data;
  }
}

/// 视频消息内容
class VideoElem {
  /// 视频路径
  String? videoPath;

  /// uuid
  String? videoUUID;

  /// 视频的url地址
  String? videoUrl;

  /// mime类型
  String? videoType;

  /// 大小
  int? videoSize;

  /// 时长s
  int? duration;

  /// 缩率图路径
  String? snapshotPath;

  /// 缩率图uuid
  String? snapshotUUID;

  /// 缩率图大小
  int? snapshotSize;

  /// 缩率图URL地址
  String? snapshotUrl;

  /// 缩率图宽度
  int? snapshotWidth;

  /// 缩率图高度
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
    final data = Map<String, dynamic>();
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

/// 文件消息内容
class FileElem {
  /// 文件路径
  String? filePath;

  /// uuid
  String? uuid;

  /// 文件URL地址
  String? sourceUrl;

  /// 文件名
  String? fileName;

  /// 文件大小
  int? fileSize;

  FileElem(
      {this.filePath, this.uuid, this.sourceUrl, this.fileName, this.fileSize});

  FileElem.fromJson(Map<String, dynamic> json) {
    filePath = json['filePath'];
    uuid = json['uuid'];
    sourceUrl = json['sourceUrl'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['filePath'] = this.filePath;
    data['uuid'] = this.uuid;
    data['sourceUrl'] = this.sourceUrl;
    data['fileName'] = this.fileName;
    data['fileSize'] = this.fileSize;
    return data;
  }
}

/// @消息内容
class AtElem {
  /// 消息内容
  String? text;

  /// 被@的用户ID列表
  List<String>? atUserList;

  /// 是否包含自己
  bool? isAtSelf;

  /// 被@的用户ID跟昵称关系列表，用于将消息内容里的用户id替换为昵称显示
  List<AtUserInfo>? atUsersInfo;

  /// 被回复的消息体，回复别人并@了人
  Message? quoteMessage;

  AtElem({
    this.text,
    this.atUserList,
    this.isAtSelf,
    this.atUsersInfo,
    this.quoteMessage,
  });

  AtElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['atUserList'] is List) {
      atUserList = (json['atUserList'] as List).map((e) => '$e').toList();
    }
    isAtSelf = json['isAtSelf'];
    if (json['atUsersInfo'] is List) {
      atUsersInfo = (json['atUsersInfo'] as List)
          .map((e) => AtUserInfo.fromJson(e))
          .toList();
    }
    quoteMessage = null != json['quoteMessage']
        ? Message.fromJson(json['quoteMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['text'] = this.text;
    data['atUserList'] = this.atUserList;
    data['isAtSelf'] = this.isAtSelf;
    data['atUsersInfo'] = this.atUsersInfo?.map((e) => e.toJson()).toList();
    data['quoteMessage'] = this.quoteMessage?.toJson();
    return data;
  }
}

/// 位置消息内日
class LocationElem {
  /// 位置描述
  String? description;

  /// 经度
  double? longitude;

  /// 纬度
  double? latitude;

  LocationElem({this.description, this.longitude, this.latitude});

  LocationElem.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['longitude'] is int) {
      longitude = (json['longitude'] as int).toDouble();
    } else {
      longitude = json['longitude'];
    }

    if (json['latitude'] is int) {
      latitude = (json['latitude'] as int).toDouble();
    } else {
      latitude = json['latitude'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

/// 自定义消息
class CustomElem {
  /// 自定义数据
  String? data;

  /// 扩展内容
  String? extension;

  /// 描述内容
  String? description;

  CustomElem({this.data, this.extension, this.description});

  CustomElem.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    extension = json['extension'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['data'] = this.data;
    data['extension'] = this.extension;
    data['description'] = this.description;
    return data;
  }
}

/// 引用消息（被回复的消息）
class QuoteElem {
  /// 回复内容内容
  String? text;

  /// 被回复的消息体
  Message? quoteMessage;

  QuoteElem({this.text, this.quoteMessage});

  QuoteElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['quoteMessage'] is Map) {
      quoteMessage = Message.fromJson(json['quoteMessage']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['text'] = this.text;
    data['quoteMessage'] = this.quoteMessage?.toJson();
    return data;
  }
}

/// 合并消息体
class MergeElem {
  /// 标题
  String? title;

  /// 摘要
  List<String>? abstractList;

  /// 具体选择合并的消息列表
  List<Message>? multiMessage;

  MergeElem({this.title, this.abstractList, this.multiMessage});

  MergeElem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['abstractList'] is List) {
      abstractList = json['abstractList'].cast<String>();
    }
    if (json['multiMessage'] is List) {
      multiMessage = (json['multiMessage'] as List)
          .map((e) => Message.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['title'] = this.title;
    data['abstractList'] = this.abstractList;
    data['multiMessage'] = this.multiMessage?.map((e) => e.toJson()).toList();
    return data;
  }
}

/// 通知
class NotificationElem {
  /// 详情
  String? detail;

  /// 提示
  String? defaultTips;

  NotificationElem({this.detail, this.defaultTips});

  NotificationElem.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    defaultTips = json['defaultTips'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['detail'] = this.detail;
    data['defaultTips'] = this.defaultTips;
    return data;
  }
}

/// 表情
class FaceElem {
  /// 位置表情，用户端对端自定义内嵌的表情包
  int? index;

  /// 其他表情，如URL表情直接返回url
  String? data;

  FaceElem({this.index, this.data});

  FaceElem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['index'] = this.index;
    data['data'] = this.data;
    return data;
  }
}

/// 附加信息
class AttachedInfoElem {
  /// 群消息已读信息
  GroupHasReadInfo? groupHasReadInfo;

  /// 是否为私聊消息（阅后即焚消息），单聊有效
  bool? isPrivateChat;

  /// 已读时间
  int? hasReadTime;

  /// 离线不发送推送
  bool? notSenderNotificationPush;

  AttachedInfoElem({
    this.groupHasReadInfo,
    this.isPrivateChat,
    this.hasReadTime,
    this.notSenderNotificationPush,
  });

  AttachedInfoElem.fromJson(Map<String, dynamic> json) {
    groupHasReadInfo = json['groupHasReadInfo'] == null
        ? null
        : GroupHasReadInfo.fromJson(json['groupHasReadInfo']);
    isPrivateChat = json['isPrivateChat'];
    hasReadTime = json['hasReadTime'];
    notSenderNotificationPush = json['notSenderNotificationPush'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupHasReadInfo'] = this.groupHasReadInfo?.toJson();
    data['isPrivateChat'] = this.isPrivateChat;
    data['hasReadTime'] = this.hasReadTime;
    data['notSenderNotificationPush'] = this.notSenderNotificationPush;
    return data;
  }
}

/// 群消息已读信息
class GroupHasReadInfo {
  /// 已读的用户id列表
  List<String>? hasReadUserIDList;

  /// 已读总数
  int? hasReadCount;

  /// 发送此条消息时的群人数
  int? groupMemberCount;

  GroupHasReadInfo.fromJson(Map<String, dynamic> json) {
    if (json['hasReadUserIDList'] == null) {
      hasReadUserIDList = <String>[];
    } else {
      hasReadUserIDList = (json['hasReadUserIDList'] as List).cast<String>();
    }
    hasReadCount = json['hasReadCount'] ?? 0;
    groupMemberCount = json['groupMemberCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['hasReadUserIDList'] = this.hasReadUserIDList;
    data['hasReadCount'] = this.hasReadCount;
    data['groupMemberCount'] = this.groupMemberCount;
    return data;
  }
}

/// 消息已读回执信息
class ReadReceiptInfo {
  /// 发送者id
  String? userID;

  /// 群id
  String? groupID;

  /// 已读消息的clientMsgID集合
  List<String>? msgIDList;

  /// 读时间
  int? readTime;

  /// 消息来源
  int? msgFrom;

  /// 消息类型[MessageType]
  int? contentType;

  /// 会话类型[ConversationType]
  int? sessionType;

  ReadReceiptInfo(
      {this.userID,
      this.groupID,
      this.msgIDList,
      this.readTime,
      this.msgFrom,
      this.contentType,
      this.sessionType});

  ReadReceiptInfo.fromJson(Map<String, dynamic> json) {
    userID = json['uid'] ?? json['userID'];
    groupID = json['groupID'];
    if (json['msgIDList'] is List) {
      msgIDList = (json['msgIDList'] as List).map((e) => '$e').toList();
    }
    readTime = json['readTime'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['msgIDList'] = this.msgIDList;
    data['readTime'] = this.readTime;
    data['msgFrom'] = this.msgFrom;
    data['contentType'] = this.contentType;
    data['sessionType'] = this.sessionType;
    return data;
  }
}

/// 离线推送信息
class OfflinePushInfo {
  /// 通知标题
  String? title;

  /// 通知描述
  String? desc;

  /// 扩展内容
  String? ex;

  /// 仅ios有效
  String? iOSPushSound;

  /// 仅ios有效
  bool? iOSBadgeCount;

  OfflinePushInfo(
      {this.title, this.desc, this.ex, this.iOSPushSound, this.iOSBadgeCount});

  OfflinePushInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    ex = json['ex'];
    iOSPushSound = json['iOSPushSound'];
    iOSBadgeCount = json['iOSBadgeCount'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['ex'] = this.ex;
    data['iOSPushSound'] = this.iOSPushSound;
    data['iOSBadgeCount'] = this.iOSBadgeCount;
    return data;
  }
}

/// @消息用户id跟昵称关系对象
class AtUserInfo {
  /// 被@的用户id
  String? atUserID;

  /// 被@的用户昵称
  String? groupNickname;

  AtUserInfo({this.atUserID, this.groupNickname});

  AtUserInfo.fromJson(Map<String, dynamic> json) {
    atUserID = json['atUserID'];
    groupNickname = json['groupNickname'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['atUserID'] = this.atUserID;
    data['groupNickname'] = this.groupNickname;
    return data;
  }
}

/// 消息撤回具体信息
class RevokedInfo {
  /// 撤回者ID
  String? revokerID;

  /// 撤回者群角色 [GroupRoleLevel]
  int? revokerRole;

  /// 撤回者昵称
  String? revokerNickname;

  /// 消息id
  String? clientMsgID;

  /// 撤回时间
  int? revokeTime;

  /// 消息发送时间
  int? sourceMessageSendTime;

  /// 消息发送者
  String? sourceMessageSendID;

  /// 消息发送者昵称
  String? sourceMessageSenderNickname;

  /// 会话类型 [ConversationType]
  int? sessionType;

  RevokedInfo({
    this.revokerID,
    this.revokerRole,
    this.revokerNickname,
    this.clientMsgID,
    this.revokeTime,
    this.sourceMessageSendTime,
    this.sourceMessageSendID,
    this.sourceMessageSenderNickname,
    this.sessionType,
  });

  RevokedInfo.fromJson(Map<String, dynamic> json) {
    revokerID = json['revokerID'];
    revokerRole = json['revokerRole'];
    revokerNickname = json['revokerNickname'];
    clientMsgID = json['clientMsgID'];
    revokeTime = json['revokeTime'];
    sourceMessageSendTime = json['sourceMessageSendTime'];
    sourceMessageSendID = json['sourceMessageSendID'];
    sourceMessageSenderNickname = json['sourceMessageSenderNickname'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['revokerID'] = this.revokerID;
    data['revokerRole'] = this.revokerRole;
    data['revokerNickname'] = this.revokerNickname;
    data['clientMsgID'] = this.clientMsgID;
    data['revokeTime'] = this.revokeTime;
    data['sourceMessageSendTime'] = this.sourceMessageSendTime;
    data['sourceMessageSendID'] = this.sourceMessageSendID;
    data['sourceMessageSenderNickname'] = this.sourceMessageSenderNickname;
    data['sessionType'] = this.sessionType;
    return data;
  }
}

class AdvancedMessage {
  List<Message>? messageList;
  bool? isEnd;
  int? errCode;
  String? errMsg;
  int? lastMinSeq;

  AdvancedMessage({
    this.messageList,
    this.isEnd,
    this.errCode,
    this.errMsg,
    this.lastMinSeq,
  });

  AdvancedMessage.fromJson(Map<String, dynamic> json) {
    messageList = json['messageList'] == null
        ? null
        : (json['messageList'] as List)
            .map((e) => Message.fromJson(e))
            .toList();
    isEnd = json['isEnd'];
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    lastMinSeq = json['lastMinSeq'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['messageList'] = this.messageList?.map((e) => e.toJson()).toList();
    data['isEnd'] = this.isEnd;
    data['errCode'] = this.errCode;
    data['errMsg'] = this.errMsg;
    data['lastMinSeq'] = this.lastMinSeq;
    return data;
  }
}

class RichMessageInfo {
  String? type;
  int? offset;
  int? length;
  String? url;
  String? info;

  RichMessageInfo({
    this.type,
    this.offset,
    this.length,
    this.url,
    this.info,
  });

  RichMessageInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['type'] = this.type;
    data['offset'] = this.offset;
    data['length'] = this.length;
    data['url'] = this.url;
    data['info'] = this.info;
    return data;
  }
}
