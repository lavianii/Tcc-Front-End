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

    return Card(
      
      //teste
      /*shape: const RoundedRectangleBorder(
        borderRadius:  BorderRadius.all(
          Radius.circular(200),
        ),
      ), 
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.fromLTRB(150, 400, 150, 400),
      //testando
      child:  SizedBox( 
        width: 5,
        height: 5,
        child: Image.asset('lib/components/assets/icons/favoritos.png'),
        )*/
    );
         


  }
}
