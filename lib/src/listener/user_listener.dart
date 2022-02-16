import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class UserListener {
  /// The information of the logged-in user has been updated
  void selfInfoUpdated(UserInfo info);
}
