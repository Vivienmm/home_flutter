package com.chinaso.home_flutter



import android.content.res.Resources
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }


    override fun getResources(): Resources? {
        val res: Resources = super.getResources()
        val config = res.configuration
        //1 设置正常字体大小的倍数
        config.fontScale = 1.0f
        res.updateConfiguration(config, res.displayMetrics)
        return res
    }

}
