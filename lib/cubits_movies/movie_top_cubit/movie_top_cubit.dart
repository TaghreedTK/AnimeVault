
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'movie_top_state.dart';

class MovieTopCubit extends Cubit<MovieTopState> {
  MovieTopCubit() : super(MoviesTopLoadingState());
    late List<HorizontalModel> movieTopModel;
  Future<void> getMovieTop() async {
   
    try {
   await Future.delayed(Duration(seconds: 5));
      movieTopModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url:
              'https://api.jikan.moe/v4/top/anime?type=movie&filter=bypopularity');
      emit(MoviesTopLoadedState());
      log('top came');
    } on Exception catch (e) {
      log(e.toString());
      emit(MoviesTopFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
