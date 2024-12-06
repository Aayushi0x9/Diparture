import 'dart:convert';

import 'package:diparture/model/versesmodel.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<VerseModel>> verseJsonParsing() async {
    String res = await rootBundle.loadString('assets/json_files/verses.json');
    List allData = jsonDecode(res);
    print('8888888888$allData');
    List<VerseModel> allVerse =
        allData.map((e) => VerseModel.maptomodel(m1: e)).toList();
    print('=====================${allVerse}');
    return allVerse;
  }
}
