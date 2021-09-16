import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class ConversationListener {
  void conversationChanged(List<ConversationInfo> list);

  void newConversation(List<ConversationInfo> list);

  void syncServerFailed();

  void syncServerFinish();

  void syncServerStart();

  void totalUnreadMessageCountChanged(int i);
}
