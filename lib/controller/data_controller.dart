import 'package:diparture/model/versesmodel.dart';
import 'package:flutter/material.dart';

class DataController with ChangeNotifier {
  bool isHindi = false;
  List allFavorite = [];
  bool isFavorite = false;
  int currentIndex = 0;

  void onChangeLanguage() {
    isHindi = !isHindi;
    notifyListeners();
  }

  void addFavourite({required VerseModel data}) {
    allFavorite.add(data);
    notifyListeners();
  }

  void deleteData({required int index}) {
    allFavorite.removeAt(index);
    notifyListeners();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<List> images = [
    [
      "assets/images/ch_1(1).jpg",
      "assets/images/ch_1(2).jpg",
      "assets/images/ch_1(3).jpg",
    ],
    [
      "assets/images/ch_2(1).jpg",
      "assets/images/ch_2(2).jpg",
      "assets/images/ch_2(3).jpg",
    ],
    [
      "assets/images/ch_3(1).jpg",
      "assets/images/ch_3(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_4(1).jpg",
      "assets/images/ch_4(2).jpg",
      "assets/images/ch_4(3).jpg",
    ],
    [
      "assets/images/ch_5(1).jpg",
      "assets/images/ch_5(2).jpg",
      "assets/images/ch_5(3).jpg",
    ],
    [
      "assets/images/ch_6(1).jpg",
      "assets/images/ch_6(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_7(1).jpg",
      "assets/images/ch_7(2).jpg",
      "assets/images/ch_2(2).jpg",
    ],
    [
      "assets/images/ch_8(1).jpg",
      "assets/images/ch_8(2).jpg",
      "assets/images/ch_8(3).jpg",
    ],
    [
      "assets/images/ch_9(1).jpg",
      "assets/images/ch_9(2).jpg",
      "assets/images/ch_9(3).jpg",
    ],
    [
      "assets/images/ch_10(1).jpg",
      "assets/images/ch_10(2).jpg",
      "assets/images/ch_10(3).jpg",
    ],
    [
      "assets/images/ch_11(1).jpg",
      "assets/images/ch_11(2).jpg",
      "assets/images/ch_11(3).jpg",
    ],
    [
      "assets/images/ch_12(1).jpg",
      "assets/images/ch_12(2).jpg",
      "assets/images/ch_12(3).jpg",
      "assets/images/ch_12(4).jpg",
    ],
    [
      "assets/images/ch_13(1).jpg",
      "assets/images/ch_13(2).jpg",
      "assets/images/ch_13(3).jpg",
    ],
    [
      "assets/images/ch_14(1).jpg",
      "assets/images/ch_14(2).jpg",
      "assets/images/ch_14(3).jpg",
    ],
    [
      "assets/images/ch_15(1).jpg",
      "assets/images/ch_15(2).jpg",
    ],
    [
      "assets/images/ch_16(1).jpg",
      "assets/images/ch_16(2).jpg",
      "assets/images/ch_16(3).jpg",
    ],
    [
      "assets/images/ch_17(1).jpg",
      "assets/images/ch_17(2).jpg",
      "assets/images/ch_17(3).jpg",
    ],
    [
      "assets/images/ch_18(1).jpg",
      "assets/images/ch_18(2).jpg",
      "assets/images/ch_18(3).jpg",
    ],
  ];
}
