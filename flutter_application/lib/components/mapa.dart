import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'mapaScreen.dart';

class TelaMapa extends StatefulWidget {
  const TelaMapa({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaMapa> createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Column(
          children: [
          
          ],
        ),
      ),
    );
  }
}


//37.419857
//-122.078827