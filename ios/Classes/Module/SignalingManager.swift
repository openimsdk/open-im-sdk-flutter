import Foundation
import OpenIMCore

public class SignalingManager: BaseServiceManager {
    
    public override func registerHandlers() {
        super.registerHandlers()
        self["setSignalingListener"] = setSignalingListener
        self["signalingInvite"] = signalingInvite
        self["signalingInviteInGroup"] = signalingInviteInGroup
        self["signalingAccept"] = signalingAccept
        self["signalingReject"] = signalingReject
        self["signalingCancel"] = signalingCancel
        self["signalingHungUp"] = signalingHungUp
        self["signalingGetRoomByGroupID"] = signalingGetRoomByGroupID
        self["signalingGetTokenByRoomID"] = signalingGetTokenByRoomID
    }

    func setSignalingListener(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSetSignalingListener(SignalingListener(channel: channel))
        callBack(result)
    }

    func signalingInvite(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingInvite(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }
    
    func signalingInviteInGroup(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingInviteInGroup(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }
    
    func signalingAccept(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingAccept(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }
    
    func signalingReject(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingReject(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }
    
    func signalingCancel(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingCancel(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }

    func signalingHungUp(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingHungUp(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "signalingInfo"])
    }
    
    func signalingGetRoomByGroupID(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingGetRoomByGroupID(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "groupID"])
    }
    
    func signalingGetTokenByRoomID(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingGetTokenByRoomID(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "roomID"])
    }
}
public class SignalingListener: NSObject, Open_im_sdk_callbackOnSignalingListenerProtocol {
   
    private let channel:FlutterMethodChannel
    
    init(channel:FlutterMethodChannel) {
        self.channel = channel
    }
    
    public func onInvitationCancelled(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInvitationCancelled", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onInvitationTimeout(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInvitationTimeout", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onInviteeAccepted(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInviteeAccepted", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onInviteeAccepted(byOtherDevice s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInviteeAcceptedByOtherDevice", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onInviteeRejected(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInviteeRejected", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onInviteeRejected(byOtherDevice s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onInviteeRejectedByOtherDevice", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onReceiveNewInvitation(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onReceiveNewInvitation", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onHangUp(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onHangUp", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onRoomParticipantConnected(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onRoomParticipantConnected", errCode: nil, errMsg: nil, data: s)
    }
    
    public func onRoomParticipantDisconnected(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onRoomParticipantDisconnected", errCode: nil, errMsg: nil, data: s)
    }
}
