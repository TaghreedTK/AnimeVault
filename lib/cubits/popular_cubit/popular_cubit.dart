// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:hitv/features/home_screen/models/horizontal_model.dart';
// import 'package:hitv/features/home_screen/services/home_service.dart';
// import 'package:meta/meta.dart';

// part 'popular_state.dart';

// class PopularCubit extends Cubit<PopularState> {
//   PopularCubit() : super(PopularLoadingState());

//   late List<HorizontalModel> popularModel; // Example for another function

//   Future<void> getpopular() async {
//     emit(PopularLoadingState());
//     try {
//     await Future.delayed(Duration(seconds: 3));
//       popularModel = await HomeService(Dio()).fetchHomeAnimeSeries(
//           Url: 'https://api.jikan.moe/v4/top/anime?type=tv');
//       emit(PopularLoadedState());
//       log('popullar came');
//     } on Exception catch (e) {
//       log(e.toString());
//       emit(PopularFailuerState(e.toString()));
//       log(state.toString());
//     }
//   }
// }
