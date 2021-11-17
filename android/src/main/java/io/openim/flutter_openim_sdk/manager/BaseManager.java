package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.openim.flutter_openim_sdk.util.JsonUtil;

class BaseManager {

    static String jsonValue(MethodCall methodCall, String key) {
        return JsonUtil.toString(methodCall.argument(key));
    }

    static String jsonValue(MethodCall methodCall) {
        return JsonUtil.toString(methodCall.arguments);
    }

    static <T> T value(MethodCall methodCall, String key) {
        return methodCall.argument(key);
    }

    static Long int2long(MethodCall methodCall, String key) {
        Integer i = value(methodCall, key);
        return Long.valueOf(i);
    }
}
