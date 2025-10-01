import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/difficulty.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategoriesEvent extends QuizEvent {}

class GetQuestionsEvent extends QuizEvent {
  final int categoryId;
  final Difficulty difficulty;
  final int amount;

  GetQuestionsEvent({
    required this.categoryId,
    required this.difficulty,
    this.amount = 10,
  });

  @override
  List<Object?> get props => [categoryId, difficulty, amount];
}
