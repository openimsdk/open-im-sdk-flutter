import Foundation

public class JsonUtil {
    
    public static func toString(object: AnyObject?)->String {
        
        if object is NSNull {
            return ""
        }
        
        if object == nil {
            return ""
        }
        
        if object is String{
            let s = object as! String
            let b = s.replacingOccurrences(of: "\"", with: "\\\"")
            let a = "\"\(b)\""
            return a
        }
        let data = try? JSONSerialization.data(withJSONObject: object!, options: JSONSerialization.WritingOptions.init(rawValue: 0))
        let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        return jsonStr! as String
    }
}
