import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hitv/features/home_screen/models/firstcon.dart';
import 'package:hitv/features/home_screen/services/fircon.dart';
import 'package:hitv/features/home_screen/widgets/first_containeer.dart';

class firstListView extends StatefulWidget {
  @override
  State<firstListView> createState() => _firstListViewState();
}

late Future<List<FirstConModel>> futureAnime;

@override
void initState() {}

class _firstListViewState extends State<firstListView> {
  @override
  Widget build(BuildContext context) {
    futureAnime = FirstService(Dio()).fetchUpcomingAnimeSeries();
    return SizedBox(
        height: 350,
        child: FutureBuilder(
          future: futureAnime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return firstCon(
                      data: snapshot.data![index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
