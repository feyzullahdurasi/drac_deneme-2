import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTabChanged;

  const BottomNavBar(
      {Key? key, required this.initialIndex, required this.onTabChanged})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GNav(
      selectedIndex: _currentIndex,
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onTabChanged(index);
      },
      tabBackgroundColor: Colors.black12,
      gap: 8,
      tabs: const [
        GButton(
          icon: Icons.home,
        ),
        GButton(
          icon: Icons.favorite_border,
        ),
        GButton(
          icon: Icons.map_outlined,
        ),
        GButton(
          icon: Icons.add_a_photo,
          text: "Camera",
        ),
        GButton(
          icon: Icons.add,
          text: "Netflix",
        ),
        GButton(
          icon: Icons.add,
          text: "Youtube",
        ),
        GButton(
          icon: Icons.add,
          text: "Spotify",
        ),
        GButton(
          icon: Icons.add,
          text: "Music",
        ),
        GButton(
          icon: Icons.settings,
        ),
      ],),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        initialIndex: _currentIndex,
        onTabChanged: (index) {
          switch (index) {
            case 0:
              // Home Page
                break;
              case 1:

                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Maps()),
                );
                break;
              case 3:

                break;
            case 4:
            // Home Page
              break;
            case 5:

              break;
            case 6:

              break;
            case 7:

              break;
            case 8:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              break;
            }
          },
        ),
        //body: // Your main content goes here,
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar Sayfası'),
      ),
      body: const Center(
        child: Text('Ayarlar İçerik Alanı'),
      ),
    );
  }
}

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('harita Sayfası'),
      ),
      body: const Center(
        child: Text('Harita İçerik Alanı'),
      ),
    );
  }
}
