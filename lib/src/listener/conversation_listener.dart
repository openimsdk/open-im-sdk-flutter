import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Conversation Listener
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

  /// Conversations have changed
  void conversationChanged(List<ConversationInfo> list) {
    onConversationChanged?.call(list);
  }

  /// New conversations have been created
  void newConversation(List<ConversationInfo> list) {
    onNewConversation?.call(list);
  }

  /// Total unread message count has changed
  void totalUnreadMessageCountChanged(int count) {
    onTotalUnreadMessageCountChanged?.call(count);
  }

  void syncServerFailed() {
    onSyncServerFailed?.call();
  }

  void syncServerFinish() {
    onSyncServerFinish?.call();
  }

  void syncServerStart() {
    onSyncServerStart?.call();
  }
}
