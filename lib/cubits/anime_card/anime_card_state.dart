part of 'anime_card_cubit.dart';

@immutable
sealed class AnimeCardState {}


class AnimeLoadingState extends AnimeCardState {}
class AnimeLoadedState extends AnimeCardState {
 
}
class AnimeFailuerState extends AnimeCardState {
   final String message;
  AnimeFailuerState(this.message);
}