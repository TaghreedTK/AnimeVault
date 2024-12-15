import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hitv/cubits/watch_list_cubit/watch_list_cubit.dart';
import 'package:hitv/features/watch_list/widgets/watch_tile.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';


class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My WatchList',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<WatchListCubit, AnimeWatchListState>(
        builder: (context, state) {
          if (state.watchList.isNotEmpty) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return WatchListTile(
                        data: state.watchList[index],
                      );
                    },
                    childCount: state.watchList.length,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'Your watch list is empty.',
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
