import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class MessageManager {
  MethodChannel _channel;

  // List<AdvancedMsgListener> advancedMsgListeners = List.empty(growable: true);
  OnMsgSendProgressListener? msgSendProgressListener;
  late OnAdvancedMsgListener msgListener;

  MessageManager(this._channel);

  /// Set a message listener
  /// 消息监听
  Future setAdvancedMsgListener(OnAdvancedMsgListener listener) {
    this.msgListener = listener;
    // advancedMsgListeners.add(listener);
    return _channel.invokeMethod(
        'setAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  /// Set up message sending progress monitoring
  /// 消息发送进度监听
  void setMsgSendProgressListener(OnMsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /// Send a message to user or to group
  /// [userID] receiver's user ID
  /// 发送消息
  /// [userID]接收消息的用户id
  /// [groupID]接收消息的组id
  /// [offlinePushInfo]离线消息显示内容
  Future<Message> sendMessage({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'sendMessage',
              _buildParam({
                'message': message.toJson(),
                'offlinePushInfo': offlinePushInfo.toJson(),
                'userID': userID ?? '',
                'groupID': groupID ?? '',
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Find all history message
  /// 获取聊天记录
  /// [userID]接收消息的用户id
  /// [conversationID] 会话id，查询通知是可用
  /// [groupID]接收消息的组id
  Future<List<Message>> getHistoryMessageList({
    String? userID,
    String? groupID,
    String? conversationID,
    Message? startMsg,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getHistoryMessageList',
              _buildParam({
                'userID': userID ?? '',
                'groupID': groupID ?? '',
                'conversationID': conversationID ?? '',
                'startClientMsgID': startMsg?.clientMsgID ?? '',
                'count': count ?? 10,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (map) => Message.fromJson(map)));

  /// Revoke the sent information
  /// 撤回消息
  Future revokeMessage({
    required Message message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'revokeMessage',
          _buildParam(message.toJson()
            ..addAll({
              "operationID": Utils.checkOperationID(operationID),
            })));

  /// Delete message
  /// 删除消息
  Future deleteMessageFromLocalStorage({
    required Message message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteMessageFromLocalStorage',
          _buildParam(message.toJson()
            ..addAll({
              "operationID": Utils.checkOperationID(operationID),
            })));

  ///
  // Future deleteMessages({required List<Message> msgList}) =>
  //     _channel.invokeMethod('deleteMessages',
  //         _buildParam({"msgList": msgList.map((e) => e.toJson()).toList()}));

  ///
  Future insertSingleMessageToLocalStorage({
    String? receiverID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'insertSingleMessageToLocalStorage',
          _buildParam({
            "message": message?.toJson(),
            "receiverID": receiverID,
            "senderID": senderID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  ///
  Future insertGroupMessageToLocalStorage({
    String? groupID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'insertGroupMessageToLocalStorage',
          _buildParam({
            "message": message?.toJson(),
            "groupID": groupID,
            "senderID": senderID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Query the message according to the message id
  // Future findMessages({required List<String> messageIDList}) =>
  //     _channel.invokeMethod(
  //         'findMessages',
  //         _buildParam({
  //           "messageIDList": messageIDList,
  //         }));

  /// Mark c2c message as read
  /// 标记c2c消息已读
  Future markC2CMessageAsRead({
    required String userID,
    required List<String> messageIDList,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markC2CMessageAsRead',
          _buildParam({
            "messageIDList": messageIDList,
            "userID": userID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Mark group message as read
  /// 标记群聊消息已读
  Future markGroupMessageAsRead({
    required String groupID,
    required List<String> messageIDList,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markGroupMessageAsRead',
          _buildParam({
            "messageIDList": messageIDList,
            "groupID": groupID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Typing
  /// 正在输入提示
  Future typingStatusUpdate({
    required String userID,
    String? msgTip,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'typingStatusUpdate',
          _buildParam({
            "msgTip": msgTip,
            "userID": userID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Create text message
  /// 创建文本消息
  Future<Message> createTextMessage({
    required String text,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createTextMessage',
              _buildParam({
                'text': text,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create @ message
  /// 创建@消息
  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUidList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createTextAtMessage',
            _buildParam({
              'text': text,
              'atUserList': atUidList,
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create picture message
  /// 创建图片消息
  Future<Message> createImageMessage({
    required String imagePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createImageMessage',
            _buildParam({
              'imagePath': imagePath,
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create picture message
  /// 创建图片消息
  Future<Message> createImageMessageFromFullPath({
    required String imagePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createImageMessageFromFullPath',
            _buildParam({
              'imagePath': imagePath,
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create sound message
  /// 创建语音消息
  Future<Message> createSoundMessage({
    required String soundPath,
    required int duration,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createSoundMessage',
            _buildParam({
              'soundPath': soundPath,
              "duration": duration,
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create sound message
  /// 创建语音消息
  Future<Message> createSoundMessageFromFullPath({
    required String soundPath,
    required int duration,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createSoundMessageFromFullPath',
            _buildParam({
              'soundPath': soundPath,
              "duration": duration,
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create video message
  /// 创建视频消息
  Future<Message> createVideoMessage({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createVideoMessage',
              _buildParam({
                'videoPath': videoPath,
                'videoType': videoType,
                'duration': duration,
                'snapshotPath': snapshotPath,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create video message
  /// 创建视频消息
  Future<Message> createVideoMessageFromFullPath({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createVideoMessageFromFullPath',
              _buildParam({
                'videoPath': videoPath,
                'videoType': videoType,
                'duration': duration,
                'snapshotPath': snapshotPath,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create file message
  /// 创建文件消息
  Future<Message> createFileMessage({
    required String filePath,
    required String fileName,
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'createFileMessage',
            _buildParam({
              'filePath': filePath,
              'fileName': fileName,
              "operationID": Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));
  }

  /// Create file message
  /// 创建文件消息
  Future<Message> createFileMessageFromFullPath({
    required String filePath,
    required String fileName,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createFileMessageFromFullPath',
              _buildParam({
                'filePath': filePath,
                'fileName': fileName,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create merger message
  /// 创建合并消息
  Future<Message> createMergerMessage({
    required List<Message> messageList,
    required String title,
    required List<String> summaryList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createMergerMessage',
              _buildParam({
                'messageList': messageList.map((e) => e.toJson()).toList(),
                'title': title,
                'summaryList': summaryList,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create forward message
  /// 创建转发消息
  Future<Message> createForwardMessage({
    required Message message,
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
            'createForwardMessage',
            _buildParam({
              'message': message.toJson(),
              "operationID": Utils.checkOperationID(operationID),
            }))
        .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));
  }

  /// Create location message
  /// 创建位置消息
  Future<Message> createLocationMessage({
    required double latitude,
    required double longitude,
    required String description,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createLocationMessage',
              _buildParam({
                'latitude': latitude,
                'longitude': longitude,
                'description': description,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create custom message
  /// 创建自定义消息
  Future<Message> createCustomMessage({
    required String data,
    required String extension,
    required String description,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createCustomMessage',
              _buildParam({
                'data': data,
                'extension': extension,
                'description': description,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create quote message
  /// 创建引用消息
  Future<Message> createQuoteMessage({
    required String text,
    required Message quoteMsg,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createQuoteMessage',
              _buildParam({
                'quoteText': text,
                'quoteMessage': quoteMsg.toJson(),
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create card message
  /// 创建卡片消息
  Future<Message> createCardMessage({
    required Map<String, dynamic> data,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createCardMessage',
              _buildParam({
                'cardMessage': data,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create custom emoji message
  /// 创建自定义表情消息
  /// [index] The position of the emoji, such as the position emoji（表情的位置，如位置表情）
  /// [data] Other data, such as url expressions（其他数据，如url表情）
  Future<Message> createFaceMessage({
    int index = -1,
    String? data,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createFaceMessage',
              _buildParam({
                'index': index,
                'data': data,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Clear all c2c history message
  /// 清空单聊消息记录
  Future<dynamic> clearC2CHistoryMessage({
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearC2CHistoryMessage',
          _buildParam({
            "userID": uid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Clear all group history
  /// 清空组消息记录
  Future<dynamic> clearGroupHistoryMessage({
    required String gid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearGroupHistoryMessage',
          _buildParam({
            "groupID": gid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Search local message
  /// 搜索消息
  /// [sourceID]单聊为用户ID，群聊为群ID
  /// [sessionType]会话类型，单聊为1，群聊为2，如果为0，则代表搜索全部
  /// [keywordList]搜索关键词列表，目前仅支持一个关键词搜索
  /// [keywordListMatchType]关键词匹配模式，1代表与，2代表或，暂时未用
  /// [senderUserIDList]指定消息发送的uid列表 暂时未用
  /// [messageTypeList]消息类型列表
  /// [searchTimePosition]搜索的起始时间点。默认为0即代表从现在开始搜索。UTC 时间戳，单位：秒
  /// [searchTimePeriod]从起始时间点开始的过去时间范围，单位秒。默认为0即代表不限制时间范围，传24x60x60代表过去一天
  /// [pageIndex]当前页数
  /// [count]每页数量
  Future<SearchResult> searchLocalMessages({
    required String sourceID,
    required int sessionType,
    List<String> keywordList = const [],
    int keywordListMatchType = 0,
    List<String> senderUserIDList = const [],
    List<int> messageTypeList = const [],
    int searchTimePosition = 0,
    int searchTimePeriod = 0,
    int pageIndex = 1,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'searchLocalMessages',
              _buildParam({
                'filter': {
                  'sourceID': sourceID,
                  'sessionType': sessionType,
                  'keywordList': keywordList,
                  'keywordListMatchType': keywordListMatchType,
                  'senderUserIDList': senderUserIDList,
                  'messageTypeList': messageTypeList,
                  'searchTimePosition': searchTimePosition,
                  'searchTimePeriod': searchTimePeriod,
                  'pageIndex': pageIndex,
                  'count': count,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SearchResult.fromJson(map)));

  /// Delete message from local and service
  /// 删除消息
  Future<dynamic> deleteMessageFromLocalAndSvr({
    required Message message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteMessageFromLocalAndSvr',
          _buildParam(message.toJson()
            ..addAll({
              "operationID": Utils.checkOperationID(operationID),
            })));

  /// Delete all message from local
  /// 删除所有消息
  Future<dynamic> deleteAllMsgFromLocal({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocal',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Delete all message from service
  /// 删除所有消息
  Future<dynamic> deleteAllMsgFromLocalAndSvr({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocalAndSvr',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Mark conversation message as read
  /// 标记消息已读
  Future markMessageAsReadByConID({
    required String conversationID,
    required List<String> messageIDList,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markMessageAsReadByConID',
          _buildParam({
            "messageIDList": messageIDList,
            "conversationID": conversationID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "messageManager";
    return param;
  }
}
