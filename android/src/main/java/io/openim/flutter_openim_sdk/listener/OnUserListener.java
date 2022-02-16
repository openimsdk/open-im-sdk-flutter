package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnUserListener implements open_im_sdk_callback.OnUserListener {

    /**
     * 登录用户个人资料有变化时回调
     */
    @Override
    public void onSelfInfoUpdated(String s) {
        CommonUtil.emitEvent("userListener", "onSelfInfoUpdated", s);
    }
}
