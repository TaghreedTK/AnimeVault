import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class CaardData extends StatelessWidget {
  const CaardData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    var card = BlocProvider.of<AnimeCardCubit>(context).cardModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15, right: 10),
            child: ReadMoreText(
              card.synopsis,
              trimLines: 4,
              colorClickableText: TColors.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Read More',
              trimExpandedText: ' Read Less',
              style: TextStyle(
                  color: dark ? Colors.grey : Colors.black45, fontSize: 15),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 10),
          child: Row(
            children: [
              Text(
                'Type: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.type}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                'Episodes: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.noEps}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              Text(
                'Duration: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.duration}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 10),
          child: Row(
            children: [
              Text(
                'Year:',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${card.year}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'Season: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.season}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              Text(
                'Aired: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.airedDate}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              Text(
                'Broadcast: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.day}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              Text(
                'Source: ',
                style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${card.source}',
                style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
