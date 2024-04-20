import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:photograohy_app/pages/Home/home_body.dart';
import 'package:photograohy_app/pages/Settings/settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeBody(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        duration: Duration(milliseconds: 800),
        gap: 8,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        backgroundColor: Colors.green,
        onTabChange: _navigateBottomBar,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          // GButton(
          //   icon: Icons.favorite_border,
          //   text: 'Likes',
          // ),
          // GButton(
          //   icon: Icons.search,
          //   text: 'Search',
          // ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
