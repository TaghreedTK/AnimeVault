import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/explore_cubit/explore_page_cubit.dart';
import 'package:hitv/cubits/m_explore_cubit/movies_explore_cubit.dart';
import 'package:hitv/features/explore_page/movies_explore_page/movies_explore_page.dart';
import 'package:hitv/features/explore_page/tv_explore_page/T_explore_page.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MoviesExploreCubit()..getMoviesDefultExplore()),
        BlocProvider(
            create: (context) => ExplorePageCubit()..getDefultExplore()),
      ],
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 5,
            backgroundColor: dark ? Colors.black : Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: dark ? TColors.primary : TColors.secondry,
                      labelColor: dark ? TColors.white : TColors.black,
                      unselectedLabelColor: dark ? Colors.white : Colors.black,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      tabs: [
                        Tab(
                          text: 'TV Shows',
                        ),
                        Tab(text: 'Movies'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              TExplorePage(), // Replace with your widget for movies
              MExplorePage(), // Replace with your widget for TV shows
            ],
          ),
        ),
      ),
    );
  }
}
