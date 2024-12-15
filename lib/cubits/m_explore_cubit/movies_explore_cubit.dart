

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'movies_explore_state.dart';

class MoviesExploreCubit extends Cubit<MoviesExploreState> {
  MoviesExploreCubit() : super(MExploreLoadingState());
    late List<HorizontalModel> MExploreModel;
   Future<void> getMoviesDefultExplore() async {
    emit(MExploreLoadingState());
    try {
      MExploreModel = await HomeService(Dio()).fetchHomeAnimeSeries(
        Url: 'https://api.jikan.moe/v4/anime?type=movie'
      );
      emit(MExploreMoviesDefultState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(MExploreFailuerState(e.toString()));
      log(state.toString());
    }
  }
    Future<void> getMoviesExplore({required String id ,required String yearId,required String seasonId}) async {
    emit(MExploreLoadingState());
    try {
      MExploreModel = await HomeService(Dio()).fetchHomeAnimeSeries(
        Url: 'https://api.jikan.moe/v4/seasons$yearId$seasonId?type=movie$id'
      );
      emit(MExploreLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(MExploreFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
