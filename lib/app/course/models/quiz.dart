class Question {
  String question;
  String answer;
  List incorrectAnswers;
  double position;

  Question();

  Question fromMap(Map question){
    this.question = question['question'];
    this.answer = question['answer'];
    this.incorrectAnswers = question['incorrectAnswers'];
    this.position = question['position'].toDouble();
    return this;
  }
}