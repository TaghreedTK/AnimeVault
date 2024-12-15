part of 'movies_trend_cubit.dart';

@immutable
sealed class MoviesTrendState {}
class MoviesTrendLoadingState extends MoviesTrendState {}
class MoviesTrendLoadedState extends MoviesTrendState {
 
}
class MoviesTrendFailuerState extends MoviesTrendState {
   final String message;
  MoviesTrendFailuerState(this.message);
}


