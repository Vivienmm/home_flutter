package com.chinaso.home_flutter;

import com.yoozoo.sharesdk.FlutterLoopSharePrepare;

import io.flutter.app.FlutterApplication;

/**
 * @author Suyw
 * @description:
 * @date : 2021/3/5 10:52 AM
 */
public class CsApp extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();

        //initShare
        FlutterLoopSharePrepare flutterLoopSharePrepare = new FlutterLoopSharePrepare();
        flutterLoopSharePrepare.prepare(this, MainActivity.class);
    }
}
