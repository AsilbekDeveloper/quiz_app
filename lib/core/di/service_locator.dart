import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/feature/data/data_source/quiz_remote_data_source.dart';
import 'package:quiz_app/feature/data/repository_impl/quiz_repository_impl.dart';
import 'package:quiz_app/feature/domain/repository/quiz_repository.dart';
import 'package:quiz_app/feature/domain/use_cases/get_categories_use_case.dart';
import 'package:quiz_app/feature/domain/use_cases/get_questions_use_case.dart';
import 'package:quiz_app/feature/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:quiz_app/feature/presentation/bloc/get_questions/get_questions_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<QuizRemoteDataSource>(
    () => QuizRemoteDataSourceImpl(apiClient: sl()),
  );
  
  sl.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl(quizRemoteDataSource: sl()));

  // Use Cases
  sl.registerLazySingleton<GetQuestionsUseCase>(() => GetQuestionsUseCase(quizRepository: sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(quizRepository: sl()));

  // Bloc
  sl.registerFactory<GetQuestionsBloc>(() => GetQuestionsBloc(sl()));
  sl.registerFactory<GetCategoriesBloc>(() => GetCategoriesBloc(sl()));
}
