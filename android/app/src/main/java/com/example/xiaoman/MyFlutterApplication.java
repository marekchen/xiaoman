package com.example.xiaoman;

import android.os.Handler;
import android.os.Looper;

import io.flutter.app.FlutterApplication;
import io.rong.imlib.RongIMClient;

public class MyFlutterApplication extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                RongIMClient.init(MyFlutterApplication.this);
            }
        });
    }
}
