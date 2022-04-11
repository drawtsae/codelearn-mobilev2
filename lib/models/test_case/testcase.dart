class TestCase {
  String? id;
  String? lessonId;
  num? sortPriority;
  String? inputData;
  String? expectedOutput;
  num? timeLimit;
  bool? isActive;

  TestCase({
    this.id,
    this.lessonId,
    this.sortPriority,
    this.inputData,
    this.expectedOutput,
    this.timeLimit,
    this.isActive,
  });
}
