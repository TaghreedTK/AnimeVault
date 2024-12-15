import 'package:flutter/material.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/vertical_screen/vertical_page.dart';

import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class horiiTitle extends StatefulWidget {
  const horiiTitle({super.key, required this.title, required this.futureAnime});
  final String title;
  final List<HorizontalModel> futureAnime;
  @override
  State<horiiTitle> createState() => _horiiTitleState();
}

class _horiiTitleState extends State<horiiTitle> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: dark ? TColors.dark : Colors.grey.shade200,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 5,
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                  color: TColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: TColors.primary.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 5.0),
                  Text(
                    '${widget.title}',
                    style: TextStyle(
                      color: dark ? TColors.light : TColors.dark,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerticalPage(
                              title: widget.title,
                              data: widget.futureAnime,
                            )),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
                color: dark ? TColors.primary : TColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
