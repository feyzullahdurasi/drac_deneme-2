import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTabChanged;

  const BottomNavBar({Key? key, required this.initialIndex, required this.onTabChanged}) : super(key: key);

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
    return GNav(
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
          icon: Icons.settings,
        ),
      ],
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
            // Handle navigation logic based on index
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

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: Maps(),
  );
}

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Maps> {
  late GoogleMapController mapController;

  LatLng Location = const LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: Location,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('orderLocation'),
            position: Location,
          ),
        },
      ),
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
