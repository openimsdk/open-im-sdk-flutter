package io.openim.flutter_openim_sdk.util;

import org.json.JSONObject;

public class JsonUtil {
    public static String toString(Object o) {
        if (o instanceof String) {
            StringBuffer buffer = new StringBuffer();
            buffer.append("\"");
            buffer.append(o);
            buffer.append("\"");
            return buffer.toString();
        }
        Object obj = JSONObject.wrap(o);
        if (null != obj) {
            return obj.toString();
        }
        return null;
    }
}
