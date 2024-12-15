import 'package:flutter/material.dart';
import 'package:hitv/features/explore_page/tv_explore_page/views/categories_list_view.dart';

import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class FirstCon extends StatelessWidget {
  const FirstCon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Container(
        color: dark ? TColors.dark : TColors.white,
        child: CategoriesListView(),
      ),
    );
  }
}
