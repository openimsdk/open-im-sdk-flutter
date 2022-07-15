import 'dart:convert';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationInfo {
  /// 会话ID
  String conversationID;

  /// 会话类型[ConversationType]
  int? conversationType;

  /// 参与会话的userID
  String? userID;

  /// 参与会话的groupID
  String? groupID;

  /// 昵称
  String? showName;

  /// 头像
  String? faceURL;

  /// 免打扰 0：正常；1：不接受消息；2：接受在线消息不接受离线消息；
  int? recvMsgOpt;

  /// 未读消息数
  int? unreadCount;

  /// 强制提示，[GroupAtType]包含@所有人，@个人以及公告提示
  int? groupAtType;

  /// 会话最新消息内容
  Message? latestMsg;

  /// 最新消息发送时间
  int? latestMsgSendTime;

  /// 草稿
  String? draftText;

  /// 草稿生成时间
  int? draftTextTime;

  /// 是否置顶
  bool? isPinned;

  /// 是否开启了私聊（阅后即焚）
  bool? isPrivateChat;

  /// 附加内容
  String? ext;

  /// 是否还在组内，如果退群返回true
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

  /// 是单聊
  bool get isSingleChat => conversationType == ConversationType.single;

  /// 是群聊
  bool get isGroupChat =>
      conversationType == ConversationType.group ||
      conversationType == ConversationType.superGroup;

  /// 是有效的
  bool get isValid => isSingleChat || isGroupChat && !isNotInGroup!;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationInfo &&
          runtimeType == other.runtimeType &&
          conversationID == other.conversationID;

  @override
  int get hashCode => conversationID.hashCode;
}
