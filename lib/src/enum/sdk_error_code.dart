// /// 消息发送失败
// class MessageFailedCode {
//   /// 被对方拉黑
//   static const int blockedByFriend = 1302;
//
//   /// 被对方删除
//   static const int deletedByFriend = 1303;
//
//   /// 已被移除群聊/群已解散
//   static const int notInGroup = 1204;
// }
//
// /// 添加好友失败
// class AddFriendFailedCode {
//   /// 该用户已设置不可添加
//   static const int refuseToAddFriends = 10013;
// }

class SDKErrorCode {
  /// 网络请求错误
  static const int networkRequestError = 10000;

  /// 网络等待超时错误
  static const int networkWaitTimeoutError = 10001;

  /// 参数错误
  static const int parameterError = 10002;

  /// 上下文超时错误，通常为用户已经退出
  static const int contextTimeoutError = 10003;

  /// 资源未加载完毕，通常为未初始化，或者登录接口还未成功返回
  static const int resourceNotLoaded = 10004;

  /// 未知错误，需要根据 errmsg 确认原因
  static const int unknownError = 10005;

  /// sdk 内部错误，需要根据 errmsg 确认原因
  static const int sdkInternalError = 10006;

  /// 该用户已设置不可添加
  static const int refuseToAddFriends = 10013;

  /// 用户不存在或未注册
  static const int userNotExistOrNotRegistered = 10100;

  /// 用户已经退出登录
  static const int userHasLoggedOut = 10101;

  /// 用户重复登录，可以通过 getloginstatus 确认登录状态，避免重复登录
  static const int repeatLogin = 10102;

  /// 需要上传的文件不存在
  static const int uploadFileNotExist = 10200;

  /// 消息解压失败
  static const int messageDecompressionFailed = 10201;

  /// 消息解码失败
  static const int messageDecodingFailed = 10202;

  /// 不支持的长连接二进制协议
  static const int unsupportedLongConnection = 10203;

  /// 消息重复发送
  static const int messageRepeated = 10204;

  /// 消息内容类型不支持
  static const int messageContentTypeNotSupported = 10205;

  /// 不支持的会话操作
  static const int unsupportedSessionOperation = 10301;

  /// 群 ID 不存在
  static const int groupIDNotExist = 10400;

  /// 群组类型错误
  static const int wrongGroupType = 10401;

  /// 服务器内部错误，通常为内部网络错误，需要检查服务器各节点运行是否正常
  static const int serverInternalError = 500;

  /// 	参数错误，需要检查 body 参数以及 header 参数是否正确
  static const int serverParameterError = 1001;

  /// 权限不足，一般为 header 参数中携带 token 不正确，或者权限越级操作
  static const int insufficientPermissions = 1002;

  /// 数据库主键重复
  static const int duplicateDatabasePrimaryKey = 1003;

  /// 数据库记录未找到
  static const int databaseRecordNotFound = 1004;

  /// 	用户 ID 不存在
  static const int userIDNotExist = 1101;

  /// 用户已经注册
  static const int userAlreadyRegistered = 1102;

  /// 群不存在
  static const int groupNotExis = 1201;

  /// 群已存在
  static const int groupAlreadyExists = 1202;

  /// 用户不在群组中
  static const int userIsNotInGroup = 1203;

  /// 群组已解散
  static const int groupDisbanded = 1204;

  /// 群申请已经被处理，不需要重复处理
  static const int groupApplicationHasBeenProcessed = 1206;

  /// 不能添加自己为好友
  static const int notAddMyselfAsAFriend = 1301;

  /// 已被对方拉黑
  static const int hasBeenBlocked = 1302;

  /// 对方不是自己的好友
  static const int notFriend = 1303;

  /// 已经是好友关系，不需要重复申请
  static const int alreadyAFriendRelationship = 1304;

  /// 消息已读功能被关闭
  static const int messageReadFunctionIsTurnedOff = 1401;

  /// 你已被禁言，不能在群里发言
  static const int youHaveBeenBanned = 1402;

  /// 群已被禁言，不能发言
  static const int groupHasBeenBanned = 1403;

  /// 该消息已被撤回
  static const int messageHasBeenRetracted = 1404;

  /// 授权过期
  static const int licenseExpired = 1405;

  /// token 已经过期
  static const int tokenHasExpired = 1501;

  /// token 无效
  static const int tokenInvalid = 1502;

  /// token 格式错误
  static const int tokenFormatError = 1503;

  /// token 还未生效
  static const int tokenHasNotYetTakenEffect = 1504;

  /// 未知 token 错误
  static const int unknownTokenError = 1505;

  /// 被踢出的 token，无效
  static const int thekickedOutTokenIsInvalid = 1506;

  /// token 不存在
  static const int tokenNotExist = 1507;

  /// 连接数超过网关最大限制
  static const int connectionsExceedsMaximumLimit = 1601;

  /// 连接握手参数错误
  static const int handshakeParameterError = 1602;

  /// 文件上传过期
  static const int fileUploadExpired = 1701;
}
