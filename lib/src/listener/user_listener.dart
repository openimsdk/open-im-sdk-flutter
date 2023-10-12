import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// Current User Profile Listener
class OnUserListener {
  /// The information of the logged-in user has been updated
  Function(UserInfo info)? onSelfInfoUpdated;
  Function(UserStatusInfo info)? onUserStatusChanged;

  OnUserListener({this.onSelfInfoUpdated, this.onUserStatusChanged});

  /// Callback for changes in user's own information
  void selfInfoUpdated(UserInfo info) {
    onSelfInfoUpdated?.call(info);
  }

  /// Callback for changes in user status
  void userStatusChanged(UserStatusInfo info) {
    onUserStatusChanged?.call(info);
  }
}
