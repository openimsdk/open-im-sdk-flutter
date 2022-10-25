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
        self["signalingUpdateMeetingInfo"] = signalingUpdateMeetingInfo
        self["signalingCreateMeeting"] = signalingCreateMeeting
        self["signalingJoinMeeting"] = signalingJoinMeeting
        self["signalingOperateStream"] = signalingOperateStream
        self["signalingGetMeetings"] = signalingGetMeetings
        self["signalingCloseRoom"] = signalingCloseRoom
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
    
    func signalingUpdateMeetingInfo(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingUpdateMeetingInfo(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "info"])
    }
    
    func signalingCreateMeeting(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingCreateMeeting(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "info"])
    }
    
    func signalingJoinMeeting(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingJoinMeeting(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[jsonString: "info"])
    }
    
    func signalingOperateStream(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingOperateStream(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "streamType"], methodCall[string: "roomID"], methodCall[string: "userID"], methodCall[bool: "mute"], methodCall[bool: "muteAll"])
    }
    
    func signalingGetMeetings(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingGetMeetings(BaseCallback(result: result), methodCall[string: "operationID"])
    }
    
    func signalingCloseRoom(methodCall: FlutterMethodCall, result: @escaping FlutterResult){
        Open_im_sdkSignalingCloseRoom(BaseCallback(result: result), methodCall[string: "operationID"], methodCall[string: "roomID"])
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
    
    public func onStreamChange(_ s: String?) {
        CommonUtil.emitEvent(channel: channel, method: "signalingListener", type: "onStreamChange", errCode: nil, errMsg: nil, data: s)
    }
    
}
