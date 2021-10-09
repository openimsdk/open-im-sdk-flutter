//
//  BaseCallback.swift
//  flutter_openim_sdk
//
//  Created by willem on 2021/10/9.
//

import Foundation
import OpenIMCore

public class BaseCallback: NSObject, Open_im_sdkBaseProtocol {
    
    private let result:FlutterResult
    
    init(result:@escaping FlutterResult) {
        self.result = result
    }
    
    public func onError(_ errCode: Int, errMsg: String?) {
        print("BaseResult: " + errMsg!)
        safeMainAsync { self.result(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
    }
    
    public func onSuccess(_ data: String?) {
        safeMainAsync { self.result(data) }
    }
}
