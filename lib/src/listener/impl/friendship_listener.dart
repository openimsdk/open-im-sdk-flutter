import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnFriendshipListener extends FriendshipListener {
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

  @override
  void blacklistAdded(BlacklistInfo u) {
    onBlacklistAdded?.call(u);
  }

  @override
  void blacklistDeleted(BlacklistInfo u) {
    onBlacklistDeleted?.call(u);
  }

  @override
  void friendAdded(FriendInfo u) {
    onFriendAdded?.call(u);
  }

  @override
  void friendApplicationAccepted(FriendApplicationInfo u) {
    onFriendApplicationAccepted?.call(u);
  }

  @override
  void friendApplicationAdded(FriendApplicationInfo u) {
    onFriendApplicationAdded?.call(u);
  }

  @override
  void friendApplicationDeleted(FriendApplicationInfo u) {
    onFriendApplicationDeleted?.call(u);
  }

  @override
  void friendApplicationRejected(FriendApplicationInfo u) {
    onFriendApplicationRejected?.call(u);
  }

  @override
  void friendDeleted(FriendInfo u) {
    onFriendDeleted?.call(u);
  }

  @override
  void friendInfoChanged(FriendInfo u) {
    onFriendInfoChanged?.call(u);
  }
}
