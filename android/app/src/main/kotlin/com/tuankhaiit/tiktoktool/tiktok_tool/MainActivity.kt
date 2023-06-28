package com.tuankhaiit.tiktoktool.tiktok_tool

import android.os.Bundle
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.distribute.Distribute
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Distribute.setEnabled(true)
        AppCenter.start(application, "050400c1-4825-4f1e-86f4-f92f9b13e89a", Distribute::class.java)
    }
}
