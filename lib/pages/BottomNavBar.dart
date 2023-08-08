import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    //PageControl
    int selectIndex = 0;
    PageController pageController = PageController();
    void onTap(int pageValue) {
      setState(() {
        selectIndex = pageValue;
      });
      pageController.jumpToPage(pageValue);
    }

    return BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.gamepad_rounded,
              color: Colors.white,
            ),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.tv_off_outlined,
              color: Colors.white,
            ),
            label: "Coming Soon",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.menu_book_outlined,
              color: Colors.white,
            ),
            label: "More",
          ),
        ],
        onTap: onTap,
        selectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white);
  }
}
