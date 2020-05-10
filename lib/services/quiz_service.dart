import 'package:flutter/cupertino.dart';
import 'package:prep4life/services/firestore_service.dart';

class QuizService {
  QuizService._();
  static final instance = QuizService._();
  final _firestoreService = FirestoreService.instance;

  Future<void> firstQuiz({
    @required Map enrollCourseData,
    @required Map quizResults,
    @required currentModule,
    @required currentLesson,
    bool merge = false,
  }) {

  }

  Future<void> saveQuizResult({
    @required Map enrollCourseData,
    @required Map quizResults,
    @required currentModule,
    @required currentLesson,
    bool merge = false,
  }){

  }

  
}
