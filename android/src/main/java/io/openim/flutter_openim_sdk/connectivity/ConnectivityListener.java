package io.openim.flutter_openim_sdk.connectivity;


import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Network;
import android.os.Build;

import io.flutter.Log;
import io.openim.flutter_openim_sdk.FlutterOpenimSdkPlugin;
import open_im_sdk.Open_im_sdk;


public class ConnectivityListener implements open_im_sdk_callback.Base {
    public static final String CONNECTIVITY_ACTION = "android.net.conn.CONNECTIVITY_CHANGE";
    private Context context;
    private ConnectivityManager connectivityManager;
    private Connectivity connectivity;
    private ConnectivityBroadcastReceiver receiver;
    private ConnectivityManager.NetworkCallback networkCallback;

    public ConnectivityListener(Context context) {
        this.context = context;
        this.connectivityManager =
                (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        this.connectivity = new Connectivity(connectivityManager);
        this.receiver = new ConnectivityBroadcastReceiver(this);
    }

    private void onChangedNetworkStatus() {
        String status = connectivity.getNetworkType();
        if (Connectivity.CONNECTIVITY_MOBILE.equals(status) || Connectivity.CONNECTIVITY_WIFI.equals(status)) {
            Log.i("ConnectivityListener", "networkStatusChanged: " + status);
            if (FlutterOpenimSdkPlugin.isInitialized) {
                Open_im_sdk.networkStatusChanged(this, String.valueOf(System.currentTimeMillis()));
            }
        }
    }

    public void register() {
        if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            networkCallback = new ConnectivityManager.NetworkCallback() {
                @Override
                public void onAvailable(Network network) {
                    onChangedNetworkStatus();
                }

                @Override
                public void onLost(Network network) {
                }
            };
            connectivity.getConnectivityManager().registerDefaultNetworkCallback(networkCallback);
        } else {
            context.registerReceiver(receiver, new IntentFilter(CONNECTIVITY_ACTION));
        }
    }

    public void unregisterReceiver() {
        if (android.os.Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            if (networkCallback != null) {
                connectivity.getConnectivityManager().unregisterNetworkCallback(networkCallback);
                networkCallback = null;
            }
        } else {
            try {
                context.unregisterReceiver(receiver);
                receiver = null;
            } catch (Exception e) {
                //listen never called, ignore the error
            }
        }
    }

    @Override
    public void onError(int i, String s) {

    }

    @Override
    public void onSuccess(String s) {

    }

    public static class ConnectivityBroadcastReceiver extends BroadcastReceiver {
        ConnectivityListener listener;

        public ConnectivityBroadcastReceiver(ConnectivityListener listener) {
            this.listener = listener;
        }

        @Override
        public void onReceive(Context context, Intent intent) {
            if (null != listener && CONNECTIVITY_ACTION.equals(intent.getAction())) {
                listener.onChangedNetworkStatus();
            }
        }
    }
}
