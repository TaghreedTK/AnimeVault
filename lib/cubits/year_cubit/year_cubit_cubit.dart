import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'year_cubit_state.dart';

class YearCubit extends Cubit<YearCubitState> {
  YearCubit() : super(ThisYearLoadingState());
    late List<HorizontalModel> yearModel;
  Future<void> getyear() async {
    emit(ThisYearLoadingState());
    try {
       
      yearModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url: 'https://api.jikan.moe/v4/seasons/2024/fall?type=tv');
      emit(ThisYearLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(ThisYearFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
