import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/features/anime_card/anime_card.dart';
import 'package:hitv/features/home_screen/models/horizontal_model.dart';

import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/constants/sizes.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class ListItem extends StatefulWidget {
  ListItem({required this.futureAnime});
  final HorizontalModel futureAnime;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 8, top: 0),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AnimeCardCubit>(context)
              .getAnime(id: widget.futureAnime.malId);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocBuilder<AnimeCardCubit, AnimeCardState>(
                    builder: ((context, state) {
                  if (state is AnimeLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is AnimeLoadedState) {
                    return AnimeCard();
                  } else {
                    return Text('opps there is a failure ');
                  }
                }));
              },
            ),
          );
        },
        child: Container(
          color: dark ? TColors.dark : TColors.light,
          height: 160,
          child: Stack(
            children: [
              Container(
                width: 90,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(20, 30),
                      bottomLeft: Radius.elliptical(25, 30)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cordRadiusSm),
                      bottomLeft: Radius.circular(TSizes.cordRadiusSm)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage('${widget.futureAnime.imageUrl}')),
                ),
              ),
              Positioned(
                top: 20,
                left: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.futureAnime.title,
                        maxLines: 2,
                        style: TextStyle(
                            color: dark ? TColors.white : TColors.dark,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 70,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: dark ? Colors.white24 : TColors.primary,
                            ),
                            child: Center(
                              child: Text(widget.futureAnime.year,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900)),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: dark ? Colors.white24 : TColors.primary,
                            ),
                            child: Center(
                              child: Text(widget.futureAnime.type,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 1,
                child: Container(
                    width: 45,
                    height: 55,
                    decoration: BoxDecoration(
                      color: TColors.secondry,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(15, 20),
                          bottomLeft: Radius.elliptical(15, 20)),
                    ),
                    child: Center(
                      child: Text('${widget.futureAnime.score}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w900)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
