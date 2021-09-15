import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

///
///
class ConversationManager {
  MethodChannel _channel;
  late ConversationListener conversationListener;

  ConversationManager(this._channel);

  /// listener[ConversationListener]，Observe conversation changes
  ///
  Future setConversationListener(ConversationListener listener) {
    this.conversationListener = listener;
    return _channel.invokeMethod('setConversationListener', _buildParam({}));
  }

  /// get all conversations
  ///
  Future<List<ConversationInfo>> getAllConversationList() => _channel
      .invokeMethod('getAllConversationList', _buildParam({}))
      .then((value) => _toList(value));

  /// sourceID: if it is a single chat, Its value is userID. if it is a group chat, Its value is groupID
  /// sessionType: if it is a single chat, it value is 1. if it is a group chat, it value is 2
  ///
  Future<ConversationInfo> getSingleConversation({
    required String sourceID,
    required String sessionType,
  }) =>
      _channel
          .invokeMethod(
              'getOneConversation',
              _buildParam({
                "sourceID": sourceID,
                "sessionType": sessionType,
              }))
          .then((value) => _toObj(value));

  /// get conversation list by id list
  ///
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
  }) =>
      _channel
          .invokeMethod(
              'getMultipleConversation',
              _buildParam({
                "conversationIDList": conversationIDList,
              }))
          .then((value) => _toList(value));

  /// delete conversation by id
  ///
  Future deleteConversation({
    required String conversationID,
  }) =>
      _channel
          .invokeMethod(
              'deleteConversation',
              _buildParam({
                "conversationID": conversationID,
              }))
          .then((value) => _printValue(value));

  /// set draft
  ///
  Future setConversationDraft({
    required String conversationID,
    required String draftText,
  }) =>
      _channel
          .invokeMethod(
              'setConversationDraft',
              _buildParam({
                "conversationID": conversationID,
                "draftText": draftText,
              }))
          .then((value) => _printValue(value));

  /// pinned conversation
  ///
  Future pinConversation({
    required String conversationID,
    required bool isPinned,
  }) =>
      _channel
          .invokeMethod(
              'pinConversation',
              _buildParam({
                "conversationID": conversationID,
                "isPinned": isPinned,
              }))
          .then((value) => _printValue(value));

  ///
  /// @params userID: receiver's userID
  Future<dynamic> markSingleMessageHasRead({required String userID}) {
    return _channel.invokeMethod(
        'markSingleMessageHasRead', _buildParam({'userID': userID}));
  }

  ///
  Future<dynamic> markGroupMessageHasRead({required String groupID}) {
    return _channel.invokeMethod(
        'markGroupMessageHasRead', _buildParam({'groupID': groupID}));
  }

  ///
  Future<dynamic> getTotalUnreadMsgCount() {
    return _channel.invokeMethod('getTotalUnreadMsgCount', _buildParam({}));
  }

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

  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
