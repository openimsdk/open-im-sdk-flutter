import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

import '../models/update_req.dart';

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
  }) {
    final req = ConversationReq(isPinned: isPinned);

    return setConversation(conversationID, req, operationID: operationID);
  }

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
  @Deprecated('use [setConversation] instead')
  Future<dynamic> setConversationRecvMessageOpt({
    required String conversationID,
    required int status,
    String? operationID,
  }) {
    final req = ConversationReq(recvMsgOpt: status);

    return setConversation(conversationID, req, operationID: operationID);
  }

  /// Message Do-Not-Disturb Setting
  /// [conversationID] Conversation ID
  /// [status] 0: normal; 1: not receiving messages; 2: receive online messages but not offline messages
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
  @Deprecated('use [setConversation] instead')
  Future<dynamic> setConversationPrivateChat({
    required String conversationID,
    required bool isPrivate,
    String? operationID,
  }) {
    final req = ConversationReq(isPrivateChat: isPrivate);

    return setConversation(conversationID, req, operationID: operationID);
  }

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
  @Deprecated('use hideAllConversations instead')
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
  @Deprecated('use [setConversation] instead')
  Future<dynamic> resetConversationGroupAtType({
    required String conversationID,
    String? operationID,
  }) {
    final req = ConversationReq(groupAtType: 0);

    return setConversation(conversationID, req, operationID: operationID);
  }

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
  @Deprecated('use [OpenIM.iMManager.userManager.setSelfInfo()] instead')
  Future<dynamic> setGlobalRecvMessageOpt({
    required int status,
    String? operationID,
  }) {
    throw UnimplementedError('setGlobalRecvMessageOpt');
  }

  /// Set Self-Destruct Message Duration
  /// [conversationID] Conversation ID
  /// [burnDuration] Duration in seconds, default: 30s
  @Deprecated('use [setConversation] instead')
  Future<dynamic> setConversationBurnDuration({
    required String conversationID,
    int burnDuration = 30,
    String? operationID,
  }) {
    final req = ConversationReq(burnDuration: burnDuration);

    return setConversation(conversationID, req, operationID: operationID);
  }

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

  /// search Conversations
  Future<List<ConversationInfo>> searchConversations(
    String name, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'searchConversations',
            _buildParam({
              'name': name,
              "operationID": Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toList(value, (map) => ConversationInfo.fromJson(map)));
  }

  @Deprecated('use [setConversation] instead')
  Future setConversationEx(
    String conversationID, {
    String? ex,
    String? operationID,
  }) {
    final req = ConversationReq(ex: ex);

    return setConversation(conversationID, req, operationID: operationID);
  }

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

  Future changeInputStates({
    required String conversationID,
    required bool focus,
    String? operationID,
  }) {
    return _channel.invokeMethod(
      'changeInputStates',
      _buildParam(
        {
          'focus': focus,
          'conversationID': conversationID,
          'operationID': Utils.checkOperationID(operationID),
        },
      ),
    );
  }

  Future<List<int>?> getInputStates(
    String conversationID,
    String userID, {
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
      'getInputStates',
      _buildParam(
        {
          'conversationID': conversationID,
          'userID': userID,
          'operationID': Utils.checkOperationID(operationID),
        },
      ),
    )
        .then((value) {
      print('getInputStates: $value');
      final result = Utils.toListMap(value);
      return List<int>.from(result);
    });
  }

  Future setConversation(
    String conversationID,
    ConversationReq req, {
    String? operationID,
  }) {
    return _channel.invokeMethod(
      'setConversation',
      _buildParam(
        {
          'conversationID': conversationID,
          'req': req.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        },
      ),
    );
  }

  static Map _buildParam(Map<String, dynamic> param) {
    param["ManagerName"] = "conversationManager";
    param = Utils.cleanMap(param);
    log('param: $param');

    return param;
  }
}
