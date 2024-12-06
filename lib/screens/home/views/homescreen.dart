import 'package:diparture/controller/chaptercontroller.dart';
import 'package:diparture/controller/data_controller.dart';
import 'package:diparture/controller/theme_controller.dart';
import 'package:diparture/controller/versescontroller.dart';
import 'package:diparture/model/chaptermodel.dart';
import 'package:diparture/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    VersesController lisenableR = Provider.of<VersesController>(context);
    DataController dataControllerR =
        Provider.of<DataController>(context, listen: true);
    DataController dataControllerW =
        Provider.of<DataController>(context, listen: false);
    ThemeController themeControllerW = Provider.of<ThemeController>(context);
    ThemeController themeControllerR = Provider.of<ThemeController>(context);
    ChapterController chapterControllerW =
        Provider.of<ChapterController>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Bhagwat Gita'),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       chapterControllerW.loadChapter();
            //     },
            //     icon: const Icon(Icons.refresh)),
            IconButton(
              onPressed: () {
                dataControllerR.onChangeLanguage();
              },
              icon: const Icon(
                Icons.language,
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     themeControllerR.toggleTheme();
            //   },
            //   icon: Icon(
            //     themeControllerW.isDark
            //         ? Icons.light_mode
            //         : Icons.dark_mode_rounded,
            //   ),
            // )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //     image: NetworkImage(
              //       "https://gitauniversity.in/wp-content/uploads/2021/08/dsada.jpg",
              //     ),
              //     fit: BoxFit.cover),
              ),
          child: chapterControllerW.allChapter.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: chapterControllerW.allChapter.length,
                  itemBuilder: (context, index) {
                    ChapterModel chapter = chapterControllerW.allChapter[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.detail,
                            arguments: index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        height: size.height * 0.22,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.chinmayakids.org/wp-content/themes/twentyfifteen/images/lightbox/gcc-background.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          // color: Colors.yellow.shade100
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundImage: AssetImage(
                                  '${chapterControllerW.allChapter[index].img}'),
                            ),
                            const SizedBox(
                              height: 0.1,
                            ),
                            Text(
                              dataControllerW.isHindi
                                  ? '---------------------- अध्याय ${index + 1} ---------------------------'
                                  : '--------------------- Chapter ${index + 1} ---------------------',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              dataControllerW.isHindi
                                  ? '|| ${chapterControllerW.allChapter[index].name} ||'
                                  : '|| ${chapterControllerW.allChapter[index].nameTranslation} ||',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.menu_book),
                                Text(
                                  dataControllerW.isHindi
                                      ? " ${chapter.versesCount} श्लोक "
                                      : " ${chapter.versesCount} Verses",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                    // ListTile(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, AppRoutes.detail,
                    //         arguments: index);
                    //   },
                    //   leading: const CircleAvatar(
                    //     child: Icon(Icons.menu_book),
                    //   ),
                    //   title: Text(dataControllerW.isHindi
                    //       ? '${chapterControllerW.allChapter[index].name}'
                    //       : '${chapterControllerW.allChapter[index].nameTransliterated}'),
                    //   subtitle: Text(dataControllerW.isHindi
                    //       ? "${chapter.versesCount} श्लोक "
                    //       : "${chapter.versesCount} Verses"),
                    // );
                  },
                ),
        ));
  }
}
