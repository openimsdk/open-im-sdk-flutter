package io.openim.flutter_openim_sdk.manager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.openim.flutter_openim_sdk.listener.OnBaseListener;
import io.openim.flutter_openim_sdk.listener.OnOrganizationListener;
import open_im_sdk.Open_im_sdk;

public class OrganizationManager extends BaseManager {

    public void setOrganizationListener(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.setOrganizationListener(new OnOrganizationListener());
    }

    public void getSubDepartment(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getSubDepartment(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "departmentID"),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count")
        );
    }

    public void getDepartmentMember(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getDepartmentMember(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "departmentID"),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count")
        );
    }

    public void getUserInDepartment(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getUserInDepartment(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "userID")
        );
    }

    public void getDepartmentMemberAndSubDepartment(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getDepartmentMemberAndSubDepartment(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "departmentID")
        );
    }

    public void getDepartmentInfo(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.getDepartmentInfo(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                value(methodCall, "departmentID")
        );
    }

    public void searchOrganization(MethodCall methodCall, MethodChannel.Result result) {
        Open_im_sdk.searchOrganization(
                new OnBaseListener(result, methodCall),
                value(methodCall, "operationID"),
                jsonValue(methodCall, "searchParam"),
                int2long(methodCall, "offset"),
                int2long(methodCall, "count")
        );
    }
}
