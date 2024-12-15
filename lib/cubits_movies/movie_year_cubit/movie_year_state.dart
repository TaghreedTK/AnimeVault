part of 'movie_year_cubit.dart';

@immutable
sealed class MovieYearState {}
class MovieYearLoadingState extends MovieYearState {}
class MovieYearLoadedState extends MovieYearState {}
class MovieYearFailuerState extends MovieYearState {
   final String message;

  MovieYearFailuerState( this.message);
}
