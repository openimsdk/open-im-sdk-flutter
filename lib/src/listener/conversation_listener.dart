import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnConversationListener {
  Function(List<ConversationInfo> list)? onConversationChanged;
  Function(List<ConversationInfo> list)? onNewConversation;
  Function(int count)? onTotalUnreadMessageCountChanged;
  Function()? onSyncServerFailed;
  Function()? onSyncServerFinish;
  Function()? onSyncServerStart;

  OnConversationListener({
    this.onConversationChanged,
    this.onNewConversation,
    this.onTotalUnreadMessageCountChanged,
    this.onSyncServerFailed,
    this.onSyncServerFinish,
    this.onSyncServerStart,
  });

  void conversationChanged(List<ConversationInfo> list) {
    if (onConversationChanged != null) onConversationChanged!(list);
  }

  void newConversation(List<ConversationInfo> list) {
    if (onNewConversation != null) onNewConversation!(list);
  }

  void syncServerFailed() {
    if (onSyncServerFailed != null) onSyncServerFailed!();
  }

  void syncServerFinish() {
    if (onSyncServerFinish != null) onSyncServerFinish!();
  }

  void syncServerStart() {
    if (onSyncServerStart != null) onSyncServerStart!();
  }

  void totalUnreadMessageCountChanged(int i) {
    if (onTotalUnreadMessageCountChanged != null)
      onTotalUnreadMessageCountChanged!(i);
  }
}
