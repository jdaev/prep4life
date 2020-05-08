import 'package:flutter/material.dart';
import 'package:prep4life/app/course/models/course.dart';
import 'package:prep4life/routing/router.dart';

import 'models/lesson.dart';

class LessonPage extends StatefulWidget {
  final Course course;
  final int moduleIndex;
  final int lessonIndex;

  const LessonPage({Key key, this.course, this.moduleIndex, this.lessonIndex})
      : super(key: key);

  static Future<void> show(
      BuildContext context, Map<String, dynamic> args) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Routes.lessonPage,
      arguments: args,
    );
  }

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    Lesson _lesson =
        widget.course.modules[widget.moduleIndex].lessons[widget.lessonIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(_lesson.lessonName),
      ),
    );
  }
}
