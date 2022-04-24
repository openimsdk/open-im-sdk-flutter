package io.openim.flutter_openim_sdk.util;

import org.json.JSONObject;

public class JsonUtil {
    public static String toString(Object o) {
        if (o == null) return null;
        if (o instanceof String) {
            StringBuilder buffer = new StringBuilder();
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
