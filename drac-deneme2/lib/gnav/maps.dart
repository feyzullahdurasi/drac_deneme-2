import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Maps> {
  late GoogleMapController mapController;
  Location location = Location();
  late LatLng currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation =
            LatLng(userLocation.latitude!, userLocation.longitude!);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

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
          target: currentLocation ?? const LatLng(37.7749, -122.4194),
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('orderLocation'),
            position: currentLocation ?? const LatLng(37.7749, -122.4194),
          ),
        },
      ),
    );
  }
}
