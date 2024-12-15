// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'explore_page_state.dart';

class ExplorePageCubit extends Cubit<ExplorePageState> {
  ExplorePageCubit(
    
  ) : super(ExploreLoadingState());
  late List<HorizontalModel> ExploreModel;
  Future<void> getDefultExplore() async {
    emit(ExploreLoadingState());
    try {
      ExploreModel = await HomeService(Dio()).fetchHomeAnimeSeries(
        Url: 'https://api.jikan.moe/v4/anime?type=tv'
      );
      emit(ExploreDefultState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(ExploreFailuerState(e.toString()));
      log(state.toString());
    }
  }
 
  Future<void> getExplore({required String id ,required String yearId,required String seasonId,required String statId}) async {
    emit(ExploreLoadingState());
    try {
      ExploreModel = await HomeService(Dio()).fetchHomeAnimeSeries(
        Url: 'https://api.jikan.moe/v4/seasons$yearId$seasonId$id$statId'
      );
      emit(ExploreLoadedState());
      log('yearcame');
    } on Exception catch (e) {
      log(e.toString());
      emit(ExploreFailuerState(e.toString()));
      log(state.toString());
    }
  }
   
}
