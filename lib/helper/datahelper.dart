import 'dart:convert';

import 'package:diparture/model/versesmodel.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<VerseModel>> verseJsonParsing() async {
    String res = await rootBundle.loadString('assets/json_files/verses.json');
    List allData = jsonDecode(res);
    List<VerseModel> allVerse =
        allData.map((e) => VerseModel.maptomodel(m1: e)).toList();
    return allVerse;
  }
}
