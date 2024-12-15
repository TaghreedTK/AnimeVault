import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/explore_cubit/explore_page_cubit.dart';
import 'package:hitv/features/explore_page/tv_explore_page/models/catigpries_model.dart';

import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  final List<CategoryModel> categories = const [
    CategoryModel(
      id: '',
      categoryName: 'All',
    ),
    CategoryModel(
      id: '?genres=1',
      categoryName: 'Action',
    ),
    CategoryModel(
      id: '?genres=2',
      categoryName: 'Adventure',
    ),
    CategoryModel(
      id: '?genres=3',
      categoryName: 'Cars',
    ),
    CategoryModel(
      id: '?genres=4',
      categoryName: 'Comedy',
    ),
    CategoryModel(
      id: '?genres=7',
      categoryName: 'Mestry',
    ),
  ];
  final List<CategoryModel> seasons = const [
    CategoryModel(
      id: '/fall',
      categoryName: 'All',
    ),
    CategoryModel(
      id: '/summer',
      categoryName: 'Summer',
    ),
    CategoryModel(
      id: '/spring',
      categoryName: 'Spring',
    ),
    CategoryModel(
      id: '/winter',
      categoryName: 'Winter',
    ),
  ];
  final List<CategoryModel> statuse = const [
    CategoryModel(
      id: '',
      categoryName: 'All',
    ),
    CategoryModel(
      id: '&status=completed',
      categoryName: 'Completed',
    ),
    CategoryModel(
      id: '&status=airing',
      categoryName: 'Airing',
    ),
  ];
  final List<CategoryModel> years = const [
    CategoryModel(
      id: '',
      categoryName: 'All',
    ),
    CategoryModel(
      id: '/2024',
      categoryName: '2024',
    ),
    CategoryModel(
      id: '/2023',
      categoryName: '2023',
    ),
    CategoryModel(
      id: '/2022',
      categoryName: '2022',
    ),
    CategoryModel(
      id: '/2021',
      categoryName: '2021',
    ),
    CategoryModel(
      id: '/2020',
      categoryName: '/2020',
    ),
  ];
  List<bool> isSelectedC = [];
  List<bool> isSelectedY = [];
  List<bool> isSelectedS = [];
  List<bool> isSelectedSt = [];

  @override
  void initState() {
    super.initState();
    isSelectedC = List<bool>.generate(categories.length, (index) => index == 0);
    isSelectedY = List<bool>.generate(years.length, (index) => index == 0);
    isSelectedS = List<bool>.generate(seasons.length, (index) => index == 0);
    isSelectedSt = List<bool>.generate(statuse.length, (index) => index == 0);
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Container(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
              
               ToggleButtons(
                isSelected: isSelectedC,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelectedC.length; i++) {
                      isSelectedC[i] = i == index;
                    }
                  });

                  final selectedCategory = categories[index];
                  final selectedYear = years[index];
                  final selectedSeason = seasons[index];
                  final selectedStatues = statuse[index];
                  BlocProvider.of<ExplorePageCubit>(context).getExplore(
                      id: selectedCategory.id,
                      yearId: selectedYear.id,
                      seasonId: selectedSeason.id,
                      statId: selectedStatues.id);
                },
                children: categories.map((category) {
                  return Container(
                    child: Text(
                      category.categoryName,
                      style: TextStyle(
                        color: isSelectedC[categories.indexOf(category)]
                            ? dark
                                ? TColors.primary
                                : TColors.secondry
                            : dark
                                ? Colors.white
                                : Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                color: TColors.light,
                selectedColor: TColors.light,
                fillColor: dark ? Colors.white30 : TColors.light,
                borderColor: dark ? Colors.black : Colors.white,
                selectedBorderColor: dark ? Colors.white30 : TColors.light,
                constraints: BoxConstraints(minHeight: 40, minWidth: 80),
              ),
            ),
          ),
        ),
        //year
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                isSelected: isSelectedY,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelectedY.length; i++) {
                      isSelectedY[i] = i == index;
                    }
                  });

                  final selectedCategory = categories[index];
                  final selectedYear = years[index];
                  final selectedSeason = seasons[index];
                  final selectedStatues = statuse[index];
                  BlocProvider.of<ExplorePageCubit>(context).getExplore(
                      id: selectedCategory.id,
                      yearId: selectedYear.id,
                      seasonId: selectedSeason.id,
                      statId: selectedStatues.id);
                },
                children: years.map((year) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      year.categoryName,
                      style: TextStyle(
                        color: isSelectedY[years.indexOf(year)]
                            ? dark
                                ? TColors.primary
                                : TColors.secondry
                            : dark
                                ? Colors.white
                                : Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                color: TColors.light,
                selectedColor: TColors.light,
                fillColor: dark ? Colors.white30 : TColors.light,
                borderColor: dark ? Colors.black : Colors.white,
                selectedBorderColor: dark ? Colors.white30 : TColors.light,
                constraints: BoxConstraints(minHeight: 40, minWidth: 80),
              ),
            ),
          ),
        ),
        //season
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                isSelected: isSelectedS,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelectedS.length; i++) {
                      isSelectedS[i] = i == index;
                    }
                  });

                  final selectedCategory = categories[index];
                  final selectedYear = years[index];
                  final selectedSeason = seasons[index];
                  final selectedStatues = statuse[index];
                  BlocProvider.of<ExplorePageCubit>(context).getExplore(
                      id: selectedCategory.id,
                      yearId: selectedYear.id,
                      seasonId: selectedSeason.id,
                      statId: selectedStatues.id);
                },
                children: seasons.map((season) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      season.categoryName,
                      style: TextStyle(
                        color: isSelectedS[seasons.indexOf(season)]
                           ? dark
                                ? TColors.primary
                                : TColors.secondry
                            : dark
                                ? Colors.white
                                : Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
               color: TColors.light,
                selectedColor: TColors.light,
                fillColor: dark ? Colors.white30 : TColors.light,
                borderColor: dark ? Colors.black : Colors.white,
                selectedBorderColor: dark ? Colors.white30 : TColors.light,
                
                constraints: BoxConstraints(minHeight: 40, minWidth: 80),
              ),
            ),
          ),
        ),
        // status

        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                isSelected: isSelectedSt,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelectedSt.length; i++) {
                      isSelectedSt[i] = i == index;
                    }
                  });

                  final selectedCategory = categories[index];
                  final selectedYear = years[index];
                  final selectedSeason = seasons[index];
                  final selectedStatues = statuse[index];
                  BlocProvider.of<ExplorePageCubit>(context).getExplore(
                      id: selectedCategory.id,
                      yearId: selectedYear.id,
                      seasonId: selectedSeason.id,
                      statId: selectedStatues.id);
                },
                children: statuse.map((stat) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      stat.categoryName,
                      style: TextStyle(
                        color: isSelectedSt[statuse.indexOf(stat)]
                            ? dark
                                ? TColors.primary
                                : TColors.secondry
                            : dark
                                ? Colors.white
                                : Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              color: TColors.light,
                selectedColor: TColors.light,
                fillColor: dark ? Colors.white30 : TColors.light,
                borderColor: dark ? Colors.black : Colors.white,
                selectedBorderColor: dark ? Colors.white30 : TColors.light,
                
                constraints: BoxConstraints(minHeight: 40, minWidth: 80),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//  ToggleButtons(
//           isSelected: isSelectedC,
//           onPressed: 
// (int index) {
//             setState(() {
//               for (int i = 0; i < isSelectedC.length; i++) {
//                 isSelectedC[i] = i == index;
//               }
//             });

//             final selectedCategory = categories[index];
//             BlocProvider.of<ExplorePageCubit>(context)
//                 .getExplore(id: selectedCategory.id);
//           },
//           children: categories.map((category) {
//             return Container(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text(
//                 category.categoryName,
//                 style: TextStyle(
//                   color: isSelectedC[categories.indexOf(category)]
//                       ? Colors.white
//                       : Colors.black,
//                   fontSize: 12,
//                 ),
//               ),
//             );
//           }).toList(),
//           color: TColors.dark,
//           selectedColor: TColors.black,
//           fillColor: TColors.black,
//           borderColor: TColors.dark,
//           selectedBorderColor: TColors.black,
//           borderRadius: BorderRadius.circular(80),
//           constraints: BoxConstraints(minHeight: 40, minWidth: 80),
//         ),










  // CategoryButton(
  //           isSelected: isSelectedC,
  //           list: categories,
  //           onPress: (int index) {
  //             setState(() {
  //               for (int i = 0; i < isSelectedC.length; i++) {
  //                 isSelectedC[i] = i == index;
  //               }
  //             });
  //             final selectedCategory = categories[index];
  //             BlocProvider.of<ExplorePageCubit>(context)
  //                 .getExplore(id: selectedCategory.id);
  //           },
  //         )




















// import 'package:flutter/material.dart';
// import 'package:hitv/features/explore_page/models/catigpries_model.dart';
// import 'package:hitv/features/explore_page/widget/category_button.dart';

// class CategoriesListView extends StatelessWidget {
//   const CategoriesListView({super.key});
//   final List<CategoryModel> categoreis = const [
//     CategoryModel(
//       id: 1,
//       categoryName: 'Action',
//     ),
//     CategoryModel(
//       id: 2,
//       categoryName: 'Adventure',
//     ),
//     CategoryModel(
//       id: 3,
//       categoryName: 'Cars',
//     ),
//     CategoryModel(
//       id: 4,
//       categoryName: 'Comedy',
//     ),
//     CategoryModel(
//       id: 7,
//       categoryName: 'Mestry',
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categoreis.length,
//           itemBuilder: (context, index) {
//             return CategoryButton(
//               category: categoreis[index],
//             );
//           }),
//     );
//   }
// }
