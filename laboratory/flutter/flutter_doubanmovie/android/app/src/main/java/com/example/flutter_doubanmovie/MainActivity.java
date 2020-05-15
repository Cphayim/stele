package com.example.flutter_doubanmovie;

import android.app.AlertDialog;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor(), "flutter.doubanmovie/buy").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method){
          case "buyTicket":
            // 显示 dialog
            new AlertDialog.Builder(MainActivity.this)
                    .setTitle("买票")
                    .setMessage((String)call.arguments)
                    .create().show();
            // 返回消息
            result.success(0);
            return;
          default:
            result.notImplemented();
            return;
        }
      }
    });
  }
}
