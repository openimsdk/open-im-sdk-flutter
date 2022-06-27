import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SearchResult {
  /// 获取到的总的消息数量
  int? totalCount;

  /// 搜索到的具体内容
  List<SearchResultItems>? searchResultItems;

  SearchResult({this.totalCount, this.searchResultItems});

  SearchResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['searchResultItems'] != null) {
      searchResultItems = <SearchResultItems>[];
      json['searchResultItems'].forEach((v) {
        searchResultItems!.add(SearchResultItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.searchResultItems != null) {
      data['searchResultItems'] =
          this.searchResultItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResultItems {
  /// 会话ID
  String? conversationID;

  /// 会话类型1单聊，2群聊，3，超级大群，4通知会话
  int? conversationType;

  /// 显示名
  String? showName;

  /// 头像
  String? faceURL;

  /// 搜索到的这个会话下的消息数量
  int? messageCount;

  /// [Message]的列表
  List<Message>? messageList;

  SearchResultItems({this.conversationID, this.messageCount, this.messageList});

  SearchResultItems.fromJson(Map<String, dynamic> json) {
    conversationID = json['conversationID'];
    conversationType = json['conversationType'];
    showName = json['showName'];
    faceURL = json['faceURL'];
    messageCount = json['messageCount'];
    if (json['messageList'] != null) {
      messageList = <Message>[];
      json['messageList'].forEach((v) {
        messageList!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['conversationID'] = this.conversationID;
    data['conversationType'] = this.conversationType;
    data['showName'] = this.showName;
    data['faceURL'] = this.faceURL;
    data['messageCount'] = this.messageCount;
    if (this.messageList != null) {
      data['messageList'] = this.messageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
