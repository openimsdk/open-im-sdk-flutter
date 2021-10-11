import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnFriendshipListener extends FriendshipListener {
  Function(UserInfo u)? onBlackListAdd;
  Function(UserInfo u)? onBlackListDeleted;
  Function(UserInfo u)? onFriendApplicationListAccept;
  Function(UserInfo u)? onFriendApplicationListAdded;
  Function(UserInfo u)? onFriendApplicationListDeleted;
  Function(UserInfo u)? onFriendApplicationListReject;
  Function(UserInfo u)? onFriendInfoChanged;
  Function(UserInfo u)? onFriendListAdded;
  Function(UserInfo u)? onFriendListDeleted;

  OnFriendshipListener({
    this.onBlackListAdd,
    this.onBlackListDeleted,
    this.onFriendApplicationListAccept,
    this.onFriendApplicationListAdded,
    this.onFriendApplicationListDeleted,
    this.onFriendApplicationListReject,
    this.onFriendInfoChanged,
    this.onFriendListAdded,
    this.onFriendListDeleted,
  });

  @override
  void blackListAdd(UserInfo u) {
    if (null != onBlackListAdd) onBlackListAdd!(u);
  }

  @override
  void blackListDeleted(UserInfo u) {
    if (null != onBlackListDeleted) onBlackListDeleted!(u);
  }

  @override
  void friendApplicationListAccept(UserInfo u) {
    if (null != onFriendApplicationListAccept)
      onFriendApplicationListAccept!(u);
  }

  @override
  void friendApplicationListAdded(UserInfo u) {
    if (null != onFriendApplicationListAdded) onFriendApplicationListAdded!(u);
  }

  @override
  void friendApplicationListDeleted(UserInfo u) {
    if (null != onFriendApplicationListDeleted)
      onFriendApplicationListDeleted!(u);
  }

  @override
  void friendApplicationListReject(UserInfo u) {
    if (null != onFriendApplicationListReject)
      onFriendApplicationListReject!(u);
  }

  @override
  void friendInfoChanged(UserInfo u) {
    if (null != onFriendInfoChanged) onFriendInfoChanged!(u);
  }

  @override
  void friendListAdded(UserInfo u) {
    if (null != onFriendListAdded) onFriendListAdded!(u);
  }

  @override
  void friendListDeleted(UserInfo u) {
    if (null != onFriendListDeleted) onFriendListDeleted!(u);
  }
}
