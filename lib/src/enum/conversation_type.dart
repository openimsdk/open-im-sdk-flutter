/// Conversation types
class ConversationType {
  /// Single chat
  static const single = 1;

  /// Group (Deprecated in v3)
  @Deprecated('Use superGroup instead')
  static const group = 2;

  /// Super group chat
  static const superGroup = 3;

  /// Notification
  static const notification = 4;
}
