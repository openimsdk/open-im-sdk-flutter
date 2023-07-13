package io.openim.flutter_openim_sdk.util;

import android.os.Handler;
import android.os.Looper;

import androidx.collection.ArrayMap;

import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;


public class CommonUtil {
    private final static Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public static void runMainThreadReturn(final MethodChannel.Result result, final Object param) {
        MAIN_HANDLER.post(() -> result.success(param));
    }

    public static void runMainThread(Runnable runnable) {
        MAIN_HANDLER.post(runnable);
    }


    public static void runMainThreadReturnError(final MethodChannel.Result result, final String errorCode, final String errorMessage, final Object errorDetails) {
        MAIN_HANDLER.post(() -> result.error(errorCode, errorMessage, errorDetails));
    }

    public static void runMainThreadReturnError(final MethodChannel.Result result, final long errorCode, final String errorMessage, final Object errorDetails) {
        runMainThreadReturnError(result, String.valueOf(errorCode), errorMessage, errorDetails);
    }

    public synchronized static <T> void emitEvent(String method, String type, Object errCode, String errMsg, T data) {
        String threadName = Thread.currentThread().getName();
        runMainThread(() -> {
            Map<String, Object> res = new ArrayMap<>();
            if (null != type) {
                res.put("type", type);
            }
            if (null != data) {
                res.put("data", data);
            }
            if (null != errCode) {
                res.put("errCode", errCode);
            }
            if (null != errMsg) {
                res.put("errMsg", errMsg);
            }
            Log.i("F-OpenIMSDK(native call flutter)", "thread: " + threadName + " { method:" + method + ",  type:" + type + " }");
            FlutterOpenimSdkPlugin.channel.invokeMethod(method, res);
        });
    }

    public static <T> void emitEvent(String method, String type, T data) {
        emitEvent(method, type, null, null, data);
    }
}
