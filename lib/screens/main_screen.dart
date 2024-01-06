import 'package:flutter/material.dart';

import '../widgets/icon_badge.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  var selectedIndex = 0;

  static const List<Widget> _bottomNavScreens = [
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: _bottomNavScreens.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:
                Icon(Icons.home_outlined, color: Colors.white.withOpacity(0.5)),
            activeIcon: const Icon(Icons.home_outlined, color: Colors.white),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined,
                color: Colors.white.withOpacity(0.5)),
            activeIcon:
                const Icon(Icons.favorite, color: Colors.white),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_comment_outlined, color: Colors.white.withOpacity(0.5)),
            activeIcon: const Icon(Icons.mode_comment, color: Colors.white),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,
                color: Colors.white.withOpacity(0.5)),
            activeIcon:
                const Icon(Icons.person, color: Colors.white),
            label: "account",
          ),
        ],
        iconSize: 25,
        currentIndex: selectedIndex,
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
