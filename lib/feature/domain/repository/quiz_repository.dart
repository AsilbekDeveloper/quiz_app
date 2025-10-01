import 'package:quiz_app/core/difficulty.dart';
import 'package:quiz_app/feature/domain/entities/category_entity.dart';
import 'package:quiz_app/feature/domain/entities/question_entity.dart';

abstract class QuizRepository {
  Future<List<QuestionEntity>> getQuestions({
    required int categoryId,
    required Difficulty difficulty,
    int amount = 10,
  });

  Future<List<CategoryEntity>> getCategories();
}
