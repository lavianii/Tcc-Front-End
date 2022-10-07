import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectExemplo extends StatefulWidget {
  const SelectExemplo({Key? key}) : super(key: key);

  @override
  State<SelectExemplo> createState() => _SelectExemploState();
}

class _SelectExemploState extends State<SelectExemplo> {

   final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
  List<String> _bairros = [];

  Future<void> getBairros() async{
   final response = await http.get(Uri.parse('$_baseUrl/recuperabairro'));



  }

  void initState(){

    super.initState();
    getBairros();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Text('lalalal')),
    );
  }
}