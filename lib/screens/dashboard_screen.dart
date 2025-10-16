import 'package:flutter/material.dart';
import 'package:tourista_app/screens/favorite_screen.dart';
import 'package:tourista_app/screens/home_screen.dart';
import 'package:tourista_app/screens/map_screen.dart';
import 'package:tourista_app/screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/Icons/Home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Icons/globe.png'),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Icons/icon heart.png'),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(
              Icons.person_outline,
              color: Color(0xffFF7029),
              size: 30,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey[600],
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          MapScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
