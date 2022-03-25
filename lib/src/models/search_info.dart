import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class SearchResult {
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
  String? conversationID;
  int? messageCount;
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
