import 'package:prep4life/app/course/models/lesson.dart';

class Module {
  String moduleName;
  List<Lesson> lessons = [];

  Module();

  Module fromMap(moduleMap) {
    this.moduleName = moduleMap['moduleName'];
    for (Map lessonMap in moduleMap['lesson']) {
      this.lessons.add(Lesson().fromMap(lessonMap));
    }
    return this;
  }
  
}
