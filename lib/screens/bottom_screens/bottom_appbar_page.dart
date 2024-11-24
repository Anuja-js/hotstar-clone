import 'package:flutter/material.dart';
import 'package:hotstar/customs/custom_colors.dart';
import 'package:hotstar/screens/bottom_screens/account_settings.dart';
import 'package:hotstar/screens/bottom_screens/download_page.dart';
import 'package:hotstar/screens/bottom_screens/home_page.dart';
import 'package:hotstar/screens/bottom_screens/new_hot.dart';
import 'package:hotstar/screens/bottom_screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HotstarHomePage(),
    TrendingScreen(),
    NewAndHot(),
   DownloadPage(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobelColors.bottomAppbar,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GlobelColors.bottomAppbar,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: GlobelColors.bottomAppbar,
            icon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: GlobelColors.bottomAppbar,
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: GlobelColors.bottomAppbar,
            icon: Icon(
              Icons.play_circle,
              color: primaryColor,
            ),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            backgroundColor: GlobelColors.bottomAppbar,
            icon: Icon(Icons.download_outlined, color: primaryColor),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            backgroundColor: GlobelColors.bottomAppbar,
            icon: Icon(
              Icons.account_circle,
              color: primaryColor,
            ),
            label: 'My Space',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your floating action button functionality here
      //   },
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
