import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:photograohy_app/pages/home_shortcuts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("Click Action");
              },
              icon: const Icon(Icons.share))
        ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
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
                onPressed: null,
                icon: Icon(Icons.person),
                iconSize: 50,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [homeShortcuts()],
            ),
          )
        ],
      ),
      bottomNavigationBar: const GNav(
        tabs: [
          GButton(
            icon: Icons.home,
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
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
