package com.example.deliver

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel = "deliverChannel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getGoogleMapsKey" -> {
                        result.success(BuildConfig.GOOGLE_MAPS_KEY)
                    }

                    "getSentryDsn" -> {
                        result.success(BuildConfig.SENTRY_DSN)
                    }

                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
}
