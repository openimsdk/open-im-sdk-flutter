import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class OnFriendshipListener implements FriendshipListener {
  Function(UserInfo u)? blackListAdd;
  Function(UserInfo u)? blackListDeleted;
  Function(UserInfo u)? friendApplicationListAccept;
  Function(UserInfo u)? friendApplicationListAdded;
  Function(UserInfo u)? friendApplicationListDeleted;
  Function(UserInfo u)? friendApplicationListReject;
  Function(UserInfo u)? friendInfoChanged;
  Function(UserInfo u)? friendListAdded;
  Function(UserInfo u)? friendListDeleted;

  OnFriendshipListener({
    this.blackListAdd,
    this.blackListDeleted,
    this.friendApplicationListAccept,
    this.friendApplicationListAdded,
    this.friendApplicationListDeleted,
    this.friendApplicationListReject,
    this.friendInfoChanged,
    this.friendListAdded,
    this.friendListDeleted,
  });

  @override
  void onBlackListAdd(UserInfo u) {
    if (null != blackListAdd) blackListAdd!(u);
  }

  @override
  void onBlackListDeleted(UserInfo u) {
    if (null != blackListDeleted) blackListDeleted!(u);
  }

  @override
  void onFriendApplicationListAccept(UserInfo u) {
    if (null != friendApplicationListAccept) friendApplicationListAccept!(u);
  }

  @override
  void onFriendApplicationListAdded(UserInfo u) {
    if (null != friendApplicationListAdded) friendApplicationListAdded!(u);
  }

  @override
  void onFriendApplicationListDeleted(UserInfo u) {
    if (null != friendApplicationListDeleted) friendApplicationListDeleted!(u);
  }

  @override
  void onFriendApplicationListReject(UserInfo u) {
    if (null != friendApplicationListReject) friendApplicationListReject!(u);
  }

  @override
  void onFriendInfoChanged(UserInfo u) {
    if (null != friendInfoChanged) friendInfoChanged!(u);
  }

  @override
  void onFriendListAdded(UserInfo u) {
    if (null != friendListAdded) friendListAdded!(u);
  }

  @override
  void onFriendListDeleted(UserInfo u) {
    if (null != friendListDeleted) friendListDeleted!(u);
  }
}
