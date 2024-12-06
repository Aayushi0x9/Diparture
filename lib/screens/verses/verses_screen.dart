import 'package:diparture/controller/chaptercontroller.dart';
import 'package:diparture/controller/versescontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({super.key});

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    int ind = ModalRoute.of(context)?.settings.arguments as int;
    VersesController versesControllerW =
        Provider.of<VersesController>(context, listen: false);
    ChapterController chapterControllerW =
        Provider.of<ChapterController>(context, listen: false);
    VersesController versesControllerR =
        Provider.of<VersesController>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Verses'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.chinmayakids.org/wp-content/themes/twentyfifteen/images/lightbox/gcc-background.jpg"),
                fit: BoxFit.fitHeight),
          ),
          child: PageView.builder(
            controller: PageController(
              initialPage: ind,
            ),
            itemCount: versesControllerW.allVerse.length,
            reverse: true,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                height: size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  image: DecorationImage(
                    image: AssetImage(
                      "${chapterControllerW.allChapter[ind].img}",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Text('${versesControllerW.allVerse[index].text}'),
              );

              //   Column(
              //     children: [
              //       Text('${versesControllerW.allVerse[index].text}'),
              //       Text('${versesControllerW.allVerse[index].transliteration}'),
              //       Text('${versesControllerW.allVerse[index].wordMeanings}'),
              //     ],
              //   ),
              // );
            },
          ),
        ));
  }
}
