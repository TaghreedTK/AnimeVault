import 'package:flutter/material.dart';
import 'package:hitv/features/home_screen/models/firstcon.dart';
import 'package:hitv/features/home_screen/views/searc_view.dart';

import 'package:hitv/utils/constants/colors.dart';

import 'package:hitv/utils/helpers/helper_functions.dart';

class firstCon extends StatelessWidget {
  const firstCon({super.key, required this.data});
  final FirstConModel data;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TColors.grey.withOpacity(0.9),
                spreadRadius: 6,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.anime-planet.com/anime/primary/anyway-im-falling-in-love-with-you-1.webp?t=1727911291'), // Replace with your image URL
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Gradient overlay
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 280,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(800),
                      boxShadow: [
                        BoxShadow(
                          color: dark
                              ? TColors.grey.withOpacity(0.5)
                              : Colors.white60,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',

                          hintStyle: TextStyle(
                            color: dark ? TColors.dark : TColors.dark,
                          ),
                          suffixIcon: IconButton(
                            color: dark ? TColors.primary : TColors.dark,
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          // Center the hint text vertically
                        ),
                        // Align the hint text to the left horizontally

                        // Center the hint text vertically
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: dark ? TColors.primary : TColors.dark,
                ),
              ),
            ],
          ),
        ),
        // Content container
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Anyway, I\'m Falling in Love with You',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
