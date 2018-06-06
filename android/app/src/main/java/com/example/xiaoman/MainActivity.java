package com.example.xiaoman;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String METHOD_CHANNEL = "marekchen.github.com/rongcloud";
    private static final String EVENT_CHANNEL = "marekchen.github.com/rongcloud-event";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), METHOD_CHANNEL).setMethodCallHandler(new FlutterRongcloudPlugin());
        new EventChannel(getFlutterView(), EVENT_CHANNEL).setStreamHandler(new FlutterRongcloudPlugin());
    }
}
