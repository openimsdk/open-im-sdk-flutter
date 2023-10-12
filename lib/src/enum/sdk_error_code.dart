/// SDK Error Codes
class SDKErrorCode {
  /// Network Request Error
  static const int networkRequestError = 10000;

  /// Network Waiting Timeout Error
  static const int networkWaitTimeoutError = 10001;

  /// Parameter Error
  static const int parameterError = 10002;

  /// Context Timeout Error, usually when the user has already logged out
  static const int contextTimeoutError = 10003;

  /// Resources not loaded completely, usually uninitialized or login hasn't completed
  static const int resourceNotLoaded = 10004;

  /// Unknown Error, check the error message for details
  static const int unknownError = 10005;

  /// SDK Internal Error, check the error message for details
  static const int sdkInternalError = 10006;

  /// This user has set not to be added
  static const int refuseToAddFriends = 10013;

  /// User does not exist or is not registered
  static const int userNotExistOrNotRegistered = 10100;

  /// User has already logged out
  static const int userHasLoggedOut = 10101;

  /// User is attempting to log in again, check the login status to avoid duplicate logins
  static const int repeatLogin = 10102;

  /// The file to upload does not exist
  static const int uploadFileNotExist = 10200;

  /// Message decompression failed
  static const int messageDecompressionFailed = 10201;

  /// Message decoding failed
  static const int messageDecodingFailed = 10202;

  /// Unsupported long connection binary protocol
  static const int unsupportedLongConnection = 10203;

  /// Message sent multiple times
  static const int messageRepeated = 10204;

  /// Message content type not supported
  static const int messageContentTypeNotSupported = 10205;

  /// Unsupported session operation
  static const int unsupportedSessionOperation = 10301;

  /// Group ID does not exist
  static const int groupIDNotExist = 10400;

  /// Group type is incorrect
  static const int wrongGroupType = 10401;

  /// Server Internal Error, usually an internal network error, check if server nodes are running correctly
  static const int serverInternalError = 500;

  /// Parameter Error on the server, check if body and header parameters are correct
  static const int serverParameterError = 1001;

  /// Insufficient Permissions, typically when the token in the header is incorrect or when trying to perform unauthorized actions
  static const int insufficientPermissions = 1002;

  /// Duplicate Database Primary Key
  static const int duplicateDatabasePrimaryKey = 1003;

  /// Database Record Not Found
  static const int databaseRecordNotFound = 1004;

  /// User ID does not exist
  static const int userIDNotExist = 1101;

  /// User is already registered
  static const int userAlreadyRegistered = 1102;

  /// Group does not exist
  static const int groupNotExis = 1201;

  /// Group already exists
  static const int groupAlreadyExists = 1202;

  /// User is not in the group
  static const int userIsNotInGroup = 1203;

  /// Group has been disbanded
  static const int groupDisbanded = 1204;

  /// Group application has already been processed, no need to process it again
  static const int groupApplicationHasBeenProcessed = 1206;

  /// Cannot add yourself as a friend
  static const int notAddMyselfAsAFriend = 1301;

  /// You have been blocked by the other party
  static const int hasBeenBlocked = 1302;

  /// The other party is not your friend
  static const int notFriend = 1303;

  /// Already in a friend relationship, no need to reapply
  static const int alreadyAFriendRelationship = 1304;

  /// Message read function is turned off
  static const int messageReadFunctionIsTurnedOff = 1401;

  /// You have been banned from speaking in the group
  static const int youHaveBeenBanned = 1402;

  /// The group has been banned from posting
  static const int groupHasBeenBanned = 1403;

  /// This message has been retracted
  static const int messageHasBeenRetracted = 1404;

  /// Authorization has expired
  static const int licenseExpired = 1405;

  /// Token has expired
  static const int tokenHasExpired = 1501;

  /// Invalid token
  static const int tokenInvalid = 1502;

  /// Token format error
  static const int tokenFormatError = 1503;

  /// Token has not yet taken effect
  static const int tokenHasNotYetTakenEffect = 1504;

  /// Unknown token error
  static const int unknownTokenError = 1505;

  /// The kicked-out token is invalid
  static const int thekickedOutTokenIsInvalid = 1506;

  /// Token does not exist
  static const int tokenNotExist = 1507;

  /// Number of Connections Exceeds Gateway's Maximum Limit
  static const int connectionsExceedsMaximumLimit = 1601;

  /// Handshake Parameter Error
  static const int handshakeParameterError = 1602;

  /// File Upload Expired
  static const int fileUploadExpired = 1701;
}
