import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/explore_cubit/explore_page_cubit.dart';
import 'package:hitv/features/explore_page/tv_explore_page/widget/explore_tile.dart';





class ExploreListView extends StatelessWidget {
  ExploreListView({super.key});
  @override
  Widget build(BuildContext context) {
    var explore = BlocProvider.of<ExplorePageCubit>(context).ExploreModel;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          mainAxisExtent: 220),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Exploretail(data: explore[index]);
        },
        childCount: explore.length,
      ),
    );
  }
}
