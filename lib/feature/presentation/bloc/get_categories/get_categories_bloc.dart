import 'package:quiz_app/feature/domain/use_cases/get_categories_use_case.dart';
import 'package:quiz_app/feature/presentation/bloc/get_categories/get_categories_state.dart';
import 'package:quiz_app/feature/presentation/bloc/quiz_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoriesBloc extends Bloc<QuizEvent, CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  GetCategoriesBloc(this.getCategoriesUseCase) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final categoriesList = await getCategoriesUseCase();
        emit(CategoriesSuccess(categories: categoriesList));
      } catch (e) {
        emit(CategoriesError(errorMessage: "Server error: ${e.toString()}"));
      }
    });
  }
}
