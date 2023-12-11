import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const Map());
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Maps(),
    );
  }
}

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Maps> {
  late GoogleMapController mapController;

  // Siparişin varsayılan konumu (örnek olarak ayarlandı, gerçek konum buradan alınabilir)
  LatLng orderLocation = const LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sipariş Takip'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: orderLocation,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('orderLocation'),
            position: orderLocation,
            infoWindow: const InfoWindow(title: 'Sipariş Konumu'),
          ),
        },
      ),
    );
  }
}
