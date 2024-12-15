
import 'package:hitv/features/anime_card/models/anime_model.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';

import 'package:dio/dio.dart';
class HomeService {
  final Dio dio;
  HomeService(this.dio);
  Future <List<HorizontalModel>>fetchHomeAnimeSeries({required String Url}) async {
    try {
    // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio
          .get('${Url}');
     List<HorizontalModel> trendModel = (response.data["data"] as List).map((item) => HorizontalModel.fromJson(item))
          .toList();
      return trendModel;

    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]??'sorry';
      throw Exception(errorMessage);
    } 
  }
    Future <List<AnimeModel>>fetchSearchAnime({required String Url}) async {
    try {
    // trending 2024  https://api.jikan.moe/v4/seasons/2024/winter
      Response response = await dio
          .get('${Url}');
     List<AnimeModel> searchModel = (response.data["data"] as List).map((item) => AnimeModel.fromJson(item))
          .toList();
      return searchModel;

    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]??'sorry';
      throw Exception(errorMessage);
    } 
  }
  
}
