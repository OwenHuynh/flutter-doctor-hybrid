package com.doctors.demo

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class DemoActivity : AppCompatActivity() {
    var result1: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_demo)
        val textPass: String = intent.getStringExtra("textPass").toString()
        val editText1 = findViewById<EditText>(R.id.num1)
        val editText2 = findViewById<EditText>(R.id.num2)
        val btnAdd = findViewById<Button>(R.id.add)
        val btnMinus = findViewById<Button>(R.id.subtract)
        val btnMul = findViewById<Button>(R.id.multiply)
        val btnDiv = findViewById<Button>(R.id.div)
        val passDataView: TextView = findViewById<TextView>(R.id.passData)
        passDataView.text = textPass
        btnAdd.setOnClickListener {
            val num1Str = editText1.text.toString()
            val num2Str = editText2.text.toString()
            if (num1Str.isEmpty() || num2Str.isEmpty()) {
                // Handle the error case
                android.util.Log.d("AAA", num1Str.toString())
            } else {
                try {
                    // Convert the strings to numeric values
                    val num1 = num1Str.toInt()
                    val num2 = num2Str.toInt()

                    // Calculate the sum
                    val sum = num1 + num2

                    // Return the result to Flutter
                    val resultIntent = Intent()
                    resultIntent.putExtra("result", sum)
                    setResult(100, resultIntent)
                    android.util.Log.d("AAA", sum.toString())
                    finish()
                } catch (e: NumberFormatException) {
                    // Handle the error case
                }
            }
        }

        btnMinus.setOnClickListener {
            val num1Str = editText1.text.toString()
            val num2Str = editText2.text.toString()

            if (num1Str.isEmpty() || num2Str.isEmpty()) {
                // Handle the error case
                android.util.Log.d("AAA", num1Str.toString())
            } else {
                try {
                    // Convert the strings to numeric values
                    val num1 = num1Str.toInt()
                    val num2 = num2Str.toInt()
                    val subtract = num1 - num2
                    // Return the result to Flutter
                    val resultIntent = Intent()
                    resultIntent.putExtra("result", subtract)
                    setResult(100, resultIntent)
                    android.util.Log.d("AAA", subtract.toString())
                    finish()
                } catch (e: NumberFormatException) {
                    // Handle the error case
                }
            }
        }

        btnMul.setOnClickListener {
            val num1Str = editText1.text.toString()
            val num2Str = editText2.text.toString()
            if (num1Str.isEmpty() || num2Str.isEmpty()) {
                // Handle the error case
            } else {
                try {
                    // Convert the strings to numeric values
                    val num1 = num1Str.toInt()
                    val num2 = num2Str.toInt()
                    val multiply = num1 * num2
                    // Return the result to Flutter
                    val resultIntent = Intent()
                    resultIntent.putExtra("result", multiply)
                    setResult(100, resultIntent)
                    android.util.Log.d("AAA", multiply.toString())
                    finish()
                } catch (e: NumberFormatException) {
                    // Handle the error case
                }
            }
        }
        btnDiv.setOnClickListener {
            val num1Str = editText1.text.toString()
            val num2Str = editText2.text.toString()
            if (num1Str.isEmpty() || num2Str.isEmpty()) {
                // Handle the error case
            } else {
                try {
                    // Convert the strings to numeric values
                    val num1 = num1Str.toInt()
                    val num2 = num2Str.toInt()
                    if (num2 == 0) {
                        return@setOnClickListener
                    }
                    else {
                        val div = num1 / num2
                        // Return the result to Flutter
                        val resultIntent = Intent()
                        resultIntent.putExtra("result", div)
                        setResult(100, resultIntent)
                        finish()
                    }
                } catch (e: NumberFormatException) {
                    // Handle the error case
                }
            }
        }
    }
}