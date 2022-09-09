import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class MessageManager {
  MethodChannel _channel;

  // List<AdvancedMsgListener> advancedMsgListeners = List.empty(growable: true);
  OnMsgSendProgressListener? msgSendProgressListener;
  late OnAdvancedMsgListener msgListener;

  MessageManager(this._channel);

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

  /// 消息发送进度监听
  void setMsgSendProgressListener(OnMsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /// 发送消息
  /// [message] 消息体
  /// [userID] 接收消息的用户id
  /// [groupID] 接收消息的组id
  /// [offlinePushInfo] 离线消息显示内容
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

  /// 获取聊天记录(以startMsg为节点，以前的聊天记录)
  /// [userID] 接收消息的用户id
  /// [conversationID] 会话id，查询通知时可用
  /// [groupID] 接收消息的组id
  /// [startMsg] 从这条消息开始查询[count]条，获取的列表index==length-1为最新消息，所以获取下一页历史记录startMsg=list.first
  /// [count] 一次拉取的总数
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

  /// 撤回消息[revokeMessageV2]
  /// [message] 被撤回的消息体
  @deprecated
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

  /// 删除本地消息
  /// [message] 被删除的消息体
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

  /// 插入单聊消息到本地
  /// [receiverID] 接收者id
  /// [senderID] 发送者id
  /// [message] 消息体
  Future<Message> insertSingleMessageToLocalStorage({
    String? receiverID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'insertSingleMessageToLocalStorage',
              _buildParam({
                "message": message?.toJson(),
                "receiverID": receiverID,
                "senderID": senderID,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 插入群聊消息到本地
  /// [groupID] 群id
  /// [senderID] 发送者id
  /// [message] 消息体
  Future<Message> insertGroupMessageToLocalStorage({
    String? groupID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'insertGroupMessageToLocalStorage',
              _buildParam({
                "message": message?.toJson(),
                "groupID": groupID,
                "senderID": senderID,
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 标记c2c单条消息已读
  /// [userID] 消息来源的userID
  /// [messageIDList] 消息clientMsgID集合
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

  /// 标记群聊消息已读
  /// [groupID] 群id
  /// [messageIDList] 消息clientMsgID集合
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

  /// 正在输入提示
  /// [msgTip] 自定义内容
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

  /// 创建@消息
  /// [text] 输入内容
  /// [atUserIDList] 被@到的userID集合
  /// [atUserInfoList] userID跟nickname映射关系，用在界面显示时将id替换为nickname
  /// [quoteMessage] 引用消息（被回复的消息）
  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUserIDList,
    List<AtUserInfo> atUserInfoList = const [],
    Message? quoteMessage,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createTextAtMessage',
            _buildParam({
              'text': text,
              'atUserIDList': atUserIDList,
              'atUserInfoList': atUserInfoList.map((e) => e.toJson()).toList(),
              'quoteMessage': quoteMessage?.toJson(),
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建图片消息
  /// [imagePath] 路径
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

  /// 创建图片消息
  /// [imagePath] 路径
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

  /// 创建语音消息
  /// [soundPath] 路径
  /// [duration] 时长s
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

  /// 创建语音消息
  /// [soundPath] 路径
  /// [duration] 时长s
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

  /// 创建视频消息
  /// [videoPath] 路径
  /// [videoType] 视频mime类型
  /// [duration] 时长s
  /// [snapshotPath] 默认站位图路径
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

  /// 创建视频消息
  /// [videoPath] 路径
  /// [videoType] 视频mime类型
  /// [duration] 时长s
  /// [snapshotPath] 默认站位图路径
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

  /// 创建文件消息
  /// [filePath] 路径
  /// [fileName] 文件名
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

  /// 创建文件消息
  /// [filePath] 路径
  /// [fileName] 文件名
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

  /// 创建合并消息
  /// [messageList] 被选中的消息
  /// [title] 摘要标题
  /// [summaryList] 摘要内容
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

  /// 创建转发消息
  /// [message] 被转发的消息
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

  /// 创建位置消息
  /// [latitude] 纬度
  /// [longitude] 经度
  /// [description] 自定义描述信息
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

  /// 创建自定义消息
  /// [data] 自定义数据
  /// [extension] 自定义扩展内容
  /// [description] 自定义描述内容
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

  /// 创建引用消息
  /// [text] 回复的内容
  /// [quoteMsg] 被回复的消息
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

  /// 创建卡片消息
  /// [data] 自定义数据
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

  /// 创建自定义表情消息
  /// [index] 位置表情，根据index匹配
  /// [data] url表情，直接使用url显示
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

  /// 清空单聊消息记录
  /// [uid] 单聊对象id
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

  /// 清空组消息记录
  /// [gid] 组id
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

  /// 搜索消息
  /// [conversationID] 根据会话查询，如果是全局搜索传null
  /// [keywordList] 搜索关键词列表，目前仅支持一个关键词搜索
  /// [keywordListMatchType] 关键词匹配模式，1代表与，2代表或，暂时未用
  /// [senderUserIDList] 指定消息发送的uid列表 暂时未用
  /// [messageTypeList] 消息类型列表
  /// [searchTimePosition] 搜索的起始时间点。默认为0即代表从现在开始搜索。UTC 时间戳，单位：秒
  /// [searchTimePeriod] 从起始时间点开始的过去时间范围，单位秒。默认为0即代表不限制时间范围，传24x60x60代表过去一天
  /// [pageIndex] 当前页数
  /// [count] 每页数量
  Future<SearchResult> searchLocalMessages({
    String? conversationID,
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
                  'conversationID': conversationID,
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

  /// 删除本地跟服务器的指定的消息
  /// [message] 被删除的消息
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

  /// 删除本地所有聊天记录
  Future<dynamic> deleteAllMsgFromLocal({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocal',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// 删除本地跟服务器所有聊天记录
  Future<dynamic> deleteAllMsgFromLocalAndSvr({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocalAndSvr',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// 标记消息已读
  /// [conversationID] 会话ID
  /// [messageIDList] 被标记的消息clientMsgID
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

  /// 删除本地跟服务器的单聊聊天记录
  /// [uid] 聊天对象的userID
  Future<dynamic> clearC2CHistoryMessageFromLocalAndSvr({
    required String uid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearC2CHistoryMessageFromLocalAndSvr',
          _buildParam({
            "userID": uid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// 删除本地跟服务器的群聊天记录
  /// [gid] 组id
  Future<dynamic> clearGroupHistoryMessageFromLocalAndSvr({
    required String gid,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'clearGroupHistoryMessageFromLocalAndSvr',
          _buildParam({
            "groupID": gid,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// 获取聊天记录(以startMsg为节点，新收到的聊天记录)，用在全局搜索定位某一条消息，然后此条消息后新增的消息
  /// [userID] 接收消息的用户id
  /// [conversationID] 会话id，查询通知时可用
  /// [groupID] 接收消息的组id
  /// [startMsg] 从这条消息开始查询[count]条，获取的列表index==length-1为最新消息，所以获取下一页历史记录startMsg=list.last
  /// [count] 一次拉取的总数
  Future<List<Message>> getHistoryMessageListReverse({
    String? userID,
    String? groupID,
    String? conversationID,
    Message? startMsg,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getHistoryMessageListReverse',
              _buildParam({
                'userID': userID ?? '',
                'groupID': groupID ?? '',
                'conversationID': conversationID ?? '',
                'startClientMsgID': startMsg?.clientMsgID ?? '',
                'count': count ?? 10,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toList(value, (map) => Message.fromJson(map)));

  /// 撤回消息
  /// [message] 被撤回的消息体
  Future revokeMessageV2({
    required Message message,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'newRevokeMessage',
          _buildParam(message.toJson()
            ..addAll({
              "operationID": Utils.checkOperationID(operationID),
            })));

  /// 获取聊天记录(以startMsg为节点，以前的聊天记录)
  /// [userID] 接收消息的用户id
  /// [conversationID] 会话id，查询通知时可用
  /// [groupID] 接收消息的组id
  /// [startMsg] 从这条消息开始查询[count]条，获取的列表index==length-1为最新消息，所以获取下一页历史记录startMsg=list.first
  /// [count] 一次拉取的总数
  /// [lastMinSeq] 第一页消息不用传，获取第二页开始必传 跟[startMsg]一样
  Future<AdvancedMessage> getAdvancedHistoryMessageList({
    String? userID,
    String? groupID,
    String? conversationID,
    int? lastMinSeq,
    Message? startMsg,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getAdvancedHistoryMessageList',
              _buildParam({
                'userID': userID ?? '',
                'groupID': groupID ?? '',
                'conversationID': conversationID ?? '',
                'startClientMsgID': startMsg?.clientMsgID ?? '',
                'count': count ?? 40,
                'lastMinSeq': lastMinSeq ?? 0,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => AdvancedMessage.fromJson(map)));

  /// 查找消息详细
  /// [conversationID] 会话id
  /// [clientMsgIDList] 消息id列表
  Future<SearchResult> findMessageList({
    required String conversationID,
    required List<String> clientMsgIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'findMessageList',
              _buildParam({
                'options': {
                  "conversationID": conversationID,
                  "clientMsgIDList": clientMsgIDList,
                },
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) =>
              Utils.toObj(value, (map) => SearchResult.fromJson(value)));

  /// 富文本消息
  /// [text] 输入内容
  /// [list] 富文本消息具体详细
  Future<Message> createAdvancedTextMessage({
    required String text,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createAdvancedTextMessage',
            _buildParam({
              'text': text,
              'richMessageInfoList': list.map((e) => e.toJson()).toList(),
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 富文本消息
  /// [text] 回复的内容
  /// [quoteMsg] 被回复的消息
  /// [list] 富文本消息具体详细
  Future<Message> createAdvancedQuoteMessage({
    required String text,
    required Message quoteMsg,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createAdvancedQuoteMessage',
              _buildParam({
                'quoteText': text,
                'quoteMessage': quoteMsg.toJson(),
                'richMessageInfoList': list.map((e) => e.toJson()).toList(),
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  static Map _buildParam(Map param) {
    param["ManagerName"] = "messageManager";
    return param;
  }
}
