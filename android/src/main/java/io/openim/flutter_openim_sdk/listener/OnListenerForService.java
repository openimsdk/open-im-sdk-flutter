//package io.openim.flutter_openim_sdk.listener;
//
//import io.openim.flutter_openim_sdk.util.CommonUtil;
//
//public class OnListenerForService implements open_im_sdk_callback.OnListenerForService {
//    @Override
//    public void onFriendApplicationAccepted(String s) {
//        CommonUtil.emitEvent("listenerForService", "onFriendApplicationAccepted", s);
//    }
//
//    @Override
//    public void onFriendApplicationAdded(String s) {
//        CommonUtil.emitEvent("listenerForService", "onFriendApplicationAdded", s);
//    }
//
//    @Override
//    public void onGroupApplicationAccepted(String s) {
//        CommonUtil.emitEvent("listenerForService", "onGroupApplicationAccepted", s);
//    }
//
//    @Override
//    public void onGroupApplicationAdded(String s) {
//        CommonUtil.emitEvent("listenerForService", "onGroupApplicationAdded", s);
//    }
//
//    @Override
//    public void onRecvNewMessage(String s) {
//        CommonUtil.emitEvent("listenerForService", "onRecvNewMessage", s);
//    }
//}
