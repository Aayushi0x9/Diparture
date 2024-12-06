class VerseModel {
  int? chapterId, chapterNumber, externalId, id, verseNumber, verseOrder;

  String? text, title, transliteration, wordMeanings;

  VerseModel({
    this.chapterId,
    this.chapterNumber,
    this.externalId,
    this.id,
    this.text,
    this.title,
    this.verseNumber,
    this.verseOrder,
    this.transliteration,
    this.wordMeanings,
  });

  factory VerseModel.maptomodel({required Map<String, dynamic> m1}) {
    return VerseModel(
      chapterId: m1['chapter_id'],
      chapterNumber: m1['chapter_number'],
      externalId: m1['externalId'],
      id: m1['id'],
      text: m1['text'],
      title: m1['title'],
      verseNumber: m1['verse_number'],
      verseOrder: m1['verse_order'],
      transliteration: m1['transliteration'],
      wordMeanings: m1['word_meanings'],
    );
  }
}
