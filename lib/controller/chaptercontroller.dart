import 'dart:convert';

import 'package:diparture/model/chaptermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChapterController extends ChangeNotifier {
  List<ChapterModel> allChapter = [];

  // ChapterController() {
  //   loadChapter();
  // }

  Future<void> loadChapter() async {
    String res = await rootBundle.loadString('assets/json_files/chapter.json');
    List allData = jsonDecode(res);
    allChapter = allData.map((e) => ChapterModel.maptomodel(m1: e)).toList();
    notifyListeners();
  }
}
