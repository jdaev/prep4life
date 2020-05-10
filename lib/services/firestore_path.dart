class FirestorePath {
  static String course(String courseId) => 'courses/$courseId';
  static String courses() => 'courses';
  static String enrolledCourse(String uid, String courseId) => 'users/$uid/courses/$courseId';
  static String user(String uid) => 'users/$uid';
  static String enrolledCourses(String uid) => 'users/$uid/courses';
  static String courseComments(String courseId) => 'courses/$courseId/comments';
  

}
