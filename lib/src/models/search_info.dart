import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SearchResult {
  /// 获取到的总的消息数量
  int? totalCount;
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

  /// 这个会话下的消息数量
  int? messageCount;

  /// [Message]的列表
  List<Message>? messageList;

  SearchResultItems({this.conversationID, this.messageCount, this.messageList});

  SearchResultItems.fromJson(Map<String, dynamic> json) {
    conversationID = json['conversationID'];
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
    data['messageCount'] = this.messageCount;
    if (this.messageList != null) {
      data['messageList'] = this.messageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
