package com.doctors.demo

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.navigation.NavigationAPI

class MainActivity : FlutterActivity() {

    private val CHANNEL = "android"
    private var myresult: Result? = null

    private var result = 0L

    inner class NavigationImplement : NavigationAPI {
        override fun navigate(): Long {
//            val activity = this@MainActivity
//            val intent = Intent(activity, DemoActivity::class.java)
//            activity.startActivityForResult(intent, 100)
            return 10
        }

        override fun passData(value: String): Long {
            val activity = this@MainActivity
            val myIntent: Intent = Intent(
                activity,
                DemoActivity::class.java
            )
            myIntent.putExtra("textPass", value)
            activity.startActivityForResult(myIntent, 0)
            return 0
        }

    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine!!.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler { call, result ->
                run {
                    when (call.method) {
                        "navigate" -> {
                            myresult = result
                            val activity = this@MainActivity
                            val intent = Intent(activity, DemoActivity::class.java)
                            activity.startActivityForResult(intent, 100)
                        }// start your
                        "passData" -> {
                            var value = call.arguments

                            myresult = result
                            val activity = this@MainActivity
                            val intent = Intent(activity, DemoActivity::class.java)
                            intent.putExtra("textPass", value.toString())
                            activity.startActivityForResult(intent, 100)
                        }// sta// activity here
                        else -> result.notImplemented()
                    }
                }
            }
        NavigationAPI.setup(
            flutterEngine.dartExecutor.binaryMessenger,
            NavigationImplement()
        )
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 100) {
            val result = data?.getIntExtra("result", 0) ?: 0
            Log.d("MainActivity", "Result: $result")
            myresult!!.success(result)
        }
    }

}
