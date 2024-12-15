import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'top_cubit_state.dart';

class TopCubit extends Cubit<TopCubitState> {
  TopCubit() : super(TopLoadingState());
    late List<HorizontalModel> topModel;
  Future<void> gettop() async {
    emit(TopLoadingState());
    try {
     await Future.delayed(Duration(seconds: 3));
      topModel = await HomeService(Dio()).fetchHomeAnimeSeries(
          Url:
              'https://api.jikan.moe/v4/top/anime?type=tv&filter=bypopularity');
      emit(TopLoadedState());
      log('top came');
    } on Exception catch (e) {
      log(e.toString());
      emit(TopFailuerState(e.toString()));
      log(state.toString());
    }
  }
}
