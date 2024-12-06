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
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ChapterController chapterControllerW =
        Provider.of<ChapterController>(context, listen: false);
    VersesController versesControllerW =
        Provider.of<VersesController>(context, listen: false);
    DataController dataControllerR =
        Provider.of<DataController>(context, listen: true);
    DataController dataControllerW =
        Provider.of<DataController>(context, listen: false);
    VersesController versesControllerR =
        Provider.of<VersesController>(context, listen: true);
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(dataControllerW.isHindi
            ? '${chapterControllerW.allChapter[ind].name}'
            : '${chapterControllerW.allChapter[ind].nameTranslation}'),
        actions: [
          IconButton(
              onPressed: () {
                String hindiText =
                    "${chapterControllerW.allChapter[ind].chapterNumber}${chapterControllerW.allChapter[ind].name}${chapterControllerW.allChapter[ind].chapterSummaryHindi}";
                String englishText =
                    "${chapterControllerW.allChapter[ind].chapterNumber}${chapterControllerW.allChapter[ind].nameTranslation}${chapterControllerW.allChapter[ind].chapterSummary}";
                versesControllerR
                    .speak(dataControllerW.isHindi ? hindiText : englishText);
              },
              icon: Icon(Icons.volume_up_outlined))
        ],
      ),
      body: PageView.builder(
        itemCount: chapterControllerW.allChapter.length,
        onPageChanged: (value) {},
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white60,
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.chinmayakids.org/wp-content/themes/twentyfifteen/images/lightbox/gcc-background.jpg",
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: SingleChildScrollView(
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
                        height: size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  dataControllerW.images[ind][index])),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset(dataControllerW.images[ind][index]),
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      height: size.height * 0.08,
                      width: double.infinity,
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
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dataControllerW.isHindi
                                ? '${chapterControllerW.allChapter[ind].name}'
                                : '${chapterControllerW.allChapter[ind].nameTranslation}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                String hindiText =
                                    "${chapterControllerW.allChapter[ind].name}";
                                String englishText =
                                    "${chapterControllerW.allChapter[ind].nameTranslation}";
                                versesControllerR.speak(dataControllerW.isHindi
                                    ? hindiText
                                    : englishText);
                              },
                              icon: Icon(Icons.volume_up_outlined))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dataControllerW.isHindi ? 'सारांश :-' : 'Summary :-',
                          style: const TextStyle(
                            fontSize: 22,
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
                            icon: Icon(Icons.volume_up_outlined))
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      width: double.infinity,
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
                      ),
                      child: Text(
                        dataControllerW.isHindi
                            ? '${chapterControllerW.allChapter[ind].chapterSummaryHindi}'
                            : '${chapterControllerW.allChapter[ind].chapterSummary}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      dataControllerW.isHindi ? "श्लोक :-" : "Verses:-",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    ...List.generate(
                      versesControllerW.allVerse.length,
                      (index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          height: size.height * 0.1,
                          width: double.infinity,
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
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.verses,
                                  arguments: index);
                            },
                            trailing: Icon(Icons.arrow_forward_ios),
                            leading: CircleAvatar(
                              // backgroundColor: Colors.orangeAccent,
                              backgroundImage: NetworkImage(
                                  "https://www.chinmayakids.org/wp-content/themes/twentyfifteen/images/lightbox/gcc-background.jpg"),
                              child: Icon(Icons.menu_book),
                            ),
                            title: Text(
                              dataControllerW.isHindi
                                  ? "श्लोक ${index + 1} "
                                  : "Verses ${index + 1}",
                              style: const TextStyle(
                                  color: Colors.black,
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
          );
        },
      ),
    );
  }
}
