import 'dart:convert';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationInfo {
  // Unique identifier for the conversation
  String conversationID;

  // Type of the conversation (e.g., single, group, super group)
  int? conversationType;

  // User ID in case of a single chat
  String? userID;

  // Group ID in case of a group chat
  String? groupID;

  // Display name or nickname
  String? showName;

  // URL of the user's or group's profile picture
  String? faceURL;

  // Message reception option (0: normal, 1: do not accept messages, 2: accept online messages but not offline messages)
  int? recvMsgOpt;

  // Number of unread messages in the conversation
  int unreadCount = 0;

  // Latest message in the conversation
  Message? latestMsg;

  // Timestamp of the latest message
  int? latestMsgSendTime;

  // Draft text for the conversation
  String? draftText;

  // Timestamp when the draft text was created
  int? draftTextTime;

  // Indicates whether the conversation is pinned
  bool? isPinned;

  // Indicates whether the conversation is a private chat with features like self-destructing messages
  bool? isPrivateChat;

  // Duration for which messages are readable (in seconds)
  int? burnDuration;

  // Indicates whether the conversation has self-destructing messages enabled
  bool? isMsgDestruct;

  // Timestamp for self-destructing messages (in seconds)
  int? msgDestructTime;

  // Additional data or metadata
  String? ex;

  // Indicates whether the user is no longer in the group (if applicable)
  bool? isNotInGroup;

  // Group @ type, which includes @ all, @ individual, and announcement prompts
  int? groupAtType;

  // Constructor to create a ConversationInfo object
  ConversationInfo({
    required this.conversationID,
    this.conversationType,
    this.userID,
    this.groupID,
    this.showName,
    this.faceURL,
    this.recvMsgOpt,
    this.unreadCount = 0,
    this.latestMsg,
    this.latestMsgSendTime,
    this.draftText,
    this.draftTextTime,
    this.isPrivateChat,
    this.burnDuration,
    this.isPinned,
    this.isNotInGroup,
    this.ex,
    this.groupAtType,
    this.isMsgDestruct,
    this.msgDestructTime,
  });

  ConversationInfo.fromJson(Map<String, dynamic> json) : conversationID = json['conversationID'] {
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
    burnDuration = json['burnDuration'];
    isNotInGroup = json['isNotInGroup'];
    groupAtType = json['groupAtType'];
    ex = json['ex'];
    isMsgDestruct = json['isMsgDestruct'];
    msgDestructTime = json['msgDestructTime'];
  }

  // Method to convert the ConversationInfo object to a JSON map
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
    data['burnDuration'] = this.burnDuration;
    data['isNotInGroup'] = this.isNotInGroup;
    data['groupAtType'] = this.groupAtType;
    data['ex'] = this.ex;
    data['isMsgDestruct'] = this.isMsgDestruct;
    data['msgDestructTime'] = this.msgDestructTime;
    return data;
  }

  // Check if it's a single chat
  bool get isSingleChat => conversationType == ConversationType.single;

  // Check if it's a group chat
  bool get isGroupChat => conversationType == ConversationType.group || conversationType == ConversationType.superGroup;

  // Check if it's a valid conversation (not in a group if isNotInGroup is true)
  bool get isValid => isSingleChat || (isGroupChat && !isNotInGroup!);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ConversationInfo && runtimeType == other.runtimeType && conversationID == other.conversationID;

  @override
  int get hashCode => conversationID.hashCode;
}
