import 'package:equatable/equatable.dart';
import 'package:quiz_app/feature/domain/entities/question_entity.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object?> get props => [];
}

class QuestionsInitial extends QuestionsState {}

class QuestionsLoading extends QuestionsState {}

class QuestionsSuccess extends QuestionsState {
  final List<QuestionEntity> questions;

  const QuestionsSuccess({required this.questions});

  @override
  List<Object?> get props => [questions];
}

class QuestionsError extends QuestionsState {
  final String errorMessage;

  const QuestionsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
