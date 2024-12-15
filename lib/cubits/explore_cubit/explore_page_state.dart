part of 'explore_page_cubit.dart';

@immutable
sealed class ExplorePageState {}

class ExploreLoadingState extends ExplorePageState {
  
}
class ExploreDefultState extends ExplorePageState {
  
}
class ExploreMoviesDefultState extends ExplorePageState {
  
}

class ExploreLoadedState extends ExplorePageState {
 
}
class ExploreFailuerState extends ExplorePageState {
   final String message;
  ExploreFailuerState(this.message);
}
