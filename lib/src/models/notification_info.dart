import '../../flutter_openim_sdk.dart';

/// OA notification
class OANotification {
  String? notificationName;
  String? notificationFaceURL;
  int? notificationType;
  String? text;
  String? externalUrl;

  /// Notification Mix Type
  /// 0: Plain text notification
  /// 1: Text+picture notification
  /// 2: Text+video notification
  /// 3: Text+file notification
  /// 0：纯文字通知 1：文字+图片通知 2：文字+视频通知 3：文字+文件通知
  int? mixType;
  PictureElem? pictureElem;
  SoundElem? soundElem;
  VideoElem? videoElem;
  FileElem? fileElem;
  String? ex;

  OANotification(
      {this.notificationName,
      this.notificationFaceURL,
      this.notificationType,
      this.text,
      this.externalUrl,
      this.mixType,
      this.pictureElem,
      this.soundElem,
      this.videoElem,
      this.fileElem,
      this.ex});

  OANotification.fromJson(Map<String, dynamic> json) {
    notificationName = json['notificationName'];
    notificationFaceURL = json['notificationFaceURL'];
    notificationType = json['notificationType'];
    text = json['text'];
    externalUrl = json['externalUrl'];
    mixType = json['mixType'];
    pictureElem = json['pictureElem'] != null
        ? PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem = json['soundElem'] != null
        ? SoundElem.fromJson(json['soundElem'])
        : null;
    videoElem = json['videoElem'] != null
        ? VideoElem.fromJson(json['videoElem'])
        : null;
    fileElem =
        json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['notificationName'] = this.notificationName;
    data['notificationFaceURL'] = this.notificationFaceURL;
    data['notificationType'] = this.notificationType;
    data['text'] = this.text;
    data['externalUrl'] = this.externalUrl;
    data['mixType'] = this.mixType;
    if (this.pictureElem != null) {
      data['pictureElem'] = this.pictureElem!.toJson();
    }
    if (this.soundElem != null) {
      data['soundElem'] = this.soundElem!.toJson();
    }
    if (this.videoElem != null) {
      data['videoElem'] = this.videoElem!.toJson();
    }
    if (this.fileElem != null) {
      data['fileElem'] = this.fileElem!.toJson();
    }
    data['ex'] = this.ex;
    return data;
  }
}
