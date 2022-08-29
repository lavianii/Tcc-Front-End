import 'package:flutter/material.dart';
import 'package:flutter_application/components/Login.dart';
import 'package:flutter_application/components/TelaDenuncia.dart';
import 'components/TelaBoletimDeOcorrencia.dart';

void main() {
  runApp(
    const MaterialApp( 
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const TelaDenuncia();
  }
}
