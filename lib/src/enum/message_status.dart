/// Message Send Status
class MessageStatus {
  /// Sending
  static const sending = 1;

  /// Successfully sent
  static const succeeded = 2;

  /// Send failed
  static const failed = 3;

  /// Already deleted
  static const deleted = 4;
}

enum GetHistoryViewType {
  history(0),
  search(1);

  final int rawValue;

  const GetHistoryViewType(this.rawValue);
}
