import 'package:diparture/helper/datahelper.dart';
import 'package:diparture/model/versesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VersesController extends ChangeNotifier {
  FlutterTts flutterTts = FlutterTts();
  List<VerseModel> allVerse = [];
  void speak(String text) {
    flutterTts.speak(text);
    notifyListeners();
  }

  void stopTTS() async {
    await flutterTts.stop();
    notifyListeners();
  }

  Future<void> loadVersesJson() async {
    JsonHelper jsonHelper = JsonHelper();
    allVerse = await jsonHelper.verseJsonParsing();
    print('=====================${allVerse}');
    notifyListeners();
  }
}
