import Flutter
import UIKit

public class SwiftFlutterOpenimSdkPlugin: NSObject, FlutterPlugin {
    let imManager: IMMananger
    let conversationManager: ConversationManager
    let friendshipManager: FriendshipManager
    let messageManager: MessageManager
    let groupManager: GroupManager
    let userManger: UserManager
    
    init(channel: FlutterMethodChannel) {
        self.imManager = IMMananger(channel: channel)
        self.conversationManager = ConversationManager(channel: channel)
        self.friendshipManager = FriendshipManager(channel: channel)
        self.messageManager = MessageManager(channel: channel)
        self.groupManager = GroupManager(channel: channel)
        self.userManger = UserManager(channel: channel)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_openim_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterOpenimSdkPlugin(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let managerName: String = call[string: "ManagerName"]
        switch managerName {
        case "imManager":
            imManager.handleMethod(call: call, result: result)
        case "conversationManager":
            conversationManager.handleMethod(call: call, result: result)
        case "messageManager":
            messageManager.handleMethod(call: call, result: result)
        case "friendshipManager":
            friendshipManager.handleMethod(call: call, result: result)
        case "groupManager":
            groupManager.handleMethod(call: call, result: result)
        case "userManager":
            userManger.handleMethod(call: call, result: result)
        default:
            print("Handle ManagerName Error: \(managerName) not found")
        }
    }
}

