import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnFriendshipListener {
  Function(FriendApplicationInfo i)? onFriendApplicationAdded;
  Function(FriendApplicationInfo i)? onFriendApplicationDeleted;
  Function(FriendApplicationInfo i)? onFriendApplicationAccepted;
  Function(FriendApplicationInfo i)? onFriendApplicationRejected;
  Function(FriendInfo i)? onFriendAdded;
  Function(FriendInfo i)? onFriendDeleted;
  Function(FriendInfo i)? onFriendInfoChanged;
  Function(BlacklistInfo i)? onBlacklistAdded;
  Function(BlacklistInfo i)? onBlacklistDeleted;

  OnFriendshipListener({
    this.onBlacklistAdded,
    this.onBlacklistDeleted,
    this.onFriendAdded,
    this.onFriendApplicationAccepted,
    this.onFriendApplicationAdded,
    this.onFriendApplicationDeleted,
    this.onFriendApplicationRejected,
    this.onFriendDeleted,
    this.onFriendInfoChanged,
  });

  void blacklistAdded(BlacklistInfo u) {
    onBlacklistAdded?.call(u);
  }

  void blacklistDeleted(BlacklistInfo u) {
    onBlacklistDeleted?.call(u);
  }

  void friendAdded(FriendInfo u) {
    onFriendAdded?.call(u);
  }

  void friendApplicationAccepted(FriendApplicationInfo u) {
    onFriendApplicationAccepted?.call(u);
  }

  void friendApplicationAdded(FriendApplicationInfo u) {
    onFriendApplicationAdded?.call(u);
  }

  void friendApplicationDeleted(FriendApplicationInfo u) {
    onFriendApplicationDeleted?.call(u);
  }

  void friendApplicationRejected(FriendApplicationInfo u) {
    onFriendApplicationRejected?.call(u);
  }

  void friendDeleted(FriendInfo u) {
    onFriendDeleted?.call(u);
  }

  void friendInfoChanged(FriendInfo u) {
    onFriendInfoChanged?.call(u);
  }
}
