import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class MessageManager {
  MethodChannel _channel;
  List<AdvancedMsgListener> advancedMsgListeners = List.empty(growable: true);
  MsgSendProgressListener? msgSendProgressListener;

  MessageManager(this._channel);

  ///
  Future addAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.add(listener);
    return _channel.invokeMethod(
        'addAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  ///
  Future removeAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.remove(listener);
    return _channel.invokeMethod(
        'removeAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  ///
  void setMsgSendProgressListener(MsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /// send a message to user or to group
  /// userID: receiver's user ID
  Future<dynamic> sendMessage({
    required Message message,
    String? userID,
    String? groupID,
    bool onlineUserOnly = false,
  }) {
    return _channel.invokeMethod(
            'sendMessage',
            _buildParam({
              'message': message.toJson(),
              'receiver': userID ?? '',
              'groupID': groupID ?? '',
              'onlineUserOnly': onlineUserOnly,
            }))
        /*.then((value) => _toObj(value))*/;
  }

  /// find all history message
  /// userID: the user id of the chat partner
  Future<List<Message>> getHistoryMessageList({
    String? userID,
    String? groupID,
    Message? startMsg,
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

  /// revoke the sent information
  Future revokeMessage({required Message message}) {
    return _channel.invokeMethod(
        'revokeMessage', _buildParam(message.toJson()));
  }

  /// delete message
  Future deleteMessageFromLocalStorage({required Message message}) {
    return _channel.invokeMethod(
        'deleteMessageFromLocalStorage', _buildParam(message.toJson()));
  }

  ///
  @deprecated
  Future deleteMessages({required List<Message> msgList}) {
    return _channel.invokeMethod('deleteMessages',
        _buildParam({"msgList": msgList.map((e) => e.toJson()).toList()}));
  }

  ///
  /// @params userID: receiver's user ID
  /// @params sender: current user ID
  Future insertSingleMessageToLocalStorage({
    String? receiver,
    String? sender,
    Message? message,
  }) {
    return _channel.invokeMethod(
        'insertSingleMessageToLocalStorage',
        _buildParam({
          "userID": receiver,
          "message": message?.toJson(),
          "sender": sender,
        }));
  }

  ///
  Future findMessages({required List<String> messageIDList}) {
    return _channel.invokeMethod(
        'findMessages',
        _buildParam({
          "messageIDList": messageIDList,
        }));
  }

  ///
  /// @params userID: receiver's user ID
  Future markC2CMessageAsRead({
    required String userID,
    required List<String> messageIDList,
  }) {
    return _channel.invokeMethod(
        'markC2CMessageAsRead',
        _buildParam({
          "messageIDList": messageIDList,
          "userID": userID,
        }));
  }

  ///
  /// @params userID: receiver's user ID
  /// @params status: default no
  Future typingStatusUpdate({
    required String userID,
    bool typing = false,
  }) {
    return _channel.invokeMethod(
        'typingStatusUpdate',
        _buildParam({
          "typing": typing ? 'yes' : 'no',
          "userID": userID,
        }));
  }

  ///
  Future<Message> createTextMessage({required String text}) {
    return _channel
        .invokeMethod('createTextMessage', _buildParam({'text': text}))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUidList,
  }) {
    return _channel
        .invokeMethod(
          'createTextAtMessage',
          _buildParam({
            'text': text,
            'atUserList': atUidList,
          }),
        )
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createImageMessage({required String imagePath}) {
    return _channel
        .invokeMethod(
          'createImageMessage',
          _buildParam({'imagePath': imagePath}),
        )
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createImageMessageFromFullPath({required String imagePath}) {
    return _channel
        .invokeMethod(
          'createImageMessageFromFullPath',
          _buildParam({'imagePath': imagePath}),
        )
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createSoundMessage({
    required String soundPath,
    required int duration,
  }) {
    return _channel
        .invokeMethod(
          'createSoundMessage',
          _buildParam({'soundPath': soundPath, "duration": duration}),
        )
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createSoundMessageFromFullPath({
    required String soundPath,
    required int duration,
  }) {
    return _channel
        .invokeMethod(
          'createSoundMessageFromFullPath',
          _buildParam({'soundPath': soundPath, "duration": duration}),
        )
        .then((value) => _toObj(value));
  }

  ///
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

  ///
  Future<Message> createVideoMessageFromFullPath({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
  }) {
    return _channel
        .invokeMethod(
            'createVideoMessageFromFullPath',
            _buildParam({
              'videoPath': videoPath,
              'videoType': videoType,
              'duration': duration,
              'snapshotPath': snapshotPath,
            }))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createFileMessage({
    required String filePath,
    required String fileName,
  }) {
    return _channel
        .invokeMethod(
            'createFileMessage',
            _buildParam({
              'filePath': filePath,
              'fileName': fileName,
            }))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createMergerMessage({
    required List<Message> messageList,
    required String title,
    required List<String> summaryList,
  }) {
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

  ///
  Future<Message> createForwardMessage({required Message message}) {
    return _channel
        .invokeMethod(
            'createForwardMessage',
            _buildParam({
              'message': message.toJson(),
            }))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createLocationMessage({
    required double latitude,
    required double longitude,
    required String description,
  }) {
    return _channel
        .invokeMethod(
            'createLocationMessage',
            _buildParam({
              'latitude': latitude,
              'longitude': longitude,
              'description': description,
            }))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createCustomMessage({
    required Map<String, dynamic> data,
    required Map<String, dynamic> extension,
    required String description,
  }) {
    return _channel
        .invokeMethod(
            'createCustomMessage',
            _buildParam({
              'data': data,
              'extension': extension,
              'description': description,
            }))
        .then((value) => _toObj(value));
  }

  ///
  Future<Message> createQuoteMessage({
    required String text,
    required Message quoteMsg,
  }) {
    return _channel
        .invokeMethod(
            'createQuoteMessage',
            _buildParam({
              'quoteText': text,
              'quoteMessage': quoteMsg.toJson(),
            }))
        .then((value) => _toObj(value));
  }

  Future<Message> createCardMessage({
    required Map<String, dynamic> data,
  }) {
    return _channel
        .invokeMethod(
            'createCardMessage',
            _buildParam({
              'cardMessage': data,
            }))
        .then((value) => _toObj(value));
  }

  ///
  void forceSyncMsg() {
    _channel.invokeMethod('forceSyncMsg', _buildParam({}));
  }

  static Map _buildParam(Map param) {
    param["ManagerName"] = "messageManager";
    return param;
  }

  static List<Message> _toList(String value) =>
      (_formatJson(value) as List).map((e) => Message.fromJson(e)).toList();

  static Message _toObj(String value) => Message.fromJson(_formatJson(value));

  static dynamic _formatJson(value) {
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }
}
