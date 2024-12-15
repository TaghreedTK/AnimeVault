part of 'search_cubit.dart';

@immutable
sealed class SearchCubitState {}



class SearchInitial extends SearchCubitState {}

class SearchLoading extends SearchCubitState {}

class SearchLoaded extends SearchCubitState {
  final  List<AnimeModel> results;

  SearchLoaded(this.results);
}

class SearchError extends SearchCubitState {
  final String message;

  SearchError(this.message);
}
