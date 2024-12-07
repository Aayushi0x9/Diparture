import 'dart:io';
import 'dart:ui' as ui;

import 'package:diparture/controller/data_controller.dart';
import 'package:diparture/controller/versescontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({super.key});

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  String copyText = '';
  GlobalKey widgetKey = GlobalKey();
  Widget saveChild = const Icon(Icons.save_alt_rounded);
  // image save
  Future<File> share() async {
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 25,
    );
    ByteData? bytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List uInt8list = bytes!.buffer.asUint8List();

    final Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA-${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(uInt8list);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    DataController dataControllerR =
        Provider.of<DataController>(context, listen: true);
    DataController dataControllerW =
        Provider.of<DataController>(context, listen: false);
    int ind = ModalRoute.of(context)?.settings.arguments as int;
    VersesController versesControllerW =
        Provider.of<VersesController>(context, listen: false);

    VersesController versesControllerR =
        Provider.of<VersesController>(context, listen: true);

    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/home_bg.jpeg',
                ),
                fit: BoxFit.cover),
            color: Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: PageView.builder(
                controller: PageController(
                  initialPage: ind,
                ),
                itemCount: versesControllerW.allVerse.length,
                reverse: true,
                itemBuilder: (context, index) {
                  copyText = dataControllerW.isHindi
                      ? '${versesControllerW.allVerse[index].text}${versesControllerW.allVerse[index].transliteration}'
                      : '${versesControllerW.allVerse[index].transliteration}'
                          '${versesControllerW.allVerse[index].wordMeanings}';
                  return RepaintBoundary(
                    key: widgetKey,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 80),
                      height: size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  versesControllerR.speak(
                                    dataControllerW.isHindi
                                        ? '${versesControllerW.allVerse[index].text}'
                                        : '${versesControllerW.allVerse[index].transliteration}',
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SelectableText(
                              dataControllerW.isHindi
                                  ? '${versesControllerW.allVerse[index].text}'
                                  : '${versesControllerW.allVerse[index].transliteration}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SelectableText(
                              dataControllerW.isHindi
                                  ? '${versesControllerW.allVerse[index].transliteration}'
                                  : '${versesControllerW.allVerse[index].wordMeanings}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          Colors.black.withOpacity(0.3),
                        )),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: copyText));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                content: Text("Copied to clipboard!")),
                          );
                        },
                        icon: const Icon(
                          Icons.copy_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Copy',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                            Colors.black.withOpacity(0.3),
                          )),
                          icon: const Icon(Icons.share),
                          color: Colors.white,
                          onPressed: () async {
                            File file = await share();
                            ShareExtend.share(
                              file.path,
                              "file",
                            );
                          }),
                      const Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          Colors.black.withOpacity(0.3),
                        )),
                        icon: const Icon(Icons.download),
                        color: Colors.white,
                        onPressed: () async {
                          setState(() {});
                          File file = await share();
                          await ImageGallerySaver.saveFile(file.path).then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text('Saved to Gallery'),
                              ),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                      const Text(
                        'Download',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
