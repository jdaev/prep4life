import 'package:flutter/material.dart';
import 'package:prep4life/app/auth_widget.dart';
import 'package:prep4life/app/course/course_page.dart';
import 'package:prep4life/app/course/lesson_page.dart';
import 'package:prep4life/app/course/models/course.dart';
import 'package:prep4life/app/sign_in/email_password/email_password_sign_in_page.dart';

class Routes {
  static const authWidget = '/';
  static const emailPasswordSignInPageBuilder =
      '/email-password-sign-in-page-builder';
  static const coursePage = '/course-page';
  static const lessonPage = '/lesson-page';
}

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.authWidget:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AuthWidget(userSnapshot: args),
          settings: settings,
        );
      case Routes.emailPasswordSignInPageBuilder:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EmailPasswordSignInPageBuilder(onSignedIn: args),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.coursePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => CoursePage(course: args),
          settings: settings,
          fullscreenDialog: false,
        );
      case Routes.lessonPage:
        final Map<String, dynamic> mapArgs = args;
        return MaterialPageRoute<dynamic>(
          builder: (_) => LessonPage(
            course: mapArgs['course'],
            lessonIndex: mapArgs['lessonIndex'],
            moduleIndex: mapArgs['moduleIndex'],
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      // case Routes.entryPage:
      //   final Map<String, dynamic> mapArgs = args;
      //   final Job job = mapArgs['job'];
      //   final Entry entry = mapArgs['entry'];
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EntryPage(job: job, entry: entry),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      default:
        // TODO: Throw
        return null;
    }
  }
}
