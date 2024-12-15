part of 'watch_list_cubit.dart';

@immutable
sealed class WatchListState {}

class AnimeWatchListState   {
  final List<AnimeModel> watchList;
  AnimeWatchListState (this.watchList);
}
class AnimeWatchListEmptyState extends WatchListState{
}
class AnimeWatchListLoadingState extends WatchListState{
}