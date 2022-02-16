import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class FriendshipListener {
  void friendApplicationAdded(FriendApplicationInfo u);

  void friendApplicationDeleted(FriendApplicationInfo u);

  void friendApplicationAccepted(FriendApplicationInfo u);

  void friendApplicationRejected(FriendApplicationInfo u);

  void friendAdded(FriendInfo u);

  void friendDeleted(FriendInfo u);

  void friendInfoChanged(FriendInfo u);

  void blacklistAdded(BlacklistInfo u);

  void blacklistDeleted(BlacklistInfo u);
}
