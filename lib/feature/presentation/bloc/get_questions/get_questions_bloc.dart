import 'package:quiz_app/feature/domain/use_cases/get_questions_use_case.dart';
import 'package:quiz_app/feature/presentation/bloc/get_questions/get_questions_state.dart';
import 'package:quiz_app/feature/presentation/bloc/quiz_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetQuestionsBloc extends Bloc<QuizEvent, QuestionsState> {
  final GetQuestionsUseCase getQuestionsUseCase;

  GetQuestionsBloc(this.getQuestionsUseCase) : super(QuestionsInitial()) {
    on<GetQuestionsEvent>((event, emit) async {
      emit(QuestionsLoading());
      try {
        final questionsList = await getQuestionsUseCase(
          categoryId: event.categoryId,
          difficulty: event.difficulty,
          amount: event.amount,
        );
        emit(QuestionsSuccess(questions: questionsList));
      } catch (e) {
        emit(QuestionsError(errorMessage: "Server error: ${e.toString()}"));
      }
    });
  }
}
