package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk_callback.UploadFileCallback;

public class OnUploadFileListener implements UploadFileCallback {
    final private MethodChannel.Result result;
    final private Object id;

    public OnUploadFileListener(MethodChannel.Result result, MethodCall call) {
        this.result = result;
        this.id = call.argument("id");
    }

    @Override
    public void complete(long size, String url, long type) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("size", size);
            values.put("url", url);
            values.put("type", type);
            CommonUtil.emitEvent("uploadFileListener", "complete", values);
        }
    }

    @Override
    public void hashPartComplete(String partHash, String fileHash) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("partHash", partHash);
            values.put("fileHash", fileHash);
            CommonUtil.emitEvent("uploadFileListener", "hashPartComplete", values);
        }
    }

    @Override
    public void hashPartProgress(long index, long size, String partHash) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("index", index);
            values.put("size", size);
            values.put("partHash", partHash);
            CommonUtil.emitEvent("uploadFileListener", "hashPartProgress", values);
        }
    }

    @Override
    public void open(long size) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("size", size);
            CommonUtil.emitEvent("uploadFileListener", "open", values);
        }
    }

    @Override
    public void partSize(long partSize, long num) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("partSize", partSize);
            values.put("num", num);
            CommonUtil.emitEvent("uploadFileListener", "partSize", values);
        }
    }

    @Override
    public void uploadComplete(long fileSize, long streamSize, long storageSize) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("fileSize", fileSize);
            values.put("streamSize", streamSize);
            values.put("storageSize", storageSize);
            CommonUtil.emitEvent("uploadFileListener", "uploadProgress", values);
        }
    }

    @Override
    public void uploadID(String uploadID) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("uploadID", uploadID);
            CommonUtil.emitEvent("uploadFileListener", "uploadID", values);
        }
    }

    @Override
    public void uploadPartComplete(long index, long partSize, String partHash) {
        if (null != id) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("id", id);
            values.put("index", index);
            values.put("partSize", partSize);
            values.put("partHash", partHash);
            CommonUtil.emitEvent("uploadFileListener", "uploadPartComplete", values);
        }
    }
}
