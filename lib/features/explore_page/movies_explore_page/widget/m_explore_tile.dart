import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/features/anime_card/anime_card.dart';

import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/constants/sizes.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class MExploretail extends StatelessWidget {
  const MExploretail({super.key, required this.data});
  final HorizontalModel data;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AnimeCardCubit>(context).getAnime(id: data.malId);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 6.0,
        ),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TColors.primary.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(TSizes.cordRadiusSm),
            color: dark ? TColors.dark : TColors.light,
          ),
          child: Column(
            children: [
              Stack(children: [
                // image

                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          color: dark ? TColors.dark : TColors.light,
                          borderRadius:
                              BorderRadius.circular(TSizes.cordRadiusSm),
                        ),
                        width: 150,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(TSizes.cordRadiusSm),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage('${data.imageUrl}')),
                        )),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: Row(
                      children: [
                        Icon(
                          Icons.rectangle_rounded,
                          size: 10,
                          color: TColors.primary,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(" ${data.score}",
                            maxLines: 2,
                            style: TextStyle(
                              color: TColors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ),

                // time tag

                // fav
              ]),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              // details
              // title

              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
