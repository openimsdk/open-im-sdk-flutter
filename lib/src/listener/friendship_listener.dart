import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class FriendshipListener {
  void blackListAdd(UserInfo u);

  void blackListDeleted(UserInfo u);

  void friendApplicationListAccept(UserInfo u);

  void friendApplicationListAdded(UserInfo u);

  void friendApplicationListDeleted(UserInfo u);

  void friendApplicationListReject(UserInfo u);

  void friendInfoChanged(UserInfo u);

  void friendListAdded(UserInfo u);

  void friendListDeleted(UserInfo u);
}
