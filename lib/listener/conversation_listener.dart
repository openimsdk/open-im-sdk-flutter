import 'package:flutter_openim_sdk/models/conversation_info.dart';

class ConversationListener {
  void onConversationChanged(List<ConversationInfo> list) {}

  void onNewConversation(List<ConversationInfo> list) {}

  void onSyncServerFailed() {}

  void onSyncServerFinish() {}

  void onSyncServerStart() {}

  void onTotalUnreadMessageCountChanged(int i) {}
}
