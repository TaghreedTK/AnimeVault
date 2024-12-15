import 'package:flutter/material.dart';
import 'package:hitv/features/explore_page/explore_page.dart';


import 'package:hitv/features/home_screen/home_page.dart';
import 'package:hitv/features/watch_list/watch_list.dart';
import 'package:hitv/utils/constants/colors.dart';
import 'package:hitv/utils/helpers/helper_functions.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomePage(),
    ExplorePage(),
    WatchListScreen()
    // Add other pages here
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add, size: 30),
            label: 'Watch List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: darkMode ? Colors.grey : TColors.secondry,
        unselectedItemColor: TColors.primary,
        backgroundColor: darkMode ? Colors.black : TColors.light,
        onTap: _onItemTapped,
      ),
    );
  }
}
