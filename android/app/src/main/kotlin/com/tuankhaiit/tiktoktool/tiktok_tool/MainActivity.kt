package com.tuankhaiit.tiktoktool.tiktok_tool

import android.os.Bundle
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.distribute.Distribute
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AppCenter.start(application, "8129f156-9ece-4540-bf1d-bd97aa6a152a", Distribute::class.java)
    }
}
