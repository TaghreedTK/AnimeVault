part of 'movies_explore_cubit.dart';

@immutable
sealed class MoviesExploreState {}



class MExploreLoadingState extends MoviesExploreState {
  
}
class MExploreDefultState extends MoviesExploreState {
  
}
class MExploreMoviesDefultState extends MoviesExploreState {
  
}

class MExploreLoadedState extends MoviesExploreState {
 
}
class MExploreFailuerState extends MoviesExploreState {
   final String message;
  MExploreFailuerState(this.message);
}

