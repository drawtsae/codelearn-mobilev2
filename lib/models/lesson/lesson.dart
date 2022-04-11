class Lesson {
  String? id;
  String? title;
  String? slug;
  String? summary;
  num? sortPriority;
  num? lessonLevel;
  bool? isComplete;
  bool? isActive;

  Lesson(
      {this.id,
      this.title,
      this.slug,
      this.summary,
      this.sortPriority,
      this.lessonLevel,
      this.isComplete,
      this.isActive});
}
