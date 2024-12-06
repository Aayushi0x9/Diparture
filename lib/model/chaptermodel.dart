class ChapterModel {
  int? chapterNumber, id, versesCount;
  String? chapterSummary,
      chapterSummaryHindi,
      img,
      imageName,
      name,
      nameMeaning,
      nameTranslation,
      nameTransliterated;

  ChapterModel({
    this.chapterNumber,
    this.chapterSummary,
    this.chapterSummaryHindi,
    this.id,
    this.img,
    this.imageName,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.nameTransliterated,
    this.versesCount,
  });

  factory ChapterModel.maptomodel({required Map<String, dynamic> m1}) {
    return ChapterModel(
      chapterNumber: m1['chapter_number'],
      chapterSummary: m1['chapter_summary'],
      chapterSummaryHindi: m1['chapter_summary_hindi'],
      id: m1['id'],
      img: m1['img'],
      imageName: m1['image_name'],
      name: m1['name'],
      nameMeaning: m1['name_meaning'],
      nameTranslation: m1['name_translation'],
      nameTransliterated: m1['name_transliterated'],
      versesCount: m1['verses_count'],
    );
  }
}
