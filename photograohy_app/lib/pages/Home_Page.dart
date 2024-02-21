import 'package:easy_search_bar/easy_search_bar.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:photograohy_app/pages/home_shortcuts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: EasySearchBar(
        onSearch: (value) => setState(() => searchValue = value),
        suggestions: _suggestions,
        backgroundColor: Color.fromARGB(255, 126, 126, 126),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("Click Action");
              },
              icon: const Icon(Icons.share)),
        ],
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            Center(
              child: DrawerHeader(
                child: Text(
                  'P H O T O  P R O',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello User",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      Text("Good morning.."),
                    ],
                  ),
                ),
                IconButton(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(top: 30),
                  onPressed: null,
                  icon: Icon(Icons.person),
                  iconSize: 50,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [homeShortcuts()],
            ),
          )
        ],
      ),
      bottomNavigationBar: const GNav(
        duration: Duration(milliseconds: 800),
        gap: 8,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //tabActiveBorder:
        //Border.all(color: Theme.of(context).colorScheme.inversePrimary),
        //tabMargin: EdgeInsets.only(bottom: 4),
        backgroundColor: Color.fromARGB(255, 126, 126, 126),
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
