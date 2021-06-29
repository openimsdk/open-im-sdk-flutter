import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/listener/advanced_msg_listener.dart';
import 'package:flutter_openim_sdk/listener/msg_send_progress_listener.dart';
import 'package:flutter_openim_sdk/models/message.dart';

class MessageManager {
  MethodChannel _channel;
  List<AdvancedMsgListener> advancedMsgListeners = List.empty(growable: true);
  MsgSendProgressListener? msgSendProgressListener;

  MessageManager(this._channel);

  void addAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.add(listener);
    _channel.invokeMethod(
        'addAdvancedMsgListener', _buildParam({'id': listener.id}));
  }

  void removeAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.remove(listener);
    _channel.invokeMethod(
        'removeAdvancedMsgListener', _buildParam({'id': listener.id}));
  }

  void setMsgProgressListener(MsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /*Future<Message> */
  Future<dynamic> sendMessage({
    required Message message,
    String? receiver,
    String? groupID,
    required bool onlineUserOnly,
  }) {
    return _channel.invokeMethod(
            'sendMessage',
            _buildParam({
              'message': message.toJson(),
              'receiver': receiver ?? '',
              'groupID': groupID ?? '',
              'onlineUserOnly': onlineUserOnly,
            }))
        /*.then((value) => _toObj(value))*/;
  }

  Future<List<Message>> getHistoryMessageList({
    String? userID,
    Message? startMsg,
    String? groupID,
    int? count,
  }) {
    return _channel
        .invokeMethod(
            'getHistoryMessageList',
            _buildParam({
              'userID': userID ?? '',
              'startMsg': startMsg?.toJson() /*?? {}*/,
              'groupID': groupID ?? '',
              'count': count ?? 10,
            }))
        .then((value) => _toList(value));
  }

  void revokeMessage({required Message message}) {
    _channel.invokeMethod('revokeMessage', _buildParam(message.toJson()));
  }

  Future deleteMessageFromLocalStorage({required Message message}) {
    return _channel.invokeMethod(
        'deleteMessageFromLocalStorage', _buildParam(message.toJson()));
  }

  void deleteMessages({required List<Message> msgList}) {
    // _channel.invokeMethod('deleteMessages', _buildParam(msgList.toJson()));
  }

  void insertSingleMessageToLocalStorage({
    String? userID,
    Message? message,
    String? sender,
  }) {
    _channel.invokeMethod(
        'insertSingleMessageToLocalStorage',
        _buildParam({
          "userID": userID,
          "message": message?.toJson(),
          "sender": sender,
        }));
  }

  void findMessages({required List<String> messageIDList}) {
    _channel.invokeMethod(
        'findMessages',
        _buildParam({
          "messageIDList": messageIDList,
        }));
  }

  Future<dynamic> markSingleMessageHasRead({required String userID}) {
    return _channel.invokeMethod(
        'markSingleMessageHasRead', _buildParam({'userID': userID}));
  }

  Future<Message> createTextMessage({required String text}) {
    return _channel
        .invokeMethod('createTextMessage', _buildParam({'text': text}))
        .then((value) => _toObj(value));
  }

  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUserList,
  }) {
    return _channel
        .invokeMethod(
          'createTextAtMessage',
          _buildParam({
            'text': text,
            'atUserList': atUserList,
          }),
        )
        .then((value) => _toObj(value));
  }

  Future<Message> createImageMessage({required String imagePath}) {
    return _channel
        .invokeMethod(
          'createImageMessage',
          _buildParam({'imagePath': imagePath}),
        )
        .then((value) => _toObj(value));
  }

  Future<Message> createSoundMessage(
      {required String soundPath, required int duration}) {
    return _channel
        .invokeMethod(
          'createSoundMessage',
          _buildParam({'soundPath': soundPath, "duration": duration}),
        )
        .then((value) => _toObj(value));
  }

  Future<Message> createVideoMessage({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
  }) {
    return _channel
        .invokeMethod(
            'createVideoMessage',
            _buildParam({
              'videoPath': videoPath,
              'videoType': videoType,
              'duration': duration,
              'snapshotPath': snapshotPath,
            }))
        .then((value) => _toObj(value));
  }

  Future<Message> createFileMessage(
      {required String filePath, required String fileName}) {
    return _channel
        .invokeMethod('createFileMessage',
            _buildParam({'filePath': filePath, 'fileName': fileName}))
        .then((value) => _toObj(value));
  }

  Future<Message> createMergerMessage(
      {required List<Message> messageList,
      required String title,
      required List<String> summaryList}) {
    return _channel
        .invokeMethod(
            'createMergerMessage',
            _buildParam({
              'messageList': messageList.map((e) => e.toJson()).toList(),
              'title': title,
              'summaryList': summaryList,
            }))
        .then((value) => _toObj(value));
  }

  Future<Message> createForwardMessage({required List<Message> messageList}) {
    return _channel
        .invokeMethod(
            'createForwardMessage',
            _buildParam(
                {'message': messageList.map((e) => e.toJson()).toList()}))
        .then((value) => _toObj(value));
  }

  ///@nodoc
  static Map _buildParam(Map param) {
    print('param:$param');
    param["ManagerName"] = "messageManager";
    return param;
  }

  static List<Message> _toList(String value) =>
      (_formatJson(value) as List).map((e) => Message.fromJson(e)).toList();

  static Message _toObj(String value) => Message.fromJson(_formatJson(value));

  ///@nodoc
  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
