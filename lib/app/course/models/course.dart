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
  }) {
    this.courseName = courseName;
    this.about = about;
    this.documentId = documentId;
    this.id = id;
    this.imageLink = imageLink;
    this.creator = creator;
    this.modules = modules;
    this.studentCount = studentCount;
    this.lessonCount = lessonCount;
    this.courseDuration = courseDuration;
  }

  factory Course.fromMap(Map courseMap, String documentId) {
    List<Module> modules = [];
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
