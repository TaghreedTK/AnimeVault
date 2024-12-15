import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'trinding_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingLoadingState());
  late List<HorizontalModel> trendModel;
  Future<void> getTrend() async {
    emit(TrendingLoadingState());
    try {
       
      trendModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url: 'https://api.jikan.moe/v4/seasons/2024/winter?type=tv');
      emit(TrendingLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(TrendingFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
