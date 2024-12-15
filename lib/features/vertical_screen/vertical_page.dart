// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hitv/features/home_screen/models/horizontal_model.dart';
import 'package:hitv/features/vertical_screen/widgets/list_item.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class VerticalPage extends StatefulWidget {
  const VerticalPage({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final List<HorizontalModel> data;
  @override
  State<VerticalPage> createState() => _VerticalPageState();
}

class _VerticalPageState extends State<VerticalPage> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            // Image at the top
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdn.myanimelist.net/images/anime/1595/144074l.webp', // Replace with your image URL
                fit: BoxFit.cover,
                height: 310,
                width: double.infinity,
              ),
            ),
            // Black container starting at the bottom of the image
            Positioned(
              top: 270,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 200,
                      blurRadius: 150,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: dark ? TColors.dark : TColors.light,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    
                  ),
                ),
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return ListItem(
                      futureAnime: widget.data[index],
                    );
                  },
                ),
              ),
            ),
            // "Trending Now" text on the image
            Positioned(
              top: 215,
              left: 25,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
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
                color: dark ? TColors.primary : TColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
