import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/cubits/watch_list_cubit/watch_list_cubit.dart';
import 'package:hitv/utils/constants/colors.dart';

import 'package:hitv/utils/helpers/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class BottonsRow extends StatelessWidget {
  const BottonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              width: 40,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(20, 30),
                    bottomLeft: Radius.elliptical(25, 30)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.elliptical(9, 9)),
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(BlocProvider.of<AnimeCardCubit>(context)
                        .cardModel
                        .trailerImage)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 3),
            child: Text(
              'Trailer',
              style: TextStyle(
                  color: dark ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    BlocProvider.of<AnimeCardCubit>(context)
                        .cardModel
                        .trailerUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'opps can\'t reach ';
                }
              },
              icon: Icon(
                Icons.play_circle_outlined,
                color: TColors.primary,
                size: 30,
              )),
          SizedBox(
            width: 15,
          ),
          Text(
            '  watch List',
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                context.read<WatchListCubit>().addToWatchList(
                    BlocProvider.of<AnimeCardCubit>(context).cardModel);
              },
              icon: Icon(
                Icons.bookmark_add,
                color: TColors.secondry,
                size: 30,
              )),
        ],
      ),
    );
  }
}
