import 'package:quiz_app/core/difficulty.dart';
import 'package:quiz_app/feature/domain/entities/question_entity.dart';
import 'package:quiz_app/feature/domain/repository/quiz_repository.dart';

class GetQuestionsUseCase {
  final QuizRepository quizRepository;

  GetQuestionsUseCase({required this.quizRepository});

  Future<List<QuestionEntity>> call({
    required int categoryId,
    required Difficulty difficulty,
    int amount = 10,
  }) {
    return quizRepository.getQuestions(
      categoryId: categoryId,
      difficulty: difficulty,
      amount: amount,
    );
  }
}
