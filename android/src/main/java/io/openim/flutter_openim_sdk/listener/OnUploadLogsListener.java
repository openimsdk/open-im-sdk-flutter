package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk_callback.UploadLogProgress;

public class OnUploadLogsListener implements UploadLogProgress {
    final private MethodChannel.Result result;

    public OnUploadLogsListener(MethodChannel.Result result, MethodCall call) {
        this.result = result;
    }

    @Override
    public void onProgress(long current, long size) {
            final Map<String, Object> values = new ArrayMap<>();
            values.put("current", current);
            values.put("size", size);
            CommonUtil.emitEvent("uploadLogsListener", "onProgress", values);
    }
}
