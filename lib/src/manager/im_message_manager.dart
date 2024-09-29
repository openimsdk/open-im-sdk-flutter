import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

class MessageManager {
  MethodChannel _channel;

  OnMsgSendProgressListener? msgSendProgressListener;
  late OnAdvancedMsgListener msgListener;
  OnCustomBusinessListener? customBusinessListener;

  MessageManager(this._channel);

  /// Message listener
  Future setAdvancedMsgListener(OnAdvancedMsgListener listener) {
    this.msgListener = listener;
    // advancedMsgListeners.add(listener);
    return _channel.invokeMethod(
        'setAdvancedMsgListener',
        _buildParam({
          'id': listener.id,
        }));
  }

  /// Message send progress listener
  void setMsgSendProgressListener(OnMsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /// Send a message
  /// [message] Message content
  /// [userID] User ID of the recipient
  /// [groupID] Group ID of the recipient
  /// [offlinePushInfo] Offline message display content
  Future<Message> sendMessage({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
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
                'isOnlineOnly': isOnlineOnly,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Delete a message from local storage
  /// [message] Message to be deleted
  Future deleteMessageFromLocalStorage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteMessageFromLocalStorage',
          _buildParam({
            "conversationID": conversationID,
            "clientMsgID": clientMsgID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// core-sdk: DeleteMessage
  /// Delete a specified message from local and server
  /// [message] Message to be deleted
  Future<dynamic> deleteMessageFromLocalAndSvr({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteMessageFromLocalAndSvr',
          _buildParam({
            "conversationID": conversationID,
            "clientMsgID": clientMsgID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Delete all local chat records
  Future<dynamic> deleteAllMsgFromLocal({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocal',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Delete all chat records from local and server
  Future<dynamic> deleteAllMsgFromLocalAndSvr({
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'deleteAllMsgFromLocalAndSvr',
          _buildParam({
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Insert a single chat message into local storage
  /// [receiverID] Receiver's ID
  /// [senderID] Sender's ID
  /// [message] Message content
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

  /// Insert a group chat message into local storage
  /// [groupID] Group ID
  /// [senderID] Sender's ID
  /// [message] Message content
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

  /// Typing status update
  /// [msgTip] Custom content
  @Deprecated('Use [OpenIM.iMManager.conversationManager.changeInputStates(conversationID:focus:)] instead')
  Future typingStatusUpdate({
    required String userID,
    String? msgTip,
    String? operationID,
  }) {
    throw UnimplementedError('typingStatusUpdate');
  }

  /// Create a text message
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

  /// Create an @ message
  /// [text] Input content
  /// [atUserIDList] Collection of userIDs being mentioned
  /// [atUserInfoList] Mapping of userID to nickname, used for displaying nicknames instead of IDs in the user interface
  /// [quoteMessage] Quoted message (the message being replied to)
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

  /// Create an image message
  /// [imagePath] Path
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

  /// Create an image message from a full path
  /// [imagePath] Path
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

  /// Create a sound message
  /// [soundPath] Path
  /// [duration] Duration in seconds
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

  /// Create a sound message from a full path
  /// [soundPath] Path
  /// [duration] Duration in seconds
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

  /// Create a video message
  /// [videoPath] Path
  /// [videoType] Video MIME type
  /// [duration] Duration in seconds
  /// [snapshotPath] Default snapshot image path
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

  /// Create a video message from a full path
  /// [videoPath] Path
  /// [videoType] Video MIME type
  /// [duration] Duration in seconds
  /// [snapshotPath] Default snapshot image path
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

  /// Create a file message
  /// [filePath] Path
  /// [fileName] File name
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

  /// Create a file message from a full path
  /// [filePath] Path
  /// [fileName] File name
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

  /// Create a merged message
  /// [messageList] Selected messages
  /// [title] Summary title
  /// [summaryList] Summary content
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

  /// Create a forwarded message
  /// [message] Message to be forwarded
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

  /// Create a location message
  /// [latitude] Latitude
  /// [longitude] Longitude
  /// [description] Custom description
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

  /// Create a custom message
  /// [data] Custom data
  /// [extension] Custom extension content
  /// [description] Custom description content
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

  /// Create a quoted message
  /// [text] Reply content
  /// [quoteMsg] Message being replied to
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

  /// Create a card message
  /// [data] Custom data
  Future<Message> createCardMessage({
    required String userID,
    required String nickname,
    String? faceURL,
    String? ex,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createCardMessage',
              _buildParam({
                'cardMessage': {
                  'userID': userID,
                  'nickname': nickname,
                  'faceURL': faceURL,
                  'ex': ex,
                },
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create a custom emoji message
  /// [index] Positional emoji, matched based on index
  /// [data] URL emoji, displayed directly using the URL
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

  /// Search messages
  /// [conversationID] Query based on conversation, pass null for global search
  /// [keywordList] Search keyword list, currently supports searching with a single keyword
  /// [keywordListMatchType] Keyword matching mode, 1 means AND, 2 means OR (currently unused)
  /// [senderUserIDList] List of UIDs for messages sent (currently unused)
  /// [messageTypeList] Message type list
  /// [searchTimePosition] Start time point for searching. Defaults to 0, meaning searching from now. UTC timestamp, in seconds
  /// [searchTimePeriod] Time range in the past from the start time point, in seconds. Defaults to 0, meaning no time range limitation. Pass 24x60x60 to represent the past day
  /// [pageIndex] Current page number
  /// [count] Number of messages per page
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
          .then((value) => Utils.toObj(value, (map) => SearchResult.fromJson(map)));

  /// Revoke a message
  /// [message] The message to be revoked
  Future revokeMessage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'revokeMessage',
          _buildParam({
            'conversationID': conversationID,
            'clientMsgID': clientMsgID,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Mark messages as read
  /// [conversationID] Conversation ID
  /// [messageIDList] List of clientMsgIDs of messages to be marked as read
  @Deprecated('Use markConversationMessageAsRead instead')
  Future markMessagesAsReadByMsgID({
    required String conversationID,
    required List<String> messageIDList,
    String? operationID,
  }) =>
      _channel.invokeMethod(
          'markMessagesAsReadByMsgID',
          _buildParam({
            "conversationID": conversationID,
            "messageIDList": messageIDList,
            "operationID": Utils.checkOperationID(operationID),
          }));

  /// Get chat history (messages prior to startMsg)
  /// [conversationID] Conversation ID, can be used for querying notifications
  /// [startMsg] Query [count] messages starting from this message. The message at index == length - 1 is the latest message, so to get the next page of history, use startMsg = list.first
  /// [count] Total number of messages to retrieve in one request
  /// [lastMinSeq] Not required for the first page of messages, but necessary for getting the second page of history. Same as [startMsg]
  Future<AdvancedMessage> getAdvancedHistoryMessageList({
    String? conversationID,
    Message? startMsg,
    int? lastMinSeq,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getAdvancedHistoryMessageList',
              _buildParam({
                'conversationID': conversationID ?? '',
                'startClientMsgID': startMsg?.clientMsgID ?? '',
                'count': count ?? 40,
                'lastMinSeq': lastMinSeq ?? 0,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => AdvancedMessage.fromJson(map)));

  /// Get chat history (newly received chat history after startMsg). Used for locating a specific message in global search and then fetching messages received after that message.
  /// [conversationID] Conversation ID, can be used for querying notifications
  /// [startMsg] Query [count] messages starting from this message. The message at index == length - 1 is the latest message, so to get the next page of history, use startMsg = list.last
  /// [count] Total number of messages to retrieve in one request
  Future<AdvancedMessage> getAdvancedHistoryMessageListReverse({
    String? conversationID,
    Message? startMsg,
    int? lastMinSeq,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'getAdvancedHistoryMessageListReverse',
              _buildParam({
                'conversationID': conversationID ?? '',
                'startClientMsgID': startMsg?.clientMsgID ?? '',
                'count': count ?? 40,
                'lastMinSeq': lastMinSeq ?? 0,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => AdvancedMessage.fromJson(map)));

  /// Find message details
  /// [conversationID] Conversation ID
  /// [clientMsgIDList] List of message IDs
  Future<SearchResult> findMessageList({
    required List<SearchParams> searchParams,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'findMessageList',
              _buildParam({
                'searchParams': searchParams.map((e) => e.toJson()).toList(),
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => SearchResult.fromJson(map)));

  /// Rich text message
  /// [text] Input content
  /// [list] Details of the rich text message
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

  /// Rich text message with quote
  /// [text] Content for the reply
  /// [quoteMsg] The message being replied to
  /// [list] Details of the rich text message
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

  /// Send a message
  /// [message] Message body [createImageMessageByURL],[createSoundMessageByURL],[createVideoMessageByURL],[createFileMessageByURL]
  /// [userID] User ID to receive the message
  /// [groupID] Group ID to receive the message
  /// [offlinePushInfo] Offline message display content
  Future<Message> sendMessageNotOss({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'sendMessageNotOss',
              _buildParam({
                'message': message.toJson(),
                'offlinePushInfo': offlinePushInfo.toJson(),
                'userID': userID ?? '',
                'groupID': groupID ?? '',
                'isOnlineOnly': isOnlineOnly,
                'operationID': Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create an image message by URL
  Future<Message> createImageMessageByURL({
    required PictureInfo sourcePicture,
    required PictureInfo bigPicture,
    required PictureInfo snapshotPicture,
    String? sourcePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createImageMessageByURL',
            _buildParam({
              'sourcePath': sourcePath,
              'sourcePicture': sourcePicture.toJson(),
              'bigPicture': bigPicture.toJson(),
              'snapshotPicture': snapshotPicture.toJson(),
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create a sound message
  Future<Message> createSoundMessageByURL({
    required SoundElem soundElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createSoundMessageByURL',
            _buildParam({
              'soundElem': soundElem.toJson(),
              "operationID": Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create a video message
  Future<Message> createVideoMessageByURL({
    required VideoElem videoElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createVideoMessageByURL',
              _buildParam({
                'videoElem': videoElem.toJson(),
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// Create a file message
  Future<Message> createFileMessageByURL({
    required FileElem fileElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
              'createFileMessageByURL',
              _buildParam({
                'fileElem': fileElem.toJson(),
                "operationID": Utils.checkOperationID(operationID),
              }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  ///
  Future setCustomBusinessListener(OnCustomBusinessListener listener) {
    this.customBusinessListener = listener;
    return _channel.invokeMethod('setCustomBusinessListener', _buildParam({}));
  }

  Future setMessageLocalEx({
    required String conversationID,
    required String clientMsgID,
    required String localEx,
    String? operationID,
  }) {
    return _channel.invokeMethod(
        'setMessageLocalEx',
        _buildParam({
          "conversationID": conversationID,
          "clientMsgID": clientMsgID,
          "localEx": localEx,
          "operationID": Utils.checkOperationID(operationID),
        }));
  }

  Future setAppBadge(
    int count, {
    String? operationID,
  }) {
    return _channel.invokeMethod(
        'setAppBadge',
        _buildParam({
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }));
  }

  static Map _buildParam(Map<String, dynamic> param) {
    param["ManagerName"] = "messageManager";
    param = Utils.cleanMap(param);

    return param;
  }
}
