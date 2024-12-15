import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/year_cubit/year_cubit_cubit.dart';

import 'package:hitv/features/home_screen/widgets/horizontal_tile.dart';

class yearListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var trend = BlocProvider.of<YearCubit>(context).yearModel;
    return SizedBox(
      height: 225,
      child: Padding(
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

// BlocProvider(
//       create: (context) => HomePageCubit()..getTrend(),
//       child: SizedBox(
//         height: 280,
//         child: BlocConsumer<HomePageCubit, HomePageStates>(
//           listener: (context, state) {
//             if (state is TrindingFailuerState) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Oops, there is a failure: ')),
//               );
//             }
//           },
//           builder: (context, state) {
//             if (state is TrindingLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is TrindingLoadedState) {
//               return 
//             } else {
//               return Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );



        //  BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 4,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: horizontallist(
        //               data: BlocProvider.of<HomePageCubit>(context).trendModel[index]
        //             ),
        //           );
        //         });
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // }))
        // FutureBuilder(future: future ,builder:BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // })
        // )
        // )

        //  BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 4,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: horizontallist(),
        //           );
        //         });
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // }))
        // ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 4,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(18.0),
        //         child: horizontallist(),
        //       );
        //     }),



        //  BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return 
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // }))
        // FutureBuilder(future: future ,builder:BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 4,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: horizontallist(),
        //           );
        //         });
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // })
        // )
        // )

        //  BlocBuilder<HomePageCubit, HomePageStates>(
        //     builder: ((context, state) {
        //   if (state is TrindingLoadingState) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (state is TrindingLoadedState) {
        //     return ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 4,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: horizontallist(),
        //           );
        //         });
        //   } else {
        //     return Text('opps there is a failure ');
        //   }
        // }))
        // ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 4,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(18.0),
        //         child: horizontallist(),
        //       );
        //     }),

