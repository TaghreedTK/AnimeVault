import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'movie_popular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  MoviePopularCubit() : super(MoviePopularLoadingState());
  late List<HorizontalModel> moviePopularModel; // Example for another function

  Future<void> getMoviepopular() async {
    emit(MoviePopularLoadingState());
    try {
      await Future.delayed(Duration(seconds: 5));
      moviePopularModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url: 'https://api.jikan.moe/v4/top/anime');
      emit(MoviePopularLoadedState());
      log('popullar came');
    } on Exception catch (e) {
      log(e.toString());
      emit(MoviePopularFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
