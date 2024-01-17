// second_page.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SecondPage extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speakText(String text) async {
  await flutterTts.setLanguage("hi-IN"); // Set the language to Hindi
  await flutterTts.setSpeechRate(0.5); // Adjust the speech rate as needed
  await flutterTts.setPitch(1.0); // Adjust the pitch as needed
  Completer<void> completer = Completer<void>();

    flutterTts.setCompletionHandler(() {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    await flutterTts.speak(text);

    // Wait for the completion callback before starting the next iteration
    await completer.future;

    // Recursively call speakText to play the text continuously
    await speakText(text);
  }
  final TextEditingController _numberCtrl = TextEditingController(text: "9797845448");
  bool isSpeaking = false; // Track whether TTS is currently speaking
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(

      child: Container(
        color: Colors.blue, // Set the background color of the main content area
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              const Center(
                child: Text(
                  "DIGITAL DOLLAR",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 106.0,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Your Phone is Locked",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Written Text Code 
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "आपका फ़ोन लॉक हो गया है क्योंकि आपने नियत तिथि तक अपनी किस्त का भुगतान नहीं किया है। अपने फोन को अनलॉक करने के लिए, अनिल डॉलर, डोलर इन्फोटेक, नीमच को कॉल करें  \n\n"
                      "Your Phone has been locked as you didn't repay your installment by the due date. To unlock your Phone, call ANIL DOLLOR, DOLLOR INFOTECH, Neemuch.",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // Text to Speak Code
              const SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () async {
                    if (!isSpeaking) {
                      // Start speaking only if TTS is not already in progress
                      isSpeaking = true;
                      await speakText(
                        "आपका फ़ोन लॉक हो गया है क्योंकि आपने नियत तिथि तक अपनी किस्त का भुगतान नहीं किया है। अपने फोन को अनलॉक करने के लिए, अनिल डॉलर, डोलर इन्फोटेक, नीमच को कॉल करें\n\nYour Phone has been locked as you didn't repay your installment by the due date. To unlock your Phone, call ANIL DOLLOR, DOLLOR INFOTECH, Neemuch.",
                      );
                      isSpeaking = false; // Reset the flag after speaking is done
                    }
                  },
                  child: Container(
                    // ... button styling ...
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8.0),
                          Text(
                            "Speak",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16.0),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8.0),
                            Text(
                              "Pay OutStanding/EMI \n Amount",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),

                      ),
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.red,
                              size: 25.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "9797845448" " " "Call",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                      onPressed: () async {
                        FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                      },
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color of the red box
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/dolfin.png',
                      width:350,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}