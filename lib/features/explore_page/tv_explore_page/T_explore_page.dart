import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/explore_cubit/explore_page_cubit.dart';
import 'package:hitv/features/explore_page/tv_explore_page/views/explore_list_view.dart';
import 'package:hitv/features/explore_page/tv_explore_page/widget/first_container.dart';



class TExplorePage extends StatelessWidget {
  const TExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FirstCon(),
          ),
          BlocBuilder<ExplorePageCubit, ExplorePageState>(
            builder: (context, state) {
              if (state is ExploreLoadingState) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is ExploreDefultState) {
                return ExploreListView(); // Assuming ExploreListView returns a SliverGrid
              } else if (state is ExploreLoadedState) {
                return ExploreListView(); // Assuming ExploreListView returns a SliverGrid
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
