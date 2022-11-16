import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../widgets/toast.dart';

class OtpPageController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  bool hasError = false;
  String otp = "";
  var argumentData = Get.arguments;
  late Timer timer;
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 30;
  int currentSeconds = 0;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  TextEditingController pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) {
        ToastManager.errorToast("Time Out Please send Again!");
        timer.cancel();
      }
      update();
    });
  }

  @override
  void onInit() {
    otp = argumentData[0]["otp"];
    startTimeout();
    update();

    // initSpeech();
    // pinController.text= speechToText.isListening ? '$lastWords' : speechEnabled ? '' : '';
    super.onInit();
  }

  /// This has to happen only once per app
  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    update();
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    update();
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    await speechToText.stop();
    update();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    update();
  }

  @override
  void dispose() {
    timer.cancel();
    ToastManager();
    update();
    super.dispose();
  }
}
