import 'package:flutter/material.dart';
import 'package:prep4life/app/course/models/lesson.dart';
import 'package:prep4life/routing/router.dart';

import 'models/course.dart';

class CoursePage extends StatefulWidget {
  final Course course;

  const CoursePage({Key key, this.course}) : super(key: key);

  static Future<void> show(BuildContext context, {Course course}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Routes.coursePage,
      arguments: course,
    );
  }

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) => [
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Image.network(
                        widget.course.imageLink,
                        fit: BoxFit.fitWidth,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.all(4),
                          height: 32,
                          width: 32,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () => Navigator.pop(context)),
                        ),
                      )
                    ],
                  ),
                  TabBar(labelColor: Colors.black87, tabs: [
                    Tab(
                      text: 'Lesson',
                    ),
                    Tab(
                      text: 'About',
                    ),
                    Tab(
                      text: 'Comments',
                    ),
                  ]),
                ],
              ),
            )
          ],
          body: TabBarView(children: [
            _buildLessonTab(),
            _buildAboutTab(),
            _buildCommentTab(),
          ]),
        ),
      ),
    );
  }

  Widget _buildLessonTab() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.course.modules[index].moduleName),
            ),
            for (Lesson lesson in widget.course.modules[index].lessons)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Text(lesson.lessonName),
              )
          ],
        );
      },
      itemCount: widget.course.modules.length,
    );
  }

  Widget _buildAboutTab() {
    return Text(widget.course.about);
  }

  Widget _buildCommentTab() {
    return Text('Comments');
  }
}
