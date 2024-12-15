import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitv/cubits/anime_card/anime_card_cubit.dart';
import 'package:hitv/cubits/watch_list_cubit/watch_list_cubit.dart';

import 'package:hitv/features/home_screen/widgets/navigation_bar.dart';

import 'package:hitv/utils/helpers/helper_functions.dart';

import 'package:hitv/utils/theme/custom_themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimeCardCubit()),
        BlocProvider(create: (context) => WatchListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home: AnimatedSplashScreen(
          splash: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(dark? 'assets/splash/DesignerB.png':'assets/splash/Designer.png'),
            ),
          ),
          splashIconSize: 1000,
          nextScreen: MyNavigationBar(),
          animationDuration: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
