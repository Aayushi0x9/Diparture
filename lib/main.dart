import 'package:diparture/controller/chaptercontroller.dart';
import 'package:diparture/controller/data_controller.dart';
import 'package:diparture/controller/theme_controller.dart';
import 'package:diparture/controller/versescontroller.dart';
import 'package:diparture/helper/app_theme.dart';
import 'package:diparture/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VersesController()),
        ChangeNotifierProvider(create: (_) => ChapterController()),
        ChangeNotifierProvider(create: (_) => DataController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeController>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      routes: AppRoutes.routes,
    );
  }
}
