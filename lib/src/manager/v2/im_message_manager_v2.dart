import 'dart:convert';
import 'dart:io';

import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

extension MessageManagerV2 on MessageManager {
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
      clientMsgID: 'flutter_client_${now.microsecondsSinceEpoch}',
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
}
