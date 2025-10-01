import 'package:equatable/equatable.dart';
import 'package:quiz_app/feature/domain/entities/category_entity.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;

  const CategoriesSuccess({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class CategoriesError extends CategoriesState {
  final String errorMessage;

  const CategoriesError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
