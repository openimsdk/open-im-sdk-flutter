import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 会话监听
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

  /// 会话发生改变
  void conversationChanged(List<ConversationInfo> list) {
    if (onConversationChanged != null) onConversationChanged!(list);
  }

  /// 有新会话产生
  void newConversation(List<ConversationInfo> list) {
    if (onNewConversation != null) onNewConversation!(list);
  }

  /// 未读消息总数发送改变
  void totalUnreadMessageCountChanged(int i) {
    if (onTotalUnreadMessageCountChanged != null)
      onTotalUnreadMessageCountChanged!(i);
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
}
