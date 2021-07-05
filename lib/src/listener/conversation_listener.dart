import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationListener {
  void onConversationChanged(List<ConversationInfo> list) {}

  void onNewConversation(List<ConversationInfo> list) {}

  void onSyncServerFailed() {}

  void onSyncServerFinish() {}

  void onSyncServerStart() {}

  void onTotalUnreadMessageCountChanged(int i) {}
}
