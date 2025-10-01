import 'package:quiz_app/core/difficulty.dart';
import 'package:quiz_app/feature/data/data_source/quiz_remote_data_source.dart';
import 'package:quiz_app/feature/domain/entities/category_entity.dart';
import 'package:quiz_app/feature/domain/entities/question_entity.dart';
import 'package:quiz_app/feature/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final QuizRemoteDataSource quizRemoteDataSource;

  QuizRepositoryImpl({required this.quizRemoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() {
    return quizRemoteDataSource.getCategories();
  }

  @override
  Future<List<QuestionEntity>> getQuestions({
    required int categoryId,
    required Difficulty difficulty,
    int amount = 10,
  }) {
    return quizRemoteDataSource.getQuestions(
      categoryId: categoryId,
      difficulty: difficulty,
      amount: amount,
    );
  }
}
