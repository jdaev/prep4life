import 'package:prep4life/app/course/models/creator.dart';
import 'package:prep4life/app/course/models/module.dart';

class Course {
  String courseName;
  String about;

  String documentId;
  String id;
  String imageLink;
  Creator creator;
  List<Module> modules = [];
  int studentCount;
  int lessonCount;
  String courseDuration;

  Course({
    String courseName,
    String about,
    String documentId,
    String id,
    String imageLink,
    Creator creator,
    List<Module> modules,
    int studentCount,
    int lessonCount,
    String courseDuration,
  });

  factory Course.fromMap(Map courseMap, String documentId) {
    List modules = [];
    for (Map moduleData in courseMap['modules']) {
      modules.add(Module().fromMap(moduleData));
    }

    return Course(
      courseName: courseMap['courseName'],
      about: courseMap['about'],
      id: courseMap['id'],
      imageLink: courseMap['imageLink'],
      creator: Creator().fromMap(courseMap['creator']),
      modules: modules,
      studentCount: courseMap['studentCount'],
      lessonCount: courseMap['lessonCount'],
      courseDuration: courseMap['courseDuration'],
      documentId: documentId,
    );
  }
}
