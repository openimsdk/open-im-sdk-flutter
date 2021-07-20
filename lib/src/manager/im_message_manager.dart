import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class MessageManager {
  MethodChannel _channel;
  List<AdvancedMsgListener> advancedMsgListeners = List.empty(growable: true);
  MsgSendProgressListener? msgSendProgressListener;

  MessageManager(this._channel);

  Future addAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.add(listener);
    return _channel.invokeMethod(
        'addAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  Future removeAdvancedMsgListener(AdvancedMsgListener listener) {
    advancedMsgListeners.remove(listener);
    return _channel.invokeMethod(
        'removeAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  void setMsgSendProgressListener(MsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /*Future<Message> */
  Future<dynamic> sendMessage({
    required Message message,
    String? userID,
    String? groupID,
    required bool onlineUserOnly,
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

  Future revokeMessage({required Message message}) {
    return _channel.invokeMethod(
        'revokeMessage', _buildParam(message.toJson()));
  }

  Future deleteMessageFromLocalStorage({required Message message}) {
    return _channel.invokeMethod(
        'deleteMessageFromLocalStorage', _buildParam(message.toJson()));
  }

  Future deleteMessages({required List<Message> msgList}) {
    return _channel.invokeMethod('deleteMessages',
        _buildParam({"msgList": msgList.map((e) => e.toJson()).toList()}));
  }

  Future insertSingleMessageToLocalStorage({
    String? userID,
    Message? message,
    String? sender,
  }) {
    return _channel.invokeMethod(
        'insertSingleMessageToLocalStorage',
        _buildParam({
          "userID": userID,
          "message": message?.toJson(),
          "sender": sender,
        }));
  }

  Future findMessages({required List<String> messageIDList}) {
    return _channel.invokeMethod(
        'findMessages',
        _buildParam({
          "messageIDList": messageIDList,
        }));
  }

  Future<dynamic> markSingleMessageHasRead({required String userID}) {
    return _channel.invokeMethod(
        'markSingleMessageHasRead', _buildParam({'userID': userID}));
  }

  Future<dynamic> markGroupMessageHasRead({required String groupID}) {
    return _channel.invokeMethod(
        'markGroupMessageHasRead', _buildParam({'groupID': groupID}));
  }

  Future<Message> createTextMessage({required String text}) {
    return _channel
        .invokeMethod('createTextMessage', _buildParam({'text': text}))
        .then((value) => _toObj(value));
  }

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

  Future<Message> createImageMessage({required String imagePath}) {
    return _channel
        .invokeMethod(
          'createImageMessage',
          _buildParam({'imagePath': imagePath}),
        )
        .then((value) => _toObj(value));
  }

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

  Future<Message> createForwardMessage({required List<Message> messageList}) {
    return _channel
        .invokeMethod(
            'createForwardMessage',
            _buildParam({
              'message': messageList.map((e) => e.toJson()).toList(),
            }))
        .then((value) => _toObj(value));
  }

  Future<dynamic> getTotalUnreadMsgCount() {
    return _channel.invokeMethod('getTotalUnreadMsgCount', _buildParam({}));
  }

  void forceSyncMsg() {
    _channel.invokeMethod('forceSyncMsg', _buildParam({}));
  }

  Message createTextMessageV2({required String text}) {
    return _createMessage(contentType: MessageType.text)..content = text;
  }

  Message createTextAtMessageV2({
    required String text,
    required List<String> atUidList,
  }) {
    var atElem = AtElem(
      text: text,
      atUserList: atUidList,
      isAtSelf: false,
    );
    return _createMessage(contentType: MessageType.at_text)
      ..forceList = atUidList
      ..atElem = atElem
      ..content = jsonEncode(atElem);
  }

  Message createImageMessageV2({
    required String imagePath,
    required String mineType,
    required int size,
    required int width,
    required int height,
  }) {
    return _createMessage(contentType: MessageType.picture)
      ..pictureElem = PictureElem(
        sourcePath: imagePath,
        sourcePicture: PictureInfo(
          type: mineType,
          size: size,
          width: width,
          height: height,
        ),
      );
  }

  Message createSoundMessageV2({
    required String soundPath,
    required int duration,
    required int dataSize,
  }) {
    return _createMessage(contentType: MessageType.voice)
      ..soundElem = SoundElem(
        soundPath: soundPath,
        dataSize: dataSize,
        duration: duration,
      );
  }

  Message createVideoMessageV2({
    required String videoPath,
    required String videoType,
    required int videoSize,
    required int duration,
    required String snapshotPath,
    required int snapshotSize,
    required int snapshotWidth,
    required int snapshotHeight,
  }) {
    return _createMessage(contentType: MessageType.video)
      ..videoElem = VideoElem(
        videoPath: videoPath,
        videoSize: videoSize,
        videoType: videoType,
        duration: duration,
        snapshotPath: snapshotPath,
        snapshotSize: snapshotSize,
        snapshotHeight: snapshotHeight,
        snapshotWidth: snapshotWidth,
      );
  }

  Message createFileMessageV2({
    required String filePath,
    required String fileName,
    required int fileSize,
  }) {
    return _createMessage(contentType: MessageType.file)
      ..fileElem = FileElem(
        fileName: fileName,
        filePath: filePath,
        fileSize: fileSize,
      );
  }

/*  Message createMergerMessageV2({
    required List<Message> messageList,
    required String title,
    required List<String> summaryList,
  }) {
    var message = _createMessage(contentType: MessageType.merger);
    return message;
  }

  Message createForwardMessageV2({required List<Message> messageList}) {
    var message = _createMessage();
    return message;
  }*/

  static Message _createMessage({required contentType}) {
    var now = DateTime.now();
    return Message(
      clientMsgID: 'client_msg_id_v2_${now.microsecondsSinceEpoch}',
      createTime: now.millisecond ~/ 1000,
      sendTime: now.millisecond ~/ 1000,
      // sessionType: 0,//请求为单人会话1，请求为群聊会话2
      msgFrom: 100,
      contentType: contentType,
      status: MessageStatus.sending,
      platformID: Platform.isAndroid ? IMPlatform.android : IMPlatform.ios,
      sendID: OpenIM.iMManager.uid,
      senderNickName: OpenIM.iMManager.uInfo.name,
    );
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
