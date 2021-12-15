import 'dart:convert';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationInfo {
  String conversationID;

  /// [ConversationType]
  int? conversationType;
  String? userID;
  String? groupID;
  String? showName;
  String? faceUrl;
  int? recvMsgOpt;
  int? unreadCount;
  Message? latestMsg;
  int? latestMsgSendTime;
  String? draftText;
  int? draftTimestamp;

  ///  pinned value is 1
  dynamic isPinned;

  ConversationInfo(
      {required this.conversationID,
      this.conversationType,
      this.userID,
      this.groupID,
      this.showName,
      this.faceUrl,
      this.recvMsgOpt,
      this.unreadCount,
      this.latestMsg,
      this.latestMsgSendTime,
      this.draftText,
      this.draftTimestamp,
      this.isPinned});

  ConversationInfo.fromJson(Map<String, dynamic> json)
      : conversationID = json['conversationID'] {
    // conversationID = json['conversationID'];
    conversationType = json['conversationType'];
    userID = json['userID'];
    groupID = json['groupID'];
    showName = json['showName'];
    faceUrl = json['faceUrl'];
    recvMsgOpt = json['recvMsgOpt'];
    unreadCount = json['unreadCount'];
    // latestMsg = json['latestMsg'];
    // if (null != json['latestMsg']) {
    try {
      if (json['latestMsg'] is String) {
        latestMsg = Message.fromJson(jsonDecode(json['latestMsg']));
      } else if (json['latestMsg'] is Map) {
        latestMsg = Message.fromJson(json['latestMsg']);
      }
    } catch (e) {}

    // }

    latestMsgSendTime = json['latestMsgSendTime'];
    draftText = json['draftText'];
    draftTimestamp = json['draftTimestamp'];
    isPinned = json['isPinned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversationID'] = this.conversationID;
    data['conversationType'] = this.conversationType;
    data['userID'] = this.userID;
    data['groupID'] = this.groupID;
    data['showName'] = this.showName;
    data['faceUrl'] = this.faceUrl;
    data['recvMsgOpt'] = this.recvMsgOpt;
    data['unreadCount'] = this.unreadCount;
    data['latestMsg'] = this.latestMsg?.toJson();
    data['latestMsgSendTime'] = this.latestMsgSendTime;
    data['draftText'] = this.draftText;
    data['draftTimestamp'] = this.draftTimestamp;
    data['isPinned'] = this.isPinned;
    return data;
  }

  bool get isSingleChat => conversationType == ConversationType.single_chat;

  bool get isGroupChat => conversationType == ConversationType.group_chat;

  bool get isTop => isPinned == 1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationInfo &&
          runtimeType == other.runtimeType &&
          conversationID == other.conversationID;

  @override
  int get hashCode => conversationID.hashCode;
}
