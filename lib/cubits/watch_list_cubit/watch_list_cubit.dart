import 'package:bloc/bloc.dart';
import 'package:hitv/features/anime_card/models/anime_model.dart';
import 'package:meta/meta.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<AnimeWatchListState> {
  WatchListCubit() : super(AnimeWatchListState([]));
  late List<AnimeModel> updatedList;
  void addToWatchList(AnimeModel anime) {
     updatedList = List<AnimeModel>.from(state.watchList)..add(anime);
    emit(AnimeWatchListState(updatedList));
  }

  void removeFromWatchList(AnimeModel anime) {
    final updatedList = List<AnimeModel>.from(state.watchList)..remove(anime);
    emit(AnimeWatchListState(updatedList));
  }
}
