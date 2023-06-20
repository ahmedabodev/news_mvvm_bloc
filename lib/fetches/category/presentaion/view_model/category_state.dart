part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoadingState extends CategoryState {}
class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState(this.message);
}
class CategorySuccessLoadedState extends CategoryState {}
class CategoryChangeCategory extends CategoryState {

}