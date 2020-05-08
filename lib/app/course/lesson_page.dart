import 'package:flutter/material.dart';
import 'package:prep4life/app/course/models/course.dart';

class LessonPage extends StatefulWidget {
  final Course course;
  final int moduleIndex;
  final int lessonIndex;

  const LessonPage({Key key, this.course, this.moduleIndex, this.lessonIndex})
      : super(key: key);
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
