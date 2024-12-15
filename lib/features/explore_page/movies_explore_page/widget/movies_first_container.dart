import 'package:flutter/material.dart';
import 'package:hitv/features/explore_page/movies_explore_page/views/movies_categories_list_view.dart';

import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class EMFirstCon extends StatelessWidget {
  const EMFirstCon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Container(
        color: dark ? TColors.dark : TColors.white,
        child: MoviesCategoriesListView(),
      ),
    );
  }
}
