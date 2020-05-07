import 'dart:async';

import 'package:meta/meta.dart';
import 'package:prep4life/app/course/models/course.dart';
import 'package:prep4life/services/firestore_path.dart';
import 'package:prep4life/services/firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Stream<Course> courseStream({@required String courseId}) =>
      _service.documentStream(
        path: FirestorePath.course(courseId),
        builder: (data, documentId) => Course.fromMap(data, documentId),
      );

  Stream<List<Course>> coursesStream() => _service.collectionStream(
        path: FirestorePath.courses(),
        builder: (data, documentId) {
          return Course.fromMap(data, documentId);
        },
      );

  Stream<Course> enrolledCourseStream({@required String courseId}) =>
      _service.documentStream(
        path: FirestorePath.enrolledCourse(uid, courseId),
        builder: (data, documentId) => Course.fromMap(data, documentId),
      );

  Stream<List<Course>> enrolledCoursesStream() => _service.collectionStream(
        path: FirestorePath.enrolledCourses(uid),
        builder: (data, documentId) => Course.fromMap(data, documentId),
      );

  // Stream<List<Entry>> entriesStream({Course course}) =>
  //     _service.collectionStream<Entry>(
  //       path: FirestorePath.entries(uid),
  //       queryBuilder: course != null
  //           ? (query) => query.where('courseId', isEqualTo: course.id)
  //           : null,
  //       builder: (data, documentID) => Entry.fromMap(data, documentID),
  //       sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
  //     );
}
