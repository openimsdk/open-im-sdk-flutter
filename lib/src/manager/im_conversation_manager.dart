import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class ConversationManager {
  MethodChannel _channel;
  late OnConversationListener listener;

  ConversationManager(this._channel);

  /// Conversation Listener
  Future setConversationListener(OnConversationListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setConversationListener', _buildParam({}));
  }

  /// Get All Conversations
  Future<List<ConversationInfo>> getAllConversationList({String? operationID}) => _channel
      .invokeMethod(
          'getAllConversationList',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }))
      .then((value) => Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// Paginate Through Conversations
  /// [offset] Starting index
  /// [count] Number of items per page
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
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// Query a Conversation; if it doesn't exist, it will be created
  /// [sourceID] UserID for one-on-one conversation, GroupID for group conversation
  /// [sessionType] Reference [ConversationType]
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
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => ConversationInfo.fromJson(map)));

  /// Get Multiple Conversations by Conversation ID
  /// [conversationIDList] List of conversation IDs
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getMultipleConversation',
              _buildParam({
                "conversationIDList": conversationIDList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// Set Conversation Draft
  /// [conversationID] Conversation ID
  /// [draftText] Draft text
  Future setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationDraft',
          _buildParam({
            "conversationID": conversationID,
            "draftText": draftText,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Pin a Conversation
  /// [conversationID] Conversation ID
  /// [isPinned] true: pin, false: unpin
  Future pinConversation({
    required String conversationID,
    required bool isPinned,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'pinConversation',
          _buildParam({
            "conversationID": conversationID,
            "isPinned": isPinned,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Hide a Conversation
  /// [conversationID] Conversation ID
  Future hideConversation({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'hideConversation',
          _buildParam({
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Hide All Conversations
  Future hideAllConversations({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'hideAllConversations',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Query Conversation ID
  /// [sourceID] UserID for one-on-one, GroupID for group
  /// [sessionType] Reference [ConversationType]
  Future<dynamic> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) {
    return _channel.invokeMethod(
        'getConversationIDBySessionType',
        _buildParam({
          'sourceID': sourceID,
          'sessionType': sessionType,
          'operationID': Utils.checkOperationID(operationID),
        }));
  }

  /// get total unread message count
  /// int.tryParse(count) ?? 0;
  Future<dynamic> getTotalUnreadMsgCount({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'getTotalUnreadMsgCount',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Message Do-Not-Disturb Setting
  /// [conversationID] Conversation ID
  /// [status] 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<dynamic> setConversationRecvMessageOpt({
    required String conversationID,
    required int status,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationRecvMessageOpt',
          _buildParam({
            "conversationID": conversationID,
            "status": status,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Query Do-Not-Disturb Status
  /// [conversationIDList] List of conversation IDs
  /// Returns: [{"conversationId":"single_13922222222","result":0}], result values: 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<List<dynamic>> getConversationRecvMessageOpt({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getConversationRecvMessageOpt',
              _buildParam({
                "conversationIDList": conversationIDList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toListMap(value));

  /// Self-Destruct Messages
  /// [conversationID] Conversation ID
  /// [isPrivate] true: enable, false: disable
  Future<dynamic> setConversationPrivateChat({
    required String conversationID,
    required bool isPrivate,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationPrivateChat',
          _buildParam({
            "conversationID": conversationID,
            "isPrivate": isPrivate,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Delete a Conversation Locally and from the Server
  /// [conversationID] Conversation ID
  Future<dynamic> deleteConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteConversationAndDeleteAllMsg',
          _buildParam({
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Clear Messages in a Conversation
  /// [conversationID] Conversation ID
  Future<dynamic> clearConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearConversationAndDeleteAllMsg',
          _buildParam({
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Delete All Local Conversations
  Future<dynamic> deleteAllConversationFromLocal({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllConversationFromLocal',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Reset Mentioned (Group At) Flags [GroupAtType]
  /// [conversationID] Conversation ID
  Future<dynamic> resetConversationGroupAtType({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'resetConversationGroupAtType',
          _buildParam({
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Query @ All Flag
  Future<dynamic> getAtAllTag({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'getAtAllTag',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Get @ All Tag
  String get atAllTag => 'AtAllTag';

  /// Global Do-Not-Disturb
  /// [status] 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
  Future<dynamic> setGlobalRecvMessageOpt({
    required int status,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setGlobalRecvMessageOpt',
          _buildParam({
            "status": status,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Set Self-Destruct Message Duration
  /// [conversationID] Conversation ID
  /// [burnDuration] Duration in seconds, default: 30s
  Future<dynamic> setConversationBurnDuration({
    required String conversationID,
    int burnDuration = 30,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationBurnDuration',
          _buildParam({
            "conversationID": conversationID,
            "burnDuration": burnDuration,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Mark Messages as Read
  /// [conversationID] Conversation ID
  Future markConversationMessageAsRead({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markConversationMessageAsRead',
          _buildParam({
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Enable Regular Deletion
  /// [isMsgDestruct] true: enable
  Future<dynamic> setConversationIsMsgDestruct({
    required String conversationID,
    bool isMsgDestruct = true,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationIsMsgDestruct',
          _buildParam({
            "conversationID": conversationID,
            "isMsgDestruct": isMsgDestruct,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Regularly Delete Chat Records
  /// [duration] Seconds
  Future<dynamic> setConversationMsgDestructTime({
    required String conversationID,
    int duration = 1 * 24 * 60 * 60,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'setConversationMsgDestructTime',
          _buildParam({
            "conversationID": conversationID,
            "duration": duration,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Custom Sort for Conversation List
  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      if ((a.isPinned == true && b.isPinned == true) || (a.isPinned != true && b.isPinned != true)) {
        int aCompare = a.draftTextTime! > a.latestMsgSendTime! ? a.draftTextTime! : a.latestMsgSendTime!;
        int bCompare = b.draftTextTime! > b.latestMsgSendTime! ? b.draftTextTime! : b.latestMsgSendTime!;
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
    log('param: $param');
    return param;
  }
}
