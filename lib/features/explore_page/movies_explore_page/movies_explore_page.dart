import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hitv/cubits/m_explore_cubit/movies_explore_cubit.dart';
import 'package:hitv/features/explore_page/movies_explore_page/views/movies_explore_list_view.dart';
import 'package:hitv/features/explore_page/movies_explore_page/widget/movies_first_container.dart';



class MExplorePage extends StatelessWidget {
  const MExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: EMFirstCon(),
          ),
          BlocBuilder<MoviesExploreCubit, MoviesExploreState>(
            builder: (context, state) {
              if (state is MExploreLoadingState) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is MExploreMoviesDefultState) {
                return MoviesExploreListView(); // Assuming ExploreListView returns a SliverGrid
              } else if (state is MExploreLoadedState) {
                return MoviesExploreListView(); // Assuming ExploreListView returns a SliverGrid
              } else {
                return SliverToBoxAdapter(
                  child: Text('Oops, there is a failure'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
