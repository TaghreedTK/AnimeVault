import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/cubits/watch_list_cubit/watch_list_cubit.dart';
import 'package:hitv/features/anime_card/anime_card.dart';
import 'package:hitv/features/anime_card/models/anime_model.dart';
import 'package:hitv/utils/constants/colors.dart';

import 'package:hitv/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

// cached network image
class WatchListTile extends StatelessWidget {
  const WatchListTile({super.key, required this.data});
  final AnimeModel data;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        BlocProvider.of<AnimeCardCubit>(context).getAnime(id: data.malId);
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
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 11, right: 11),
        child: Container(
          decoration: BoxDecoration(
            color: dark ? TColors.darkerGrey : TColors.light,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor:
                          dark ? Colors.grey.shade500 : TColors.primary,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 42,
                        backgroundImage: NetworkImage(data.imageUrl),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AnimeCardCubit>(context)
                          .getAnime(id: data.malId);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocBuilder<AnimeCardCubit, AnimeCardState>(
                                builder: ((context, state) {
                              if (state is AnimeLoadingState) {
                                return Center(
                                    child: CircularProgressIndicator());
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status:  ',
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(data.states,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Year:',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text('  ${data.year}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Season: ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(' ${data.season}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 1,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      context.read<WatchListCubit>().removeFromWatchList(
                          BlocProvider.of<AnimeCardCubit>(context).cardModel);
                    },
                    icon: Icon(Iconsax.trash,
                        color: dark ? TColors.primary : TColors.primary)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
