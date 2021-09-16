import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnConversationListener extends ConversationListener {
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

  @override
  void conversationChanged(List<ConversationInfo> list) {
    if (onConversationChanged != null) onConversationChanged!(list);
  }

  @override
  void newConversation(List<ConversationInfo> list) {
    if (onNewConversation != null) onNewConversation!(list);
  }

  @override
  void syncServerFailed() {
    if (onSyncServerFailed != null) onSyncServerFailed!();
  }

  @override
  void syncServerFinish() {
    if (onSyncServerFinish != null) onSyncServerFinish!();
  }

  @override
  void syncServerStart() {
    if (onSyncServerStart != null) onSyncServerStart!();
  }

  @override
  void totalUnreadMessageCountChanged(int i) {
    if (onTotalUnreadMessageCountChanged != null)
      onTotalUnreadMessageCountChanged!(i);
  }
}
