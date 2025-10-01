import 'package:quiz_app/feature/domain/entities/category_entity.dart';
import 'package:quiz_app/feature/domain/repository/quiz_repository.dart';

class GetCategoriesUseCase {
  final QuizRepository quizRepository;

  GetCategoriesUseCase({required this.quizRepository});
  Future<List<CategoryEntity>> call() {
    return quizRepository.getCategories();
  }
}