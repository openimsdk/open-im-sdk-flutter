import 'dart:io';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class Message {
  /// Message ID, a unique identifier.
  String? clientMsgID;

  /// Server-generated ID.
  String? serverMsgID;

  /// Creation time.
  int? createTime;

  /// Sending time.
  int? sendTime;

  /// Conversation type [ConversationType].
  int? sessionType;

  /// Sender's ID.
  String? sendID;

  /// Receiver's ID.
  String? recvID;

  /// Source.
  int? msgFrom;

  /// Message type [MessageType].
  int? contentType;

  /// Platform [Platform].
  int? senderPlatformID;

  /// Sender's nickname.
  String? senderNickname;

  /// Sender's avatar.
  String? senderFaceUrl;

  /// Group ID.
  String? groupID;

  /// Message localEx.
  String? localEx;

  /// Message sequence number.
  int? seq;

  /// Whether it's read.
  bool? isRead;

  /// Read time.
  int? hasReadTime;

  /// Message sending status [MessageStatus].
  int? status;

  /// Is it a reaction.
  bool? isReact;

  /// Is it an external extension.
  bool? isExternalExtensions;

  /// Offline display content.
  OfflinePushInfo? offlinePush;

  /// Additional information.
  String? attachedInfo;

  /// Extended information.
  String? ex;

  /// Custom extended information, currently used for message time segmentation on the client side.
  Map<String, dynamic> exMap = {};

  /// Image.
  PictureElem? pictureElem;

  /// Voice.
  SoundElem? soundElem;

  /// Video.
  VideoElem? videoElem;

  /// File.
  FileElem? fileElem;

  /// @ Information.
  AtTextElem? atTextElem;

  /// Location.
  LocationElem? locationElem;

  /// Custom.
  CustomElem? customElem;

  /// Quote.
  QuoteElem? quoteElem;

  /// Merge.
  MergeElem? mergeElem;

  /// Notification.
  NotificationElem? notificationElem;

  /// Custom emoji.
  FaceElem? faceElem;

  /// Additional information.
  AttachedInfoElem? attachedInfoElem;

  /// Text content.
  TextElem? textElem;

  /// Business card.
  CardElem? cardElem;

  ///
  AdvancedTextElem? advancedTextElem;

  ///
  TypingElem? typingElem;

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
    this.senderPlatformID,
    this.senderNickname,
    this.senderFaceUrl,
    this.groupID,
    this.localEx,
    this.seq,
    this.isRead,
    this.hasReadTime,
    this.status,
    this.offlinePush,
    this.attachedInfo,
    this.ex,
    this.exMap = const <String, dynamic>{},
    this.pictureElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.atTextElem,
    this.locationElem,
    this.customElem,
    this.quoteElem,
    this.mergeElem,
    this.notificationElem,
    this.faceElem,
    this.attachedInfoElem,
    this.isExternalExtensions,
    this.isReact,
    this.textElem,
    this.cardElem,
    this.advancedTextElem,
    this.typingElem,
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
    senderPlatformID = json['senderPlatformID'];
    senderNickname = json['senderNickname'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    localEx = json['localEx'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    offlinePush = json['offlinePush'] != null ? OfflinePushInfo.fromJson(json['offlinePush']) : null;
    attachedInfo = json['attachedInfo'];
    ex = json['ex'];
    exMap = json['exMap'] ?? {};
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null ? PictureElem.fromJson(json['pictureElem']) : null;
    soundElem = json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem = json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem = json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    atTextElem = json['atTextElem'] != null ? AtTextElem.fromJson(json['atTextElem']) : null;
    locationElem = json['locationElem'] != null ? LocationElem.fromJson(json['locationElem']) : null;

    customElem = json['customElem'] != null ? CustomElem.fromJson(json['customElem']) : null;
    quoteElem = json['quoteElem'] != null ? QuoteElem.fromJson(json['quoteElem']) : null;
    mergeElem = json['mergeElem'] != null ? MergeElem.fromJson(json['mergeElem']) : null;
    notificationElem = json['notificationElem'] != null ? NotificationElem.fromJson(json['notificationElem']) : null;
    faceElem = json['faceElem'] != null ? FaceElem.fromJson(json['faceElem']) : null;
    attachedInfoElem = json['attachedInfoElem'] != null ? AttachedInfoElem.fromJson(json['attachedInfoElem']) : null;
    hasReadTime = json['hasReadTime'] ?? attachedInfoElem?.hasReadTime;
    isExternalExtensions = json['isExternalExtensions'];
    isReact = json['isReact'];
    textElem = json['textElem'] != null ? TextElem.fromJson(json['textElem']) : null;
    cardElem = json['cardElem'] != null ? CardElem.fromJson(json['cardElem']) : null;
    advancedTextElem = json['advancedTextElem'] != null ? AdvancedTextElem.fromJson(json['advancedTextElem']) : null;
    typingElem = json['typingElem'] != null ? TypingElem.fromJson(json['typingElem']) : null;
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
    data['senderPlatformID'] = this.senderPlatformID;
    data['senderNickname'] = this.senderNickname;
    data['senderFaceUrl'] = this.senderFaceUrl;
    data['groupID'] = this.groupID;
    data['localEx'] = this.localEx;
    data['seq'] = this.seq;
    data['isRead'] = this.isRead;
    data['hasReadTime'] = this.hasReadTime;
    data['status'] = this.status;
    data['offlinePush'] = this.offlinePush?.toJson();
    data['attachedInfo'] = this.attachedInfo;
    data['ex'] = this.ex;
    data['exMap'] = this.exMap;
    data['sessionType'] = this.sessionType;
    data['pictureElem'] = this.pictureElem?.toJson();
    data['soundElem'] = this.soundElem?.toJson();
    data['videoElem'] = this.videoElem?.toJson();
    data['fileElem'] = this.fileElem?.toJson();
    data['atTextElem'] = this.atTextElem?.toJson();
    data['locationElem'] = this.locationElem?.toJson();
    data['customElem'] = this.customElem?.toJson();
    data['quoteElem'] = this.quoteElem?.toJson();
    data['mergeElem'] = this.mergeElem?.toJson();
    data['notificationElem'] = this.notificationElem?.toJson();
    data['faceElem'] = this.faceElem?.toJson();
    data['attachedInfoElem'] = this.attachedInfoElem?.toJson();
    data['isExternalExtensions'] = this.isExternalExtensions;
    data['isReact'] = this.isReact;
    data['textElem'] = this.textElem?.toJson();
    data['cardElem'] = this.cardElem?.toJson();
    data['advancedTextElem'] = this.advancedTextElem?.toJson();
    data['typingElem'] = this.typingElem?.toJson();
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Message && runtimeType == other.runtimeType && clientMsgID == other.clientMsgID;

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
    senderPlatformID = message.senderPlatformID;
    senderNickname = message.senderNickname;
    senderFaceUrl = message.senderFaceUrl;
    groupID = message.groupID;
    // content = message.content;
    seq = message.seq;
    isRead = message.isRead;
    hasReadTime = message.hasReadTime;
    status = message.status;
    offlinePush = message.offlinePush;
    attachedInfo = message.attachedInfo;
    ex = message.ex;
    exMap = message.exMap;
    sessionType = message.sessionType;
    pictureElem = message.pictureElem;
    soundElem = message.soundElem;
    videoElem = message.videoElem;
    fileElem = message.fileElem;
    atTextElem = message.atTextElem;
    locationElem = message.locationElem;
    customElem = message.customElem;
    quoteElem = message.quoteElem;
    mergeElem = message.mergeElem;
    notificationElem = message.notificationElem;
    faceElem = message.faceElem;
    attachedInfoElem = message.attachedInfoElem;
    textElem = message.textElem;
    cardElem = message.cardElem;
    advancedTextElem = message.advancedTextElem;
    typingElem = message.typingElem;
  }

  /// Single chat message
  bool get isSingleChat => sessionType == ConversationType.single;

  /// Group chat message
  bool get isGroupChat => sessionType == ConversationType.group || sessionType == ConversationType.superGroup;
}

/// Image message content
class PictureElem {
  /// Original path
  String? sourcePath;

  /// Original picture object
  PictureInfo? sourcePicture;

  /// Big picture object
  PictureInfo? bigPicture;

  /// Thumbnail picture object
  PictureInfo? snapshotPicture;

  PictureElem({this.sourcePath, this.sourcePicture, this.bigPicture, this.snapshotPicture});

  PictureElem.fromJson(Map<String, dynamic> json) {
    sourcePath = json['sourcePath'];
    sourcePicture = json['sourcePicture'] != null ? new PictureInfo.fromJson(json['sourcePicture']) : null;
    bigPicture = json['bigPicture'] != null ? new PictureInfo.fromJson(json['bigPicture']) : null;
    snapshotPicture = json['snapshotPicture'] != null ? new PictureInfo.fromJson(json['snapshotPicture']) : null;
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

/// Image information
class PictureInfo {
  /// ID
  String? uuid;

  /// Image MIME type
  String? type;

  /// Size
  int? size;

  /// Width
  int? width;

  /// Height
  int? height;

  /// Image URL
  String? url;

  PictureInfo({this.uuid, this.type, this.size, this.width, this.height, this.url});

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

/// Voice message content
class SoundElem {
  /// ID
  String? uuid;

  /// Original path
  String? soundPath;

  /// URL address
  String? sourceUrl;

  /// Size
  int? dataSize;

  /// Duration in seconds
  int? duration;

  SoundElem({this.uuid, this.soundPath, this.sourceUrl, this.dataSize, this.duration});

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

/// Video message content
class VideoElem {
  /// Video path
  String? videoPath;

  /// UUID
  String? videoUUID;

  /// URL address of the video
  String? videoUrl;

  /// MIME type
  String? videoType;

  /// Size
  int? videoSize;

  /// Duration in seconds
  int? duration;

  /// Snapshot path
  String? snapshotPath;

  /// Snapshot UUID
  String? snapshotUUID;

  /// Snapshot size
  int? snapshotSize;

  /// Snapshot URL address
  String? snapshotUrl;

  /// Snapshot width
  int? snapshotWidth;

  /// Snapshot height
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

/// File message content
class FileElem {
  /// File path
  String? filePath;

  /// UUID
  String? uuid;

  /// File URL address
  String? sourceUrl;

  /// File name
  String? fileName;

  /// File size
  int? fileSize;

  FileElem({this.filePath, this.uuid, this.sourceUrl, this.fileName, this.fileSize});

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

/// @ Message Content
class AtTextElem {
  /// Message content
  String? text;

  /// List of user IDs mentioned in the message
  List<String>? atUserList;

  /// Whether it includes a mention of oneself
  bool? isAtSelf;

  /// List of user IDs and their nicknames mentioned in the message, used to replace user IDs with nicknames in the message content
  List<AtUserInfo>? atUsersInfo;

  /// Message that is being replied to, when replying to someone and mentioning others
  Message? quoteMessage;

  AtTextElem({
    this.text,
    this.atUserList,
    this.isAtSelf,
    this.atUsersInfo,
    this.quoteMessage,
  });

  AtTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['atUserList'] is List) {
      atUserList = (json['atUserList'] as List).map((e) => '$e').toList();
    }
    isAtSelf = json['isAtSelf'];
    if (json['atUsersInfo'] is List) {
      atUsersInfo = (json['atUsersInfo'] as List).map((e) => AtUserInfo.fromJson(e)).toList();
    }
    quoteMessage = null != json['quoteMessage'] ? Message.fromJson(json['quoteMessage']) : null;
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

/// Location Message
class LocationElem {
  /// Location description
  String? description;

  /// Longitude
  double? longitude;

  /// Latitude
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

/// Custom Message
class CustomElem {
  /// Custom data
  String? data;

  /// Extended content
  String? extension;

  /// Description
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

/// Quoted Message (Reply to a message)
class QuoteElem {
  /// Reply content
  String? text;

  /// The message being replied to
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

/// Merged Message Body
class MergeElem {
  /// Title
  String? title;

  /// Summary
  List<String>? abstractList;

  /// List of specific messages to merge
  List<Message>? multiMessage;

  MergeElem({this.title, this.abstractList, this.multiMessage});

  MergeElem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['abstractList'] is List) {
      abstractList = json['abstractList'].cast<String>();
    }
    if (json['multiMessage'] is List) {
      multiMessage = (json['multiMessage'] as List).map((e) => Message.fromJson(e)).toList();
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

/// Notification
class NotificationElem {
  /// Details
  String? detail;

  /// Default tips
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

/// Emoticon
class FaceElem {
  /// Position emoticon, user-defined embedded emoticon for peer-to-peer communication
  int? index;

  /// Other emoticons, such as URL emoticons directly returning the URL
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

/// Additional Information
class AttachedInfoElem {
  /// Group message read information
  GroupHasReadInfo? groupHasReadInfo;

  /// Whether it is a private chat message (burn after reading message), valid for one-on-one chats
  bool? isPrivateChat;

  /// Read time
  int? hasReadTime;

  /// Reading duration in seconds
  /// That is, it triggers destruction after burnDuration seconds from the hasReadTime time
  int? burnDuration;

  /// Do not send offline push notifications
  bool? notSenderNotificationPush;

  AttachedInfoElem({
    this.groupHasReadInfo,
    this.isPrivateChat,
    this.hasReadTime,
    this.burnDuration,
    this.notSenderNotificationPush,
  });

  AttachedInfoElem.fromJson(Map<String, dynamic> json) {
    groupHasReadInfo = json['groupHasReadInfo'] == null ? null : GroupHasReadInfo.fromJson(json['groupHasReadInfo']);
    isPrivateChat = json['isPrivateChat'];
    hasReadTime = json['hasReadTime'];
    burnDuration = json['burnDuration'];
    notSenderNotificationPush = json['notSenderNotificationPush'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['groupHasReadInfo'] = this.groupHasReadInfo?.toJson();
    data['isPrivateChat'] = this.isPrivateChat;
    data['hasReadTime'] = this.hasReadTime;
    data['burnDuration'] = this.burnDuration;
    data['notSenderNotificationPush'] = this.notSenderNotificationPush;
    return data;
  }
}

class TextElem {
  String? content;

  TextElem({this.content});

  TextElem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['content'] = content;
    return data;
  }
}

class CardElem {
  String? userID;
  String? nickname;
  String? faceURL;
  String? ex;

  CardElem({this.userID, this.nickname, this.faceURL, this.ex});

  CardElem.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    return data;
  }
}

class TypingElem {
  String? msgTips;

  TypingElem({this.msgTips});

  TypingElem.fromJson(Map<String, dynamic> json) {
    msgTips = json['msgTips'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['msgTips'] = msgTips;
    return data;
  }
}

class AdvancedTextElem {
  String? text;
  List<MessageEntity>? messageEntityList;

  AdvancedTextElem({this.text, this.messageEntityList});

  AdvancedTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    messageEntityList = json['messageEntityList'] == null ? null : (json['messageEntityList'] as List).map((e) => MessageEntity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['text'] = text;
    data['messageEntityList'] = messageEntityList?.map((e) => e.toJson()).toList();
    return data;
  }
}

class MessageEntity {
  String? type;
  int? offset;
  int? length;
  String? url;
  String? ex;

  MessageEntity({this.type, this.offset, this.length, this.url, this.ex});

  MessageEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['ex'] = ex;
    return data;
  }
}

/// Group message read information
class GroupHasReadInfo {
  /// Total number of reads
  int? hasReadCount;

  int? unreadCount;

  GroupHasReadInfo.fromJson(Map<String, dynamic> json) {
    hasReadCount = json['hasReadCount'] ?? 0;
    unreadCount = json['unreadCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['hasReadCount'] = this.hasReadCount;
    data['unreadCount'] = this.unreadCount;
    return data;
  }
}

/// Message read receipt information
class ReadReceiptInfo {
  /// Sender ID
  String? userID;

  /// Group ID
  String? groupID;

  /// List of clientMsgIDs for read messages
  List<String>? msgIDList;

  /// Read time
  int? readTime;

  /// Message source
  int? msgFrom;

  /// Message type [MessageType]
  int? contentType;

  /// Conversation type [ConversationType]
  int? sessionType;

  ReadReceiptInfo({this.userID, this.groupID, this.msgIDList, this.readTime, this.msgFrom, this.contentType, this.sessionType});

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

/// Offline push information
class OfflinePushInfo {
  /// Notification title
  String? title;

  /// Notification description
  String? desc;

  /// Extended content
  String? ex;

  /// iOS-specific
  String? iOSPushSound;

  /// iOS-specific
  bool? iOSBadgeCount;

  OfflinePushInfo({this.title, this.desc, this.ex, this.iOSPushSound, this.iOSBadgeCount});

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

/// @ message user ID and nickname relationship object
class AtUserInfo {
  /// User ID who was @ mentioned
  String? atUserID;

  /// User nickname who was @ mentioned
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

/// Message revocation details
class RevokedInfo {
  /// Revoker's ID
  String? revokerID;

  /// Revoker's group role [GroupRoleLevel]
  int? revokerRole;

  /// Revoker's nickname
  String? revokerNickname;

  /// Message ID
  String? clientMsgID;

  /// Revocation time
  int? revokeTime;

  /// Message sending time
  int? sourceMessageSendTime;

  /// Message sender
  String? sourceMessageSendID;

  /// Message sender's nickname
  String? sourceMessageSenderNickname;

  /// Conversation type [ConversationType]
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
    messageList = json['messageList'] == null ? null : (json['messageList'] as List).map((e) => Message.fromJson(e)).toList();
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

class UserExInfo {
  String? userID;
  String? ex;

  UserExInfo({this.userID, this.ex});

  UserExInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['userID'] = this.userID;
    data['ex'] = this.ex;
    return data;
  }
}
