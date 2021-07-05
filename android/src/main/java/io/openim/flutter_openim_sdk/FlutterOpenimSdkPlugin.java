package io.openim.flutter_openim_sdk;

import android.content.Context;

import androidx.annotation.NonNull;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.openim.flutter_openim_sdk.manager.ConversationManager;
import io.openim.flutter_openim_sdk.manager.FriendshipManager;
import io.openim.flutter_openim_sdk.manager.IMManager;
import io.openim.flutter_openim_sdk.manager.MessageManager;
import io.openim.flutter_openim_sdk.util.CommonUtil;


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
    private static FriendshipManager friendshipManager;
    private static MessageManager messageManager;
    private static ConversationManager conversationManager;

    public FlutterOpenimSdkPlugin() {
    }

    private FlutterOpenimSdkPlugin(Context context, MethodChannel channel) {
        FlutterOpenimSdkPlugin.imManager = new IMManager(channel);
        FlutterOpenimSdkPlugin.friendshipManager = new FriendshipManager(channel);
        FlutterOpenimSdkPlugin.messageManager = new MessageManager(channel);
        FlutterOpenimSdkPlugin.conversationManager = new ConversationManager(channel);
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_openim_sdk");
        channel.setMethodCallHandler(new FlutterOpenimSdkPlugin(flutterPluginBinding.getApplicationContext(), channel));
//        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        parse(call, result);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    void parse(@NonNull MethodCall call, @NonNull Result result) {
        try {
            String managerName = CommonUtil.getParamValue(call, "ManagerName");
            Field field = FlutterOpenimSdkPlugin.class.getDeclaredField(managerName);
            Method method = field.get(new Object()).getClass().getDeclaredMethod(call.method, MethodCall.class, Result.class);
            System.out.println("flutter call native { class:" + managerName + ",  method:" + method.getName() + " }");
            method.invoke(field.get(new Object()), call, result);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
