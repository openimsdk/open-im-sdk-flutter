package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk_callback.PutFileCallback;

public class OnPutFileListener implements PutFileCallback {
    final private MethodChannel.Result result;
    final private Object putID;

    public OnPutFileListener(MethodChannel.Result result, MethodCall call) {
        this.result = result;
        this.putID = call.argument("putID");
    }

    @Override
    public void hashComplete(String hash, long total) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("hash", hash);
            values.put("total", total);
            CommonUtil.emitEvent("putFileListener", "hashComplete", values);
        }
    }

    @Override
    public void hashProgress(long current, long total) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("current", current);
            values.put("total", total);
            CommonUtil.emitEvent("putFileListener", "hashProgress", values);
        }
    }

    @Override
    public void open(long size) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("size", size);
            CommonUtil.emitEvent("putFileListener", "open", values);
        }
    }

    @Override
    public void putComplete(long total, long putType) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("putType", putType);
            values.put("total", total);
            CommonUtil.emitEvent("putFileListener", "putComplete", values);
        }
    }

    @Override
    public void putProgress(long save, long current, long total) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("save", save);
            values.put("current", current);
            values.put("total", total);
            CommonUtil.emitEvent("putFileListener", "putProgress", values);
        }
    }

    @Override
    public void putStart(long current, long total) {
        if (null != putID) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("putID", putID);
            values.put("current", current);
            values.put("total", total);
            CommonUtil.emitEvent("putFileListener", "putStart", values);
        }
    }
}
