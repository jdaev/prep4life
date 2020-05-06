class Question {
  String question;
  String answer;
  List<String> incorrectAnswers;
  double position;

  Question();

  Question fromMap(Map question){
    this.question = question['question'];
    this.answer = question['answer'];
    this.incorrectAnswers = question['incorrectAnswers'];
    this.position = question['position'];
    return this;
  }
}