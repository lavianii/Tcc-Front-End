import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapaScreen extends StatefulWidget {
  double longitude;
  double latitude;
  mapaScreen({super.key, required this.latitude, required this.longitude});

  @override
  State<mapaScreen> createState() => _mapaScreenState();
}

class _mapaScreenState extends State<mapaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.latitude, widget.longitude)),
      ),
    );
  }
}
