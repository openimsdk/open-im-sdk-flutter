class UpdateFriendsReq {
  final String? ownerUserID;
  final List<String>? friendUserIDs;
  final bool? isPinned;
  final String? remark;
  final String? ex;

  UpdateFriendsReq({
    this.ownerUserID,
    this.friendUserIDs,
    this.isPinned,
    this.remark,
    this.ex,
  });

  UpdateFriendsReq.fromJson(Map<String, dynamic> json)
      : ownerUserID = json['ownerUserID'],
        friendUserIDs = json['friendUserIDs'],
        isPinned = json['isPinned'],
        remark = json['remark'],
        ex = json['ex'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['friendUserIDs'] = friendUserIDs;
    data['isPinned'] = isPinned;
    data['remark'] = remark;
    data['ex'] = ex;
    return data;
  }

  @override
  String toString() {
    return 'UpdateFriendsReq{ownerUserID: $ownerUserID, friendUserIDs: $friendUserIDs, isPinned: $isPinned, remark: $remark, ex: $ex}';
  }
}

class ConversationReq {
  final String? userID;
  final String? groupID;
  final int? recvMsgOpt;
  final bool? isPinned;
  final bool? isPrivateChat;
  final String? ex;
  final int? burnDuration;
  final bool? isMsgDestruct;
  final int? msgDestructTime;
  final int? groupAtType;

  ConversationReq({
    this.userID,
    this.groupID,
    this.recvMsgOpt,
    this.isPinned,
    this.isPrivateChat,
    this.ex,
    this.burnDuration,
    this.isMsgDestruct,
    this.msgDestructTime,
    this.groupAtType,
  });

  ConversationReq.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        groupID = json['groupID'],
        recvMsgOpt = json['recvMsgOpt'],
        isPinned = json['isPinned'],
        isPrivateChat = json['isPrivateChat'],
        ex = json['ex'],
        burnDuration = json['burnDuration'],
        isMsgDestruct = json['isMsgDestruct'],
        msgDestructTime = json['msgDestructTime'],
        groupAtType = json['groupAtType'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['groupID'] = groupID;
    data['recvMsgOpt'] = recvMsgOpt;
    data['isPinned'] = isPinned;
    data['isPrivateChat'] = isPrivateChat;
    data['ex'] = ex;
    data['burnDuration'] = burnDuration;
    data['isMsgDestruct'] = isMsgDestruct;
    data['msgDestructTime'] = msgDestructTime;
    data['groupAtType'] = groupAtType;

    return data;
  }
}
