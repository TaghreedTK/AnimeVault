import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'movie_year_state.dart';

class MovieYearCubit extends Cubit<MovieYearState> {
  MovieYearCubit() : super(MovieYearLoadingState());
   late List<HorizontalModel> MovieyearModel;
  Future<void> getMovieyear() async {
    emit(MovieYearLoadingState());
    try {
    await Future.delayed(Duration(seconds: 5));
      MovieyearModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url: 'https://api.jikan.moe/v4/anime?type=movie&year=2024');
      emit(MovieYearLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(MovieYearFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
