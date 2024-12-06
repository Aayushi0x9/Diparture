import 'package:diparture/helper/datahelper.dart';
import 'package:diparture/model/versesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VersesController extends ChangeNotifier {
  List<VerseModel> allVerse = [];
  List<VerseModel> allChVerse = [];

  VersesController() {
    loadVersesJson();
  }

  FlutterTts flutterTts = FlutterTts();

  void speak(String text) {
    flutterTts.speak(text);
    notifyListeners();
  }

  void stopTTS() async {
    await flutterTts.stop();
    notifyListeners();
  }

  void nextPage({required int data}) {
    data++;
    notifyListeners();
  }

  Future<void> loadVersesJson() async {
    JsonHelper jsonHelper = JsonHelper();
    allVerse = await jsonHelper.verseJsonParsing();
    print('=====================${allVerse}');
    notifyListeners();
  }

  addChapter(int index, int chIndex) {
    if (index == chIndex) {
      allChVerse.add(allVerse[index]);
    }
    notifyListeners();
  }
}
