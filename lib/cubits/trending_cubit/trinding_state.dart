part of 'trinding_cubit.dart';

@immutable
sealed class TrendingState {}
class TrendingLoadingState extends TrendingState {}
class TrendingLoadedState extends TrendingState {
 
}
class TrendingFailuerState extends TrendingState {
   final String message;
  TrendingFailuerState(this.message);
}

