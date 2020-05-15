import 'package:flutter/material.dart';
import 'package:prep4life/app/course/lesson_page.dart';
import 'package:prep4life/app/course/models/lesson.dart';
import 'package:prep4life/routing/router.dart';
import 'package:prep4life/services/firestore_database.dart';
import 'package:provider/provider.dart';

import 'models/course.dart';

class SavedCoursePage extends StatefulWidget {
  final String courseId;

  const SavedCoursePage({Key key, this.courseId}) : super(key: key);

  static Future<void> show(BuildContext context, {Course course}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Routes.coursePage,
      arguments: course,
    );
  }

  @override
  _SavedCoursePageState createState() => _SavedCoursePageState();
}

class _SavedCoursePageState extends State<SavedCoursePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<FirestoreDatabase>(context, listen: false);

    return Scaffold(
      body: StreamBuilder<Course>(
          stream: database.courseStream(courseId: 'mgGgTwlvna9WllA8nIW5'),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return DefaultTabController(
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
                                snapshot.data.imageLink,
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
                    _buildLessonTab(snapshot.data),
                    _buildAboutTab(snapshot.data),
                    _buildCommentTab(snapshot.data),
                  ]),
                ),
              );
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }

  Widget _buildLessonTab(Course course) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(course.modules[index].moduleName),
            ),
            for (Lesson lesson in course.modules[index].lessons)
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: ListTile(
                    title: Text(lesson.lessonName),
                    onTap: () => LessonPage.show(context, {
                      'course': course,
                      'lessonIndex':
                          course.modules[index].lessons.indexOf(lesson),
                      'moduleIndex': index,
                    }),
                  ))
          ],
        );
      },
      itemCount: course.modules.length,
    );
  }

  Widget _buildAboutTab(Course course) {
    return Text(course.about);
  }

  Widget _buildCommentTab(Course course) {
    return Text('Comments');
  }
}
