import 'dart:developer';
import 'package:hitv/features/home_screen/models/firstcon.dart';
import 'package:dio/dio.dart';

class FirstService {
  final Dio dio;
  FirstService(this.dio);

  Future<List<FirstConModel>> fetchUpcomingAnimeSeries() async {
    try {
      Response response = await dio.get('https://api.jikan.moe/v4/anime?status=upcoming');
      List<FirstConModel> firstConModel = (response.data['data'] as List)
          .map((item) => FirstConModel.fromJson(item))
          .toList();
      return firstConModel;
    } on DioError catch (e) {
      final String errorMessage = e.response?.data['error'] ?? 'Sorry, an error occurred';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, something went wrong');
    }
  }
}
