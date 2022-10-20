package com.example.firstproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        logd("onCreate called")
    }

    override fun onStart() {
        super.onStart()
        logd("onStart called")
    }
}