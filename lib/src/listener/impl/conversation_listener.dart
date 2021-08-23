import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnConversationListener implements ConversationListener {
  Function(List<ConversationInfo> list)? conversationChanged;
  Function(List<ConversationInfo> list)? newConversation;
  Function(int count)? totalUnreadMsgCountChanged;
  Function()? syncServerFailed;
  Function()? syncServerFinish;
  Function()? syncServerStart;

  OnConversationListener({
    this.conversationChanged,
    this.newConversation,
    this.totalUnreadMsgCountChanged,
    this.syncServerFailed,
    this.syncServerFinish,
    this.syncServerStart,
  });

  @override
  void onConversationChanged(List<ConversationInfo> list) {
    if (conversationChanged != null) conversationChanged!(list);
  }

  @override
  void onNewConversation(List<ConversationInfo> list) {
    if (newConversation != null) newConversation!(list);
  }

  @override
  void onSyncServerFailed() {
    if (syncServerFailed != null) syncServerFailed!();
  }

  @override
  void onSyncServerFinish() {
    if (syncServerFinish != null) syncServerFinish!();
  }

  @override
  void onSyncServerStart() {
    if (syncServerStart != null) syncServerStart!();
  }

  @override
  void onTotalUnreadMessageCountChanged(int i) {
    if (totalUnreadMsgCountChanged != null) totalUnreadMsgCountChanged!(i);
  }
}
