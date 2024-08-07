class InputStatusChangedData {
  final String userID;
  final String conversationID;
  final List<int>? platformIDs;

  InputStatusChangedData({
    required this.userID,
    required this.conversationID,
    this.platformIDs,
  });

  InputStatusChangedData.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        conversationID = json['conversationID'],
        platformIDs = List<int>.from(json['platformIDs'] ?? []);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['conversationID'] = conversationID;
    data['platformIDs'] = platformIDs;
    return data;
  }
}
