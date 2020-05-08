import 'package:flutter/material.dart';
import 'package:prep4life/app/course/course_page.dart';
import 'package:prep4life/app/course/models/course.dart';

class CourseFeedItem extends StatelessWidget {
  final Course course;

  const CourseFeedItem({Key key, this.course}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CoursePage.show(context, course: course),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: Image.network(course.imageLink),
            ),
            Text(course.courseName),
          ],
        ),
      ),
    );
  }
}
