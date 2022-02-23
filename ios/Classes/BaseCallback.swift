import Foundation
import OpenIMCore

public class BaseCallback: NSObject, Open_im_sdk_callbackBaseProtocol {
    
    private let result:FlutterResult
    
    init(result:@escaping FlutterResult) {
        self.result = result
    }
    
    public func onError(_ errCode: Int32, errMsg: String?) {
        print("BaseResult: " + errMsg!)
        safeMainAsync { self.result(FlutterError(code: "\(errCode)", message: errMsg, details: nil)) }
    }
    
    public func onSuccess(_ data: String?) {
        safeMainAsync { self.result(data) }
    }
}
