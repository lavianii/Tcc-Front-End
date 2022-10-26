import 'package:flutter/material.dart';
import 'package:flutter_application/util/localizacao_util.dart';
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
  String _imageUrl = '';

  Future<void> _getLocalizacao() async {
    final locData = await Location().getLocation();
    final map = LocationUtil.geradorLocalizacaoImagem(
        latitude: locData.latitude, longitude: locData.longitude);

    setState(() {
      _imageUrl = map;
    });
  }

  Future <void> _selectOnMap () async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => mapaScreen(latitude: 37.419857, longitude: -122.078827),)
    );
  }



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
            Container(
                height: 170,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey)),
                child: _imageUrl == null
                    ? Text('localização nao inf')
                    : Image.network(
                        _imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
            ElevatedButton(
              onPressed: _getLocalizacao,
              child: const Text('lala'),
            ),
             ElevatedButton(
              onPressed: _selectOnMap,
              child: const Text('mapa grande'),
            ),
          ],
        ),
      ),
    );
  }
}


//37.419857
//-122.078827