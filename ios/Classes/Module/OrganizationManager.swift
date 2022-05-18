import Foundation
import OpenIMCore

public class OrganizationManager: BaseServiceManager {

  public override func registerHandlers() {
        super.registerHandlers()
        self["setOrganizationListener"] = setOrganizationListener
        self["getSubDepartment"] = getSubDepartment
        self["getDepartmentMember"] = getDepartmentMember
        self["getUserInDepartment"] = getUserInDepartment
        self["getDepartmentMemberAndSubDepartment"] = getDepartmentMemberAndSubDepartment
    }

    func setOrganizationListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetOrganizationListener(OrganizationListener(channel: channel))
        callBack(result)
    }

    func getSubDepartment(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetSubDepartment(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "departmentID"], methodCall[int: "offset"], methodCall[int: "count"])
    }
    
    func getDepartmentMember(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetDepartmentMember(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "departmentID"], methodCall[int: "offset"], methodCall[int: "count"])
    }
    
    func getUserInDepartment(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetUserInDepartment(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "userID"])
    }
    
    func getDepartmentMemberAndSubDepartment(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        Open_im_sdkGetDepartmentMemberAndSubDepartment(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "departmentID"], methodCall[int: "departmentOffset"], methodCall[int: "departmentCount"], methodCall[int: "memberOffset"], methodCall[int: "memberCount"])
    }
}

public class OrganizationListener: NSObject, Open_im_sdk_callbackOnOrganizationListenerProtocol {
    
    private let channel:FlutterMethodChannel

    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onOrganizationUpdated() {
        CommonUtil.emitEvent(channel: self.channel, method: "organizationListener", type: "onOrganizationUpdated", errCode: nil, errMsg: nil, data: nil)
    }
    
}
