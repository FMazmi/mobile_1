import 'package:flutter/material.dart';
import 'package:project_mobile/page/characters_screen.dart';
import 'package:project_mobile/page/info_view.dart';
import 'package:project_mobile/page/page_characters.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      // PageCharacters(),
      CharactersScreen(),
      InfoPage()
      // Text(
      //   'Index 2: School',
      //   style: optionStyle,
      // ),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black12,
      // ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.titled,
        backgroundColor: Colors.amber,
        items: [
          TabItem(icon: Icons.people_alt_outlined, title: 'Discover'),
          TabItem(icon: Icons.info_outline_rounded, title: 'Info'),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.blue,
        initialActiveIndex: 0,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
