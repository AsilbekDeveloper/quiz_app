import 'package:quiz_app/core/difficulty.dart';
import 'package:quiz_app/core/service/api_client.dart';
import 'package:quiz_app/feature/data/models/category_model.dart';
import 'package:quiz_app/feature/data/models/question_model.dart';
import 'package:quiz_app/feature/domain/entities/category_entity.dart';
import 'package:quiz_app/feature/domain/entities/question_entity.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuestionEntity>> getQuestions({
    required int categoryId,
    required Difficulty difficulty,
    int amount = 10,
  });

  Future<List<CategoryEntity>> getCategories();
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final ApiClient apiClient;

  QuizRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await apiClient.dio.get("/api_category.php");

      if (response.statusCode == 200) {
        final result = response.data["trivia_categories"] as List;
        return result.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception(
          "Failed to load categories. Status: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching categories: $e");
    }
  }

  @override
  Future<List<QuestionEntity>> getQuestions({
    required int categoryId,
    required Difficulty difficulty,
    int amount = 10,
  }) async {
    try {
      final response = await apiClient.dio.get(
        "/api.php",
        queryParameters: {
          "amount": amount,
          "category": categoryId,
          "difficulty": difficulty.name,
          "type": "multiple",
        },
      );
      if (response.statusCode == 200) {
        final results = response.data["results"] as List;
        return results.map((json) => QuestionModel.fromJson(json)).toList();
      } else {
        throw Exception(
          "Failed to load question. Status: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error fetching questions: $e");
    }
  }
}
