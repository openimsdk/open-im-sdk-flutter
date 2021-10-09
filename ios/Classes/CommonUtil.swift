
import Foundation


public class CommonUtil {
    
    public static func emitEvent(channel: FlutterMethodChannel, method: String, type: String, errCode: Int?, errMsg: String?, data: Any?){
        DispatchQueue.main.async {
            let res: NSMutableDictionary = NSMutableDictionary(capacity: 0)
            res.setValue(type, forKey: "type")
            if (data != nil) {
                res.setValue(data, forKey: "data");
            }
            if (nil != errCode) {
                res.setValue(errCode, forKey: "errCode");
            }
            if (nil != errMsg) {
                res.setValue(errMsg, forKey: "errMsg");
            }
            print("native call flutter { method: \(method) type: \(type) }")
            channel.invokeMethod(method, arguments: res)
        }
    }
}
