import 'package:flutter/material.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(800),
              boxShadow: [
                BoxShadow(
                  color: TColors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: dark ? TColors.dark : TColors.light,
                ),
                suffixIcon: IconButton(
                  color: dark ? TColors.primary : TColors.light,
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                border: InputBorder.none,
                // Center the hint text vertically
                alignLabelWithHint: true,
              ),
              // Align the hint text to the left horizontally
    
              // Center the hint text vertically
              textAlignVertical: TextAlignVertical.bottom,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: dark ? TColors.primary : TColors.light,
          ),
        ),
      ],
    );
  }
}
