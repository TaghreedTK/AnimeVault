part of 'movie_top_cubit.dart';

@immutable
sealed class MovieTopState {}


class MoviesTopLoadingState extends MovieTopState {}
class MoviesTopLoadedState extends MovieTopState{}
class MoviesTopFailuerState extends MovieTopState {
   final String message;

  MoviesTopFailuerState(this.message);
}
