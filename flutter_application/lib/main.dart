import 'package:flutter/material.dart';
import './components/textoBoletim.dart';
import './components/Login.dart';
import 'components/templates/BotaoPadrao.dart';


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

    return Container(
      //testando
      child: const BotaoPadrao(
        text: 'teste',
        paddingLeft: 100,
        paddingBottom: 10,
        paddingRight: 100,
        paddingTop: 10,
        colorBackground: (0xff161616),
        colorText: (0xff555555),
      ),
 
    );
         


  }
}
