import 'package:diparture/screens/details/details_screen.dart';
import 'package:diparture/screens/home/views/homescreen.dart';
import 'package:diparture/screens/verses/verses_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = 'detail';
  static const String verses = 'verses';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.detail: (context) => const DetailsScreen(),
    AppRoutes.verses: (context) => const VersesScreen()
  };
}
