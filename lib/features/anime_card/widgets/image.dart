import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';
// Import this to use ImageFilter.blur

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    var card = BlocProvider.of<AnimeCardCubit>(context).cardModel;
    return Stack(
      children: [
        Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRect(
            // Clip the blur effect to the container
            child: Container(
              color: Colors.red.withOpacity(0), // Required to apply blur
              child: Image.network(
                card.imageUrl, // Replace with your image URL
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            )),
        Positioned(
          top: 145,
          left: 20,
          child: Container(
            height: 185,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // Set the border color
                width: 2.0, // Set the border width
              ),
              image: DecorationImage(
                image:
                    NetworkImage(card.imageUrl), // Replace with your image URL
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 25,
          left: 5,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: dark ? TColors.secondry : TColors.primary,
          ),
        ),
      ],
    );
  }
}
