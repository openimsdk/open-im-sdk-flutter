import 'dart:convert';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationInfo {
  String conversationID;

  /// [ConversationType]
  int? conversationType;
  String? userID;
  String? groupID;
  String? showName;
  String? faceURL;
  int? recvMsgOpt;
  int? unreadCount;
  int? groupAtType;
  Message? latestMsg;
  int? latestMsgSendTime;
  String? draftText;
  int? draftTextTime;
  bool? isPinned;
  bool? isPrivateChat;
  String? ext;
  bool? isNotInGroup;

  ConversationInfo({
    required this.conversationID,
    this.conversationType,
    this.userID,
    this.groupID,
    this.showName,
    this.faceURL,
    this.recvMsgOpt,
    this.unreadCount,
    this.latestMsg,
    this.latestMsgSendTime,
    this.draftText,
    this.draftTextTime,
    this.isPrivateChat,
    this.isPinned,
    this.isNotInGroup,
  });

  ConversationInfo.fromJson(Map<String, dynamic> json)
      : conversationID = json['conversationID'] {
    conversationType = json['conversationType'];
    userID = json['userID'];
    groupID = json['groupID'];
    showName = json['showName'];
    faceURL = json['faceURL'];
    recvMsgOpt = json['recvMsgOpt'];
    unreadCount = json['unreadCount'];
    try {
      if (json['latestMsg'] is String) {
        latestMsg = Message.fromJson(jsonDecode(json['latestMsg']));
      } else if (json['latestMsg'] is Map) {
        latestMsg = Message.fromJson(json['latestMsg']);
      }
    } catch (e) {}
    latestMsgSendTime = json['latestMsgSendTime'];
    draftText = json['draftText'];
    draftTextTime = json['draftTextTime'];
    isPinned = json['isPinned'];
    isPrivateChat = json['isPrivateChat'];
    isNotInGroup = json['isNotInGroup'];
    groupAtType = json['groupAtType'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['conversationID'] = this.conversationID;
    data['conversationType'] = this.conversationType;
    data['userID'] = this.userID;
    data['groupID'] = this.groupID;
    data['showName'] = this.showName;
    data['faceURL'] = this.faceURL;
    data['recvMsgOpt'] = this.recvMsgOpt;
    data['unreadCount'] = this.unreadCount;
    data['latestMsg'] = this.latestMsg?.toJson();
    data['latestMsgSendTime'] = this.latestMsgSendTime;
    data['draftText'] = this.draftText;
    data['draftTextTime'] = this.draftTextTime;
    data['isPinned'] = this.isPinned;
    data['isPrivateChat'] = this.isPrivateChat;
    data['isNotInGroup'] = this.isNotInGroup;
    data['groupAtType'] = this.groupAtType;
    return data;
  }

  bool get isSingleChat => conversationType == ConversationType.single;

  bool get isGroupChat => conversationType == ConversationType.group;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationInfo &&
          runtimeType == other.runtimeType &&
          conversationID == other.conversationID;

  @override
  int get hashCode => conversationID.hashCode;
}
