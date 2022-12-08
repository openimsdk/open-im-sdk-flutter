package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnCustomBusinessListener implements open_im_sdk_callback.OnCustomBusinessListener {
    @Override
    public void onRecvCustomBusinessMessage(String s) {
        CommonUtil.emitEvent("customBusinessListener", "onRecvCustomBusinessMessage", s);
    }
}
