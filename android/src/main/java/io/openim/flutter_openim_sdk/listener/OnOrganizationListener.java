package io.openim.flutter_openim_sdk.listener;

import io.openim.flutter_openim_sdk.util.CommonUtil;

public class OnOrganizationListener implements open_im_sdk_callback.OnOrganizationListener {
    @Override
    public void onOrganizationUpdated() {
        CommonUtil.emitEvent("organizationListener", "onOrganizationUpdated", null);
    }
}
