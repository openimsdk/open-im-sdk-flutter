package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnMessageKvInfoListener implements open_im_sdk_callback.OnMessageKvInfoListener {

    // 经过聚合后的kv，计算了总数，判断了是否包含自己
    @Override
    public void onMessageKvInfoChanged(String s) {
        CommonUtil.emitEvent("messageKvInfoListener", "onMessageKvInfoChanged", s);
    }
}
