import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hitv/features/anime_card/models/anime_model.dart';
import 'package:hitv/features/home_screen/services/home_service.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchInitial());
    late List<AnimeModel> anime;
     Future<void> search(String query) async {
    emit(SearchLoading());
    try {
       anime = await HomeService(Dio()).fetchSearchAnime(
          Url: 'https://api.jikan.moe/v4/anime?q=${query}');
      emit(SearchLoaded(anime));
    } catch (e) {
      emit(SearchError('Failed to fetch search results'));
    }
  }
}
