import 'package:quiz_app/feature/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required super.question,
    required super.correctAnswer,
    required super.incorrectAnswers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json["question"] as String? ?? "",
      correctAnswer: json["correct_answer"] as String? ?? "",
      incorrectAnswers: List<String>.from(json["incorrect_answers"] ?? []),
    );
  }
}
