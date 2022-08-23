import 'package:flutter/material.dart';
import 'package:flutter_application/components/cadastrarBotao.dart';
import 'package:flutter_application/components/entrarBotao.dart';
import 'package:flutter_application/components/estiloTextFild.dart';
import 'package:flutter_application/components/logo.dart';
import 'package:flutter_application/components/textoBoletim.dart';

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
      child: textoBoletim(),
 
    );
         

    // codigo login
      /*backgroundColor: const Color.fromRGBO(119, 168, 166, 1.0),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Logo(),
                SizedBox(height: 15),
                EstiloTextFild(label: 'Usuario', iconData: Icons.person),
                SizedBox(height: 15),
                EstiloTextFild(label: 'Senha', iconData: Icons.lock),
                SizedBox(height: 15),
                CadastrarBotao(),
                EntrarBotao()
              ],
            ),
          ),
        ),
      ),*/
    
  }
}
