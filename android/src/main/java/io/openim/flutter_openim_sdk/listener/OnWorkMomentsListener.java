package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnWorkMomentsListener implements open_im_sdk_callback.OnWorkMomentsListener {


    @Override
    public void onRecvNewNotification() {
        CommonUtil.emitEvent("workMomentsListener", "OnRecvNewNotification", null);
    }
}
