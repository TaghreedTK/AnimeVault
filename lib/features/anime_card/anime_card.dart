import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/features/anime_card/widgets/botton_row.dart';
import 'package:hitv/features/anime_card/widgets/card_data.dart';
import 'package:hitv/features/anime_card/widgets/image.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 350, child: CardImage()),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                BlocProvider.of<AnimeCardCubit>(context).cardModel.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            BottonsRow(),
            CaardData()
          ],
        ),
      ),
    );
  }
}
