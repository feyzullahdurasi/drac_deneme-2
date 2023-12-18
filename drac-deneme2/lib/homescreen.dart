import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    //const Maps(),
    const Maps(),
    const Maps(),
    const Maps(),
    const SettingsPage(),
    const SettingsPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[0],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        selectedIconTheme: IconThemeData(color: Colors.deepOrange),
        unselectedItemColor: Colors.black26.withOpacity(0.43),
        selectedItemColor: Colors.black,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'music'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
          //BottomNavigationBarItem(icon: Image.asset("name"), label: 'netflix'),
        ],
      ),
    );
  }
}
