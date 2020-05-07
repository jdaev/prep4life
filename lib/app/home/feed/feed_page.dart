import 'package:flutter/material.dart';
import 'package:prep4life/app/course/models/course.dart';
import 'package:prep4life/app/home/feed/course_feed_item.dart';
import 'package:prep4life/constants/strings.dart';
import 'package:prep4life/services/firestore_database.dart';
import 'package:provider/provider.dart';

import 'course_list_builder.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.courses),
      ),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<FirestoreDatabase>(context, listen: false);
    return StreamBuilder<List<Course>>(
      stream: database.coursesStream(),
      builder: (context, snapshot) {
        
        return ListItemsBuilder<Course>(
          snapshot: snapshot,
          itemBuilder: (context, course) => Dismissible(
            key: Key('course-${course.id}'),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            child: CourseFeedItem(
              course: course,
            ),
          ),
        );
      },
    );
  }
}
