import Flutter
import OpenIMCore
import UIKit

public typealias ImHandler = (_ methodCall: FlutterMethodCall, _ result: @escaping FlutterResult) -> Void

open class BaseServiceManager {
    public let channel: FlutterMethodChannel
    private var methodHandlers: [String: ImHandler] = [:]
    
    public init(channel: FlutterMethodChannel) {
        self.channel = channel
        self.registerHandlers()
    }
    
    public func handleMethod(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method: String = call.method
        guard let handler = methodHandlers[method] else {
            print("Handle MethodName Error: \(typeName(self))'s method: [\(method)] not found")
            return
        }
        handler(call, result)
    }
    
    public subscript(_ key: String) -> ImHandler? {
        get {
            methodHandlers[key]
        }
        set {
            methodHandlers[key] = newValue
        }
    }
    
    public func registerHandlers() {
        
    }
    
    public func callBack(_ result: @escaping FlutterResult, _ content: Any? = nil) {
        safeMainAsync {
            result(content)
        }
    }
}
