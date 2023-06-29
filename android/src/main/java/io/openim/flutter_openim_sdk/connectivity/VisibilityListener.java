package io.openim.flutter_openim_sdk.connectivity;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.Log;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;
import open_im_sdk.Open_im_sdk;

public class VisibilityListener implements Application.ActivityLifecycleCallbacks, open_im_sdk_callback.Base {
    public void register(Activity activity) {
        if (null != activity) {
            activity.getApplication().registerActivityLifecycleCallbacks(this);
        }
    }

    public void unregisterReceiver(Activity activity) {
        if (null != activity) {
            activity.getApplication().unregisterActivityLifecycleCallbacks(this);
        }
    }


    @Override
    public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle savedInstanceState) {
        Log.i("VisibilityListener", "onActivityCreated");
    }

    @Override
    public void onActivityStarted(@NonNull Activity activity) {
        Log.i("VisibilityListener", "onActivityStarted");
    }

    @Override
    public void onActivityResumed(@NonNull Activity activity) {
        Log.i("VisibilityListener", "onActivityResumed");
        if (FlutterOpenimSdkPlugin.isInitialized) {
            Open_im_sdk.setAppBackgroundStatus(this, String.valueOf(System.currentTimeMillis()), false);
        }
    }

    @Override
    public void onActivityPaused(@NonNull Activity activity) {
        Log.i("VisibilityListener", "onActivityPaused");
        if (FlutterOpenimSdkPlugin.isInitialized) {
            Open_im_sdk.setAppBackgroundStatus(this, String.valueOf(System.currentTimeMillis()), true);
        }
    }

    @Override
    public void onActivityStopped(@NonNull Activity activity) {
        Log.i("VisibilityListener", "onActivityStopped");
    }

    @Override
    public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle outState) {
        Log.i("VisibilityListener", "onActivitySaveInstanceState");
    }

    @Override
    public void onActivityDestroyed(@NonNull Activity activity) {
        Log.i("VisibilityListener", "onActivityDestroyed");
    }

    @Override
    public void onError(int i, String s) {

    }

    @Override
    public void onSuccess(String s) {

    }
}
