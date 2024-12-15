part of 'movie_popular_cubit.dart';

@immutable
sealed class MoviePopularState {}

class MoviePopularLoadingState extends MoviePopularState {}
class MoviePopularLoadedState extends MoviePopularState {}
class MoviePopularFailuerState extends MoviePopularState {
   final String message;

  MoviePopularFailuerState( this.message);
}
