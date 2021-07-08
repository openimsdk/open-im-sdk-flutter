import Flutter
import UIKit

public class SwiftFlutterOpenimSdkPlugin: NSObject, FlutterPlugin {
  
  let imManager: IMMananger
  let conversationManager: ConversationManager
  let friendshipManager: FriendshipManager
  let messageManager: MessageManager
  let groupManager: GroupManager
    
  init(channel: FlutterMethodChannel) {
    self.imManager = IMMananger(channel: channel)
    self.conversationManager = ConversationManager(channel: channel)
    self.friendshipManager = FriendshipManager(channel: channel)
    self.messageManager = MessageManager(channel: channel)
    self.groupManager = GroupManager(channel: channel)
  }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_openim_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOpenimSdkPlugin(channel: channel)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let managerName: String = CommonUtil.getParamValue(methodCall: call, param: "ManagerName") as! String
    if managerName == "imManager" {
        handleIMManager(call: call, result: result)
    }else if managerName == "conversationManager"{
        handleConversationManager(call: call, result: result)
    }else if managerName == "friendshipManager"{
        handleFriendshipManager(call: call, result: result)
    }else if managerName == "messageManager"{
        handleMessageManager(call: call, result: result)
    }else if managerName == "groupManager"{
        handleGroupManager(call: call, result: result)
    }else{
        print("Handle ManagerName Error: \(managerName) not found")
    }
  }
    
    private func handleIMManager(call: FlutterMethodCall, result: @escaping FlutterResult){
        let method: String = call.method
        if method == "initSDK" {
            imManager.initSDK(methodCall: call, result: result)
        }else if method == "login" {
            imManager.login(methodCall: call, result: result)
        }else if method == "logout" {
            imManager.logout(methodCall: call, result: result)
        }else if method == "getLoginStatus" {
            imManager.getLoginStatus(methodCall: call, result: result)
        }else if method == "getLoginUid" {
            imManager.getLoginUid(methodCall: call, result: result)
        }else if method == "getUsersInfo" {
            imManager.getUsersInfo(methodCall: call, result: result)
        }else if method == "setSelfInfo" {
            imManager.setSelfInfo(methodCall: call, result: result)
        }else if method == "forceSyncLoginUerInfo" {
            imManager.forceSyncLoginUerInfo(methodCall: call, result: result)
        }else{
            print("Handle MethodName Error: IMManager method: \(method)  not found")
        }
    }
    
    private func handleConversationManager(call: FlutterMethodCall, result: @escaping FlutterResult){
        let method: String = call.method
        if method == "setConversationListener" {
            conversationManager.setConversationListener(methodCall: call, result: result)
        }else if method == "getAllConversationList" {
            conversationManager.getAllConversationList(methodCall: call, result: result)
        }else if method == "getOneConversation" {
            conversationManager.getOneConversation(methodCall: call, result: result)
        }else if method == "getMultipleConversation" {
            conversationManager.getMultipleConversation(methodCall: call, result: result)
        }else if method == "deleteConversation" {
            conversationManager.deleteConversation(methodCall: call, result: result)
        }else if method == "setConversationDraft" {
            conversationManager.setConversationDraft(methodCall: call, result: result)
        }else if method == "pinConversation" {
            conversationManager.pinConversation(methodCall: call, result: result)
        }else if method == "getTotalUnreadMsgCount" {
            conversationManager.getTotalUnreadMsgCount(methodCall: call, result: result)
        }else{
            print("Handle MethodName Error: ConversationManager method: \(method)  not found")
        }
    }

    private func handleFriendshipManager(call: FlutterMethodCall, result: @escaping FlutterResult){
        let method: String = call.method
        if method == "setFriendListener" {
            friendshipManager.setFriendListener(methodCall: call, result: result)
        }else if method == "getFriendsInfo" {
            friendshipManager.getFriendsInfo(methodCall: call, result: result)
        }else if method == "addFriend" {
            friendshipManager.addFriend(methodCall: call, result: result)
        }else if method == "getFriendApplicationList" {
            friendshipManager.getFriendApplicationList(methodCall: call, result: result)
        }else if method == "getFriendList" {
            friendshipManager.getFriendList(methodCall: call, result: result)
        }else if method == "setFriendInfo" {
            friendshipManager.setFriendInfo(methodCall: call, result: result)
        }else if method == "addToBlackList" {
            friendshipManager.addToBlackList(methodCall: call, result: result)
        }else if method == "getBlackList" {
            friendshipManager.getBlackList(methodCall: call, result: result)
        }else if method == "deleteFromBlackList" {
            friendshipManager.deleteFromBlackList(methodCall: call, result: result)
        }else if method == "checkFriend" {
            friendshipManager.checkFriend(methodCall: call, result: result)
        }else if method == "deleteFromFriendList" {
            friendshipManager.deleteFromFriendList(methodCall: call, result: result)
        }else if method == "acceptFriendApplication" {
            friendshipManager.acceptFriendApplication(methodCall: call, result: result)
        }else if method == "refuseFriendApplication" {
            friendshipManager.refuseFriendApplication(methodCall: call, result: result)
        }else if method == "forceSyncFriendApplication" {
            friendshipManager.forceSyncFriendApplication(methodCall: call, result: result)
        }else if method == "forceSyncFriend" {
            friendshipManager.forceSyncFriend(methodCall: call, result: result)
        }else if method == "forceSyncBlackList" {
            friendshipManager.forceSyncBlackList(methodCall: call, result: result)
        }else{
            print("Handle MethodName Error: FriendshipManager method: \(method)  not found")
        }
    }
    
    private func handleMessageManager(call: FlutterMethodCall, result: @escaping FlutterResult){
        let method: String = call.method
        if method == "addAdvancedMsgListener" {
            messageManager.addAdvancedMsgListener(methodCall: call, result: result)
        }else if method == "removeAdvancedMsgListener" {
            messageManager.removeAdvancedMsgListener(methodCall: call, result: result)
        }else if method == "sendMessage" {
            messageManager.sendMessage(methodCall: call, result: result)
        }else if method == "getHistoryMessageList" {
            messageManager.getHistoryMessageList(methodCall: call, result: result)
        }else if method == "revokeMessage" {
            messageManager.revokeMessage(methodCall: call, result: result)
        }else if method == "deleteMessageFromLocalStorage" {
            messageManager.deleteMessageFromLocalStorage(methodCall: call, result: result)
        }else if method == "deleteMessages" {
            messageManager.deleteMessages(methodCall: call, result: result)
        }else if method == "insertSingleMessageToLocalStorage" {
            messageManager.insertSingleMessageToLocalStorage(methodCall: call, result: result)
        }else if method == "findMessages" {
            messageManager.findMessages(methodCall: call, result: result)
        }else if method == "markSingleMessageHasRead" {
            messageManager.markSingleMessageHasRead(methodCall: call, result: result)
        }else if method == "createTextMessage" {
            messageManager.createTextMessage(methodCall: call, result: result)
        }else if method == "createTextAtMessage" {
            messageManager.createTextAtMessage(methodCall: call, result: result)
        }else if method == "createImageMessage" {
            messageManager.createImageMessage(methodCall: call, result: result)
        }else if method == "createSoundMessage" {
            messageManager.createSoundMessage(methodCall: call, result: result)
        }else if method == "createVideoMessage" {
            messageManager.createVideoMessage(methodCall: call, result: result)
        }else if method == "createFileMessage" {
            messageManager.createFileMessage(methodCall: call, result: result)
        }else if method == "createMergerMessage" {
            messageManager.createMergerMessage(methodCall: call, result: result)
        }else if method == "createForwardMessage" {
            messageManager.createForwardMessage(methodCall: call, result: result)
        }else{
            print("Handle MethodName Error: MessageManager method: \(method)  not found")
        }
    }
    
    private func handleGroupManager(call: FlutterMethodCall, result: @escaping FlutterResult){
        let method: String = call.method
        if method == "inviteUserToGroup" {
            groupManager.inviteUserToGroup(methodCall: call, result: result)
        }else if method == "kickGroupMember" {
            groupManager.kickGroupMember(methodCall: call, result: result)
        }else if method == "getGroupMembersInfo" {
            groupManager.getGroupMembersInfo(methodCall: call, result: result)
        }else if method == "getGroupMemberList" {
            groupManager.getGroupMemberList(methodCall: call, result: result)
        }else if method == "getJoinedGroupList" {
            groupManager.getJoinedGroupList(methodCall: call, result: result)
        }else if method == "createGroup" {
            groupManager.createGroup(methodCall: call, result: result)
        }else if method == "setGroupInfo" {
            groupManager.setGroupInfo(methodCall: call, result: result)
        }else if method == "getGroupsInfo" {
            groupManager.getGroupsInfo(methodCall: call, result: result)
        }else if method == "joinGroup" {
            groupManager.joinGroup(methodCall: call, result: result)
        }else if method == "quitGroup" {
            groupManager.quitGroup(methodCall: call, result: result)
        }else if method == "transferGroupOwner" {
            groupManager.transferGroupOwner(methodCall: call, result: result)
        }else if method == "getGroupApplicationList" {
            groupManager.getGroupApplicationList(methodCall: call, result: result)
        }else if method == "acceptGroupApplication" {
            groupManager.acceptGroupApplication(methodCall: call, result: result)
        }else if method == "refuseGroupApplication" {
            groupManager.refuseGroupApplication(methodCall: call, result: result)
        }else{
            print("Handle MethodName Error: MessageManager method: \(method)  not found")
        }
    }
    
}
