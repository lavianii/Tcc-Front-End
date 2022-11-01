import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class TelaMapa extends StatefulWidget {
 final double latitude;
 final double longitude;

  const TelaMapa({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  @override
  State<TelaMapa> createState() => _TelaMapa();
}

class _TelaMapa extends State<TelaMapa> {
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
