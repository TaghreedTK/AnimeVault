import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hitv/features/anime_card/models/anime_model.dart';

class AnimeService {
  final Dio dio;

  AnimeService(this.dio);
  Future<AnimeModel> getAnimeDataWeather({required String Url}) async {
    try {
      Response response = await dio
          .get('${Url}');
      AnimeModel animeModel = AnimeModel.fromJson(response.data);
      return animeModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'];
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps');
    }
  }
}
