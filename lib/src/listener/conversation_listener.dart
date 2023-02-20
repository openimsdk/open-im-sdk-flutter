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
    onConversationChanged?.call(list);
  }

  /// 有新会话产生
  void newConversation(List<ConversationInfo> list) {
    onNewConversation?.call(list);
  }

  /// 未读消息总数发送改变
  void totalUnreadMessageCountChanged(int i) {
    onTotalUnreadMessageCountChanged?.call(i);
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
