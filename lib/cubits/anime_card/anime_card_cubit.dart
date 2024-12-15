import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/anime_card/models/anime_model.dart';
import 'package:hitv/features/anime_card/services/anime_servce.dart';

import 'package:meta/meta.dart';

part 'anime_card_state.dart';

class AnimeCardCubit extends Cubit<AnimeCardState> {
  AnimeCardCubit() : super(AnimeLoadingState());
  late AnimeModel cardModel;
  Future<void> getAnime({required int id}) async {
    emit(AnimeLoadingState());
    try {
      cardModel = await AnimeService(Dio()).getAnimeDataWeather(
            Url: 'https://api.jikan.moe/v4/anime/$id');
      emit(AnimeLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(AnimeFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
