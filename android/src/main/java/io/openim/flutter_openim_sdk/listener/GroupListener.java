package io.openim.flutter_openim_sdk.listener;

import android.util.ArrayMap;

import java.util.HashMap;
import java.util.Map;

import io.openim.flutter_openim_sdk.util.CommonUtil;
import open_im_sdk.OnGroupListener;

public class GroupListener implements OnGroupListener {
    @Override
    public void onApplicationProcessed(String s, String s1, int i, String s2) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("opUser", s1);
        map.put("agreeOrReject", i);
        map.put("opReason", s2);
        CommonUtil.emitEvent("groupListener", "onApplicationProcessed", map);
    }

    @Override
    public void onGroupCreated(String s) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        CommonUtil.emitEvent("groupListener", "onGroupCreated", map);
    }

    @Override
    public void onGroupInfoChanged(String s, String s1) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("groupInfo", s1);
        CommonUtil.emitEvent("groupListener", "onGroupInfoChanged", map);
    }

    @Override
    public void onMemberEnter(String s, String s1) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("memberList", s1);
        CommonUtil.emitEvent("groupListener", "onMemberEnter", map);
    }

    @Override
    public void onMemberInvited(String s, String s1, String s2) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("opUser", s1);
        map.put("memberList", s2);
        CommonUtil.emitEvent("groupListener", "onMemberInvited", map);
    }

    @Override
    public void onMemberKicked(String s, String s1, String s2) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("opUser", s1);
        map.put("memberList", s2);
        CommonUtil.emitEvent("groupListener", "onMemberKicked", map);
    }

    @Override
    public void onMemberLeave(String s, String s1) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("member", s1);
        CommonUtil.emitEvent("groupListener", "onMemberLeave", map);
    }

    @Override
    public void onReceiveJoinApplication(String s, String s1, String s2) {
        Map<String, Object> map = new ArrayMap<>();
        map.put("groupId", s);
        map.put("member", s1);
        map.put("opReason", s2);
        CommonUtil.emitEvent("groupListener", "onReceiveJoinApplication", map);
    }
}
