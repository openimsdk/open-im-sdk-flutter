import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

///
///
class ConversationManager {
  MethodChannel _channel;
  late ConversationListener conversationListener;

  ConversationManager(this._channel);

  /// Observe conversation changes
  /// 会话监听
  Future setConversationListener(ConversationListener listener) {
    this.conversationListener = listener;
    return _channel.invokeMethod('setConversationListener', _buildParam({}));
  }

  /// Get all conversations
  /// 获取所有会话
  Future<List<ConversationInfo>> getAllConversationList(
          {String? operationID}) =>
      _channel
          .invokeMethod(
              'getAllConversationList',
              _buildParam({
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _toList(value));

  /// Paging to get conversation
  /// 分页获取会话
  Future<List<ConversationInfo>> getConversationListSplit({
    int offset = 0,
    int count = 20,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getConversationListSplit',
              _buildParam({
                'offset': offset,
                'count': count,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _toList(value));

  /// Get a conversation, if it doesn't exist it will be created automatically
  /// [sourceID] if it is a single chat, Its value is userID. if it is a group chat, Its value is groupID
  /// [sessionType] if it is a single chat, it value is 1. if it is a group chat, it value is 2
  /// 获取一个会话，如果不存在会自动创建
  /// [sourceID] 如果是单聊值传用户ID，如果是群聊值传组ID
  /// [sessionType] 如果是单聊值传1，如果是群聊值传2
  Future<ConversationInfo> getOneConversation({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getOneConversation',
              _buildParam({
                "sourceID": sourceID,
                "sessionType": sessionType,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _toObj(value));

  /// Get conversation list by id list
  /// 获取多个会话
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getMultipleConversation',
              _buildParam({
                "conversationIDList": conversationIDList,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _toList(value));

  /// Delete conversation by id
  /// 删除会话
  Future deleteConversation({
    required String conversationID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'deleteConversation',
              _buildParam({
                "conversationID": conversationID,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _printValue(value));

  /// Set draft
  /// 设置会话草稿
  Future setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'setConversationDraft',
              _buildParam({
                "conversationID": conversationID,
                "draftText": draftText,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _printValue(value));

  /// Pinned conversation
  /// 置顶会话
  Future pinConversation({
    required String conversationID,
    required bool isPinned,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'pinConversation',
              _buildParam({
                "conversationID": conversationID,
                "isPinned": isPinned,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _printValue(value));

  /// Mark single chat messages as read
  /// 标记单聊已读
  // Future<dynamic> markSingleMessageHasRead({required String userID}) =>
  //     _channel.invokeMethod(
  //         'markSingleMessageHasRead', _buildParam({'userID': userID}));

  /// Mark group chat messages as read
  /// 标记群聊已读
  Future<dynamic> markGroupMessageHasRead({
    required String groupID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markGroupMessageHasRead',
          _buildParam({
            'groupID': groupID,
            "operationID": _checkOperationID(operationID),
          }));

  /// Get the total number of unread messages
  /// 获取未读消息总数
  Future<dynamic> getTotalUnreadMsgCount({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'getTotalUnreadMsgCount',
          _buildParam({
            "operationID": _checkOperationID(operationID),
          }));

  /// Query conversation id
  /// [sourceID] if it is a single chat, Its value is userID. if it is a group chat, Its value is groupID
  /// [sessionType] if it is a single chat, it value is 1. if it is a group chat, it value is 2
  /// 查询会话id
  /// [sourceID] 如果是单聊值传用户ID，如果是群聊值传组ID
  /// [sessionType] 如果是单聊值传1，如果是群聊值传2
  Future<dynamic> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
  }) =>
      _channel.invokeMethod(
          'getConversationIDBySessionType',
          _buildParam({
            "sourceID": sourceID,
            "sessionType": sessionType,
          }));

  /// Message Do Not Disturb
  /// [status] 1: Do not receive messages. 2: Do not notify when messages are received. 0: Normal.
  /// 消息免打扰设置
  /// [status] 1：不接受消息；2：接受在线消息不接受离线消息；3：正常
  Future<dynamic> setConversationRecvMessageOpt({
    required List<String> conversationIDList,
    required int status,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationRecvMessageOpt',
          _buildParam({
            "conversationIDList": conversationIDList,
            "status": status,
            "operationID": _checkOperationID(operationID),
          }));

  /// Message Do Not Disturb
  /// [{"conversationId":"single_13922222222","result":0}]
  /// 查询免打扰状态
  Future<List<dynamic>> getConversationRecvMessageOpt({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getConversationRecvMessageOpt',
              _buildParam({
                "conversationIDList": conversationIDList,
                "operationID": _checkOperationID(operationID),
              }))
          .then((value) => _formatJson(value));

  /// Custom sort for conversation list
  /// 会话列表自定义排序规则
  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      if ((a.isPinned == true && b.isPinned == true) ||
          (a.isPinned != true && b.isPinned != true)) {
        int aCompare = a.draftTextTime! > a.latestMsgSendTime!
            ? a.draftTextTime!
            : a.latestMsgSendTime!;
        int bCompare = b.draftTextTime! > b.latestMsgSendTime!
            ? b.draftTextTime!
            : b.latestMsgSendTime!;
        if (aCompare > bCompare) {
          return -1;
        } else if (aCompare < bCompare) {
          return 1;
        } else {
          return 0;
        }
      } else if (a.isPinned == true && b.isPinned != true) {
        return -1;
      } else {
        return 1;
      }
    });

  static Map _buildParam(Map param) {
    param["ManagerName"] = "conversationManager";
    return param;
  }

  static List<ConversationInfo> _toList(String? value) {
    var list = _formatJson(value);
    if (null == list) return <ConversationInfo>[];
    return (list as List).map((e) => ConversationInfo.fromJson(e)).toList();
  }

  static ConversationInfo _toObj(String value) =>
      ConversationInfo.fromJson(_formatJson(value));

  static dynamic _formatJson(value) => jsonDecode(_printValue(value));

  static String _printValue(value) {
    return value;
  }

  static String _checkOperationID(String? obj) {
    return obj ?? DateTime.now().millisecondsSinceEpoch.toString();
  }
}
