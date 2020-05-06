import 'package:prep4life/app/course/models/quiz.dart';

class Lesson {
  String lessonName;
  String videoLink;
  List<Question> quiz = [];
  Lesson();

  Lesson fromMap(Map lessonMap) {
    this.lessonName = lessonMap['lessonName'];
    this.videoLink = lessonMap['videoLink'];
    for (Map question in lessonMap['quiz']) {
      this.quiz.add(Question().fromMap(question));
    }
    return this;
  }
}
