class QuestionEntity {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuestionEntity({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
}
