import 'package:diparture/controller/chaptercontroller.dart';
import 'package:diparture/controller/data_controller.dart';
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
  void initState() {
    super.initState();
    context.read<ChapterController>().loadChapter();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DataController dataControllerR =
        Provider.of<DataController>(context, listen: true);
    DataController dataControllerW =
        Provider.of<DataController>(context, listen: false);
    ChapterController chapterControllerW =
        Provider.of<ChapterController>(context, listen: false);
    ChapterController chapterControllerR =
        Provider.of<ChapterController>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/home_bg.jpeg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        chapterControllerR.loadChapter();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      dataControllerW.isHindi
                          ? "श्रीमद् भगवद् गीता"
                          : 'Bhagawad Gita',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {},
                          child: const Text(
                            "Language",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            dataControllerR.onChangeLanguage(false);
                          },
                          child: const Text(
                            "English",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            dataControllerR.onChangeLanguage(true);
                          },
                          child: const Text(
                            "Hindi",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 0) {
                          dataControllerR.onChangeLanguage(value);
                        }
                        if (value == 1) {
                          dataControllerR.onChangeLanguage(value);
                        }
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              chapterControllerW.allChapter.isEmpty
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: chapterControllerW.allChapter.length,
                        itemBuilder: (context, index) {
                          ChapterModel chapter =
                              chapterControllerW.allChapter[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.detail,
                                  arguments: index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 20),
                              height: size.height * 0.22,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                                border: Border.all(
                                  color: Colors.white,
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
                                        ? '------------------ अध्याय ${index + 1} --------------------'
                                        : '--------------------- Chapter ${index + 1} ---------------------',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    dataControllerW.isHindi
                                        ? '|| ${chapterControllerW.allChapter[index].name} ||'
                                        : '|| ${chapterControllerW.allChapter[index].nameTranslation} ||',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.menu_book_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        dataControllerW.isHindi
                                            ? " ${chapter.versesCount} श्लोक "
                                            : " ${chapter.versesCount} Verses",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
