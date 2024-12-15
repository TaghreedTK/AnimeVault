import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hitv/cubits/m_explore_cubit/movies_explore_cubit.dart';
import 'package:hitv/features/explore_page/movies_explore_page/widget/m_explore_tile.dart';






class MoviesExploreListView extends StatelessWidget {
  MoviesExploreListView({super.key});
  @override
  Widget build(BuildContext context) {
    var explore = BlocProvider.of<MoviesExploreCubit>(context).MExploreModel;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          mainAxisExtent: 220),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return MExploretail(data: explore[index]);
        },
        childCount: explore.length,
      ),
    );
  }
}
