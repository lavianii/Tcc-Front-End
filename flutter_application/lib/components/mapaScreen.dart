import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaScreen extends StatefulWidget {
  double latitude;
  double longitude;

  MapaScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mapa'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude), zoom: 17,),
        myLocationEnabled: true,
        
      ),
    );
  }
}
