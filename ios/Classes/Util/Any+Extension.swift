//
//  Any+Extension.swift
//  flutter_openim_sdk
//
//  Created by willem on 2021/10/9.
//

import Foundation

public func typeName(_ obj: Any) -> String {
    if obj is AnyClass {
        return "\(obj)"
    }
    return "\(type(of: obj))"
}

public func safeMainAsync(_ work: @escaping @convention(block) () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
