import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

abstract class InitSDKListener {
  /// SDK is connecting to the server
  void connecting();

  /// SDK has successfully connected to the server
  void connectSuccess();

  /// SDK failed to connect to the server
  void connectFailed(int? code, String? errorMsg);

  /// The current user is kicked offline.
  /// At this time, the UI can prompt the user and call IMManager's login() function to log in again.
  void kickedOffline();

  ///  Ticket expired when online.
  ///  At this time, you need to generate a new userSig and call IMManager's login() function to log in again
  void userSigExpired();

  /// The information of the logged-in user has been updated
  void selfInfoUpdated(UserInfo info);
}
