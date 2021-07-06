package io.openim.flutter_openim_sdk.util;

import org.json.JSONObject;

public class JsonUtil {
    public static String toString(Object o) {
        Object obj = JSONObject.wrap(o);
        if (null != obj) {
            return obj.toString();
        }
        return null;
    }
}
