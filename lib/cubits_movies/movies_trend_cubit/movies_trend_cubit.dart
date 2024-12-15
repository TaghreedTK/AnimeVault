

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'movies_trend_state.dart';

class MoviesTrendCubit extends Cubit<MoviesTrendState> {
  MoviesTrendCubit() : super(MoviesTrendLoadingState());
    late List<HorizontalModel> MovietrendModel;
  Future<void> getMoviesTrend() async {
    emit(MoviesTrendLoadingState());
    try {
       await Future.delayed(Duration(seconds: 3));
      MovietrendModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url: 'https://api.jikan.moe/v4/top/anime?type=movie&year=2024');
      emit(MoviesTrendLoadedState());
  
    } on Exception catch (e) {
      log(e.toString());
      emit(MoviesTrendFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
