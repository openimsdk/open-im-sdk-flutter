import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/listener/conversation_listener.dart';
import 'package:flutter_openim_sdk/models/conversation_info.dart';

class ConversationManager {
  MethodChannel _channel;
  late ConversationListener conversationListener;

  ConversationManager(this._channel);

  void setConversationListener(ConversationListener listener) {
    this.conversationListener = listener;
    _channel.invokeMethod('setConversationListener', _buildParam({}));
  }

  Future<List<ConversationInfo>> getAllConversationList() {
    return _channel
        .invokeMethod('getAllConversationList', _buildParam({}))
        .then((value) => _toList(value));
  }

  Future<ConversationInfo> getSingleConversation(
      {required String conversationID}) {
    return _channel
        .invokeMethod(
            'getOneConversation',
            _buildParam({
              "conversationID": conversationID,
            }))
        .then((value) => _toObj(value));
  }

  Future<List<ConversationInfo>> getMultipleConversation(
      {required List<String> conversationIDList}) {
    return _channel
        .invokeMethod('getMultipleConversation',
            _buildParam({"conversationIDList": conversationIDList}))
        .then((value) => _toList(value));
  }

  void deleteConversation({required String conversationID}) {
    _channel
        .invokeMethod('deleteConversation',
            _buildParam({"conversationID": conversationID}))
        .then((value) => _printValue(value));
  }

  void setConversationDraft(
      {required String conversationID, required String draftText}) {
    _channel
        .invokeMethod(
            'setConversationDraft',
            _buildParam(
                {"conversationID": conversationID, "draftText": draftText}))
        .then((value) => _printValue(value));
  }

  void pinConversation(
      {required String conversationID, required bool isPinned}) {
    _channel
        .invokeMethod(
            'pinConversation',
            _buildParam(
                {"conversationID": conversationID, "isPinned": isPinned}))
        .then((value) => _printValue(value));
  }

  Future<dynamic> getTotalUnreadMsgCount() {
    return _channel.invokeMethod('getTotalUnreadMsgCount', _buildParam({}));
  }

  ///@nodoc
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

  ///@nodoc
  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
