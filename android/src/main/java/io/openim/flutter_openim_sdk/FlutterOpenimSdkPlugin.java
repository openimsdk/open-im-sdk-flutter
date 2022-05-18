package io.openim.flutter_openim_sdk;

import android.content.Context;

import androidx.annotation.NonNull;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.openim.flutter_openim_sdk.manager.ConversationManager;
import io.openim.flutter_openim_sdk.manager.FriendshipManager;
import io.openim.flutter_openim_sdk.manager.GroupManager;
import io.openim.flutter_openim_sdk.manager.IMManager;
import io.openim.flutter_openim_sdk.manager.MessageManager;
import io.openim.flutter_openim_sdk.manager.OrganizationManager;
import io.openim.flutter_openim_sdk.manager.SignalingManager;
import io.openim.flutter_openim_sdk.manager.UserManager;
import io.openim.flutter_openim_sdk.manager.WorkMomentsManager;


/**
 * FlutterOpenimSdkPlugin
 */
public class FlutterOpenimSdkPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    public static MethodChannel channel;
    private static IMManager imManager;
    private static UserManager userManager;
    private static FriendshipManager friendshipManager;
    private static MessageManager messageManager;
    private static ConversationManager conversationManager;
    private static GroupManager groupManager;
    private static SignalingManager signalingManager;
    private static WorkMomentsManager workMomentsManager;
    private static OrganizationManager organizationManager;

    public FlutterOpenimSdkPlugin() {
    }

    private FlutterOpenimSdkPlugin(Context context) {
        FlutterOpenimSdkPlugin.imManager = new IMManager();
        FlutterOpenimSdkPlugin.userManager = new UserManager();
        FlutterOpenimSdkPlugin.friendshipManager = new FriendshipManager();
        FlutterOpenimSdkPlugin.messageManager = new MessageManager();
        FlutterOpenimSdkPlugin.conversationManager = new ConversationManager();
        FlutterOpenimSdkPlugin.groupManager = new GroupManager();
        FlutterOpenimSdkPlugin.signalingManager = new SignalingManager();
        FlutterOpenimSdkPlugin.workMomentsManager = new WorkMomentsManager();
        FlutterOpenimSdkPlugin.organizationManager = new OrganizationManager();
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        FlutterOpenimSdkPlugin.channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_openim_sdk");
        FlutterOpenimSdkPlugin.channel.setMethodCallHandler(new FlutterOpenimSdkPlugin(flutterPluginBinding.getApplicationContext()));
//        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        parse(call, result);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        FlutterOpenimSdkPlugin.channel.setMethodCallHandler(null);
    }

    void parse(@NonNull MethodCall call, @NonNull Result result) {
        try {
            String managerName = call.argument("ManagerName");
            Field field = FlutterOpenimSdkPlugin.class.getDeclaredField(managerName);
            Method method = field.get(new Object()).getClass().getDeclaredMethod(call.method, MethodCall.class, Result.class);
            Log.i("F-OpenIMSDK(flutter call native)", "{ class:" + managerName + ",  method:" + method.getName() + " }");
            method.invoke(field.get(new Object()), call, result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
