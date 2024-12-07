import 'package:carousel_slider/carousel_slider.dart';
import 'package:diparture/controller/chaptercontroller.dart';
import 'package:diparture/controller/data_controller.dart';
import 'package:diparture/controller/versescontroller.dart';
import 'package:diparture/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VersesController>().loadVersesJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ChapterController chapterControllerW =
        Provider.of<ChapterController>(context, listen: false);
    VersesController versesControllerW =
        Provider.of<VersesController>(context, listen: false);
    DataController dataControllerW =
        Provider.of<DataController>(context, listen: false);
    DataController dataControllerR =
        Provider.of<DataController>(context, listen: true);
    VersesController versesControllerR =
        Provider.of<VersesController>(context, listen: true);
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home_bg.jpeg',
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
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        versesControllerR.stopTTS();
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 30,
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        String hindiText =
                            "${chapterControllerW.allChapter[ind].chapterNumber}${chapterControllerW.allChapter[ind].name}${chapterControllerW.allChapter[ind].chapterSummaryHindi}";
                        String englishText =
                            "${chapterControllerW.allChapter[ind].chapterNumber}${chapterControllerW.allChapter[ind].nameTranslation}${chapterControllerW.allChapter[ind].chapterSummary}";
                        versesControllerR.speak(
                            dataControllerW.isHindi ? hindiText : englishText);
                      },
                      icon: const Icon(
                        Icons.volume_up_outlined,
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
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                          itemCount: dataControllerW.images[ind].length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            height: size.height * 0.15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      dataControllerW.images[ind][itemIndex]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            aspectRatio: 1.5,
                            // initialPage: 2,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Text(
                          dataControllerW.isHindi ? 'अध्याय :-' : 'Chapter :-',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          height: size.height * 0.08,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black26,
                                child: Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                ),
                              ),
                              SelectableText(
                                dataControllerW.isHindi
                                    ? '${chapterControllerW.allChapter[ind].name}'
                                    : '${chapterControllerW.allChapter[ind].nameTranslation}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    String hindiText =
                                        "${chapterControllerW.allChapter[ind].name}";
                                    String englishText =
                                        "${chapterControllerW.allChapter[ind].nameTranslation}";
                                    versesControllerR.speak(
                                        dataControllerW.isHindi
                                            ? hindiText
                                            : englishText);
                                  },
                                  icon: const Icon(
                                    Icons.volume_up_outlined,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dataControllerW.isHindi
                                  ? 'सारांश :-'
                                  : 'Summary :-',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                String hindiText =
                                    "${chapterControllerW.allChapter[ind].chapterSummaryHindi}";
                                String englishText =
                                    "${chapterControllerW.allChapter[ind].chapterSummary}";
                                versesControllerR.speak(dataControllerW.isHindi
                                    ? hindiText
                                    : englishText);
                              },
                              icon: const Icon(
                                Icons.volume_up_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: SelectableText(
                            dataControllerW.isHindi
                                ? '${chapterControllerW.allChapter[ind].chapterSummaryHindi}'
                                : '${chapterControllerW.allChapter[ind].chapterSummary}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          dataControllerW.isHindi ? "श्लोक :-" : "Verses:-",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        ...List.generate(
                          versesControllerW.allVerse.length,
                          (index) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              height: size.height * 0.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.verses,
                                      arguments: index);
                                },
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  child: Icon(
                                    Icons.menu_book,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  dataControllerW.isHindi
                                      ? "श्लोक ${index + 1} "
                                      : "Verses ${index + 1}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
