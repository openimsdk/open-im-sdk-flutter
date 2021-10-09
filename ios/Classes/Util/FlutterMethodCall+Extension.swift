//
//  FlutterMethodCall+Extension.swift
//  flutter_openim_sdk
//
//  Created by willem on 2021/10/9.
//

import Foundation
import Flutter

public protocol Stringable {
    var rawValue: String { get }
}

extension String: Stringable {
    public var rawValue: String { self }
}

public extension FlutterMethodCall {
    subscript(_ key: Stringable) -> Any? {
        guard let params = self.arguments as? [String: Any] else {
            return nil
        }
        return params[key.rawValue]
    }
    
    subscript(string key: Stringable) -> String {
        return self[key] as? String ?? ""
    }
    
    subscript(jsonString key: Stringable) -> String {
        guard let params = self.arguments as? [String: Any] else {
            return ""
        }
        let arg = params[key.rawValue] as AnyObject
        return JsonUtil.toString(object: arg)
    }
    
    subscript(int32 key: Stringable) -> Int32 {
        guard let value = self[key] else {
            return 0
        }
        if let value = value as? Int32 {
            return value
        } else if let value = value as? String {
            return Int32(value) ?? 0
        }
        return 0
    }
    
    subscript(int64 key: Stringable) -> Int64 {
        guard let value = self[key] else {
            return 0
        }
        if let value = value as? Int64 {
            return value
        } else if let value = value as? String {
            return Int64(value) ?? 0
        }
        return 0
    }
    
    subscript(int key: Stringable) -> Int {
        guard let value = self[key] else {
            return 0
        }
        if let value = value as? Int {
            return value
        } else if let value = value as? String {
            return Int(value) ?? 0
        }
        return 0
    }
    
    subscript(double key: Stringable) -> Double {
        guard let value = self[key] else {
            return 0
        }
        if let value = value as? Double {
            return value
        } else if let value = value as? String {
            return Double(value) ?? 0.0
        }
        return 0
    }
    
    subscript(bool key: Stringable, default default: Bool = false) -> Bool {
        guard let value = self[key] else {
            return `default`
        }
        if let value = value as? Bool {
            return value
        } else if let value = value as? Int {
            return value != 0
        } else if let value = value as? NSString {
            return value.boolValue
        }
        return `default`
    }
    
    subscript(dict key: Stringable) -> [AnyHashable: Any] {
        return self[key] as? [AnyHashable: Any] ?? [:]
    }
    
    func toJsonString() -> String {
        let params = self.arguments as AnyObject
        return JsonUtil.toString(object: params)
    }
}
