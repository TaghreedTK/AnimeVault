import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits_movies/Movie_popular_cubit/movie_popular_cubit.dart';
import 'package:hitv/features/home_screen/widgets/horizontal_tile.dart';

class MoviepopularListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var trend = BlocProvider.of<MoviePopularCubit>(context).moviePopularModel;
    return SizedBox(
      height: 225,
      child:Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return horizontatail(data: trend[index]);
            }),
      ),
    );
  }
}