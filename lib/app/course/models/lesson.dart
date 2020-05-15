import 'package:prep4life/app/course/models/quiz.dart';

class Lesson {
  String lessonName;
  String videoLink;
  String videoId;
  List<Question> quiz = [];
  Lesson();

  Lesson fromMap(Map lessonMap) {
    this.lessonName = lessonMap['lessonName'];
    this.videoLink = lessonMap['videoLink'];
    this.videoId = lessonMap['videoId'];
    for (Map question in lessonMap['quiz']) {
      this.quiz.add(Question().fromMap(question));
    }
    return this;
  }
  
}
