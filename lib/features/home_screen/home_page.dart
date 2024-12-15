import 'package:flutter/material.dart';


import 'package:hitv/cubits/top_cubit/top_cubit.dart';
import 'package:hitv/cubits/trending_cubit/trinding_cubit.dart';

import 'package:hitv/cubits/year_cubit/year_cubit_cubit.dart';
import 'package:hitv/cubits_movies/Movie_popular_cubit/movie_popular_cubit.dart';
import 'package:hitv/cubits_movies/movie_top_cubit/movie_top_cubit.dart';
import 'package:hitv/cubits_movies/movie_year_cubit/movie_year_cubit.dart';
import 'package:hitv/cubits_movies/movies_trend_cubit/movies_trend_cubit.dart';

import 'package:hitv/features/home_screen/views/firsticon_listview.dart';

import 'package:hitv/features/home_screen/views/top_list_view.dart';
import 'package:hitv/features/home_screen/views/year_list_view%20copy.dart';
import 'package:hitv/features/home_screen/views/trending_list_view.dart';
import 'package:hitv/features/home_screen/views_movies/m_popular_list_view.dart';
import 'package:hitv/features/home_screen/views_movies/m_top_list_view.dart';
import 'package:hitv/features/home_screen/views_movies/m_trend_list_view.dart';
import 'package:hitv/features/home_screen/views_movies/m_year_list_view.dart';

import 'package:hitv/features/home_screen/widgets/horizonatl_title.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: firstListView(),
        ),
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => TrendingCubit()..getTrend(),
            child: BlocBuilder<TrendingCubit, TrendingState>(
                builder: ((context, state) {
              if (state is TrendingLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TrendingLoadedState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: horiiTitle(
                        title: ' Trending Now',
                        futureAnime: BlocProvider.of<TrendingCubit>(context)
                            .trendModel,
                      ),
                    ),
                    TrendingListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),

        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => YearCubit()..getyear(),
            child: BlocBuilder<YearCubit, YearCubitState>(
                builder: ((context, state) {
              if (state is ThisYearLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ThisYearLoadedState) {
                return Column(
                  children: [
                    horiiTitle(
                      title: ' Anime of 2024',
                      futureAnime:
                          BlocProvider.of<YearCubit>(context).yearModel,
                    ),
                    yearListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),
        // Top
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => TopCubit()..gettop(),
            child: BlocBuilder<TopCubit, TopCubitState>(
                builder: ((context, state) {
              if (state is TopLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TopLoadedState) {
                return Column(
                  children: [
                    horiiTitle(
                      title: ' Top Rated',
                      futureAnime:
                          BlocProvider.of<TopCubit>(context).topModel,
                    ),
                    TopListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),

        //movies trend
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => MoviesTrendCubit()..getMoviesTrend(),
            child: BlocBuilder<MoviesTrendCubit, MoviesTrendState>(
                builder: ((context, state) {
              if (state is MoviesTrendLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MoviesTrendLoadedState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: horiiTitle(
                        title: ' Trending Now Movies',
                        futureAnime:
                            BlocProvider.of<MoviesTrendCubit>(context)
                                .MovietrendModel,
                      ),
                    ),
                    MovieTListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),
        //2024 movies
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => MovieYearCubit()..getMovieyear(),
            child: BlocBuilder<MovieYearCubit, MovieYearState>(
                builder: ((context, state) {
              if (state is MovieYearLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MovieYearLoadedState) {
                return Column(
                  children: [
                    horiiTitle(
                      title: ' Movies of 2024',
                      futureAnime: BlocProvider.of<MovieYearCubit>(context)
                          .MovieyearModel,
                    ),
                    MovieyearListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),
        // movie top

        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => MovieTopCubit()..getMovieTop(),
            child: BlocBuilder<MovieTopCubit, MovieTopState>(
                builder: ((context, state) {
              if (state is MoviesTopLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MoviesTopLoadedState) {
                return Column(
                  children: [
                    horiiTitle(
                      title: ' Top Rated Movies',
                      futureAnime: BlocProvider.of<MovieTopCubit>(context)
                          .movieTopModel,
                    ),
                    MovieTopListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),

        // popular movie
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => MoviePopularCubit()..getMoviepopular(),
            child: BlocBuilder<MoviePopularCubit, MoviePopularState>(
                builder: ((context, state) {
              if (state is MoviePopularLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MoviePopularLoadedState) {
                return Column(
                  children: [
                    horiiTitle(
                      title: ' Most Popular',
                      futureAnime: BlocProvider.of<MoviePopularCubit>(context)
                          .moviePopularModel,
                    ),
                    MoviepopularListView(),
                  ],
                );
              } else {
                return Text('opps there is a failure ');
              }
            })),
          ),
        ),
      ]),
    );
  }
}
