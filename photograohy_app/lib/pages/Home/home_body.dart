import 'package:flutter/material.dart';
import 'package:photograohy_app/pages/Home/home_shortcuts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(""),
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
    );
  }
}
