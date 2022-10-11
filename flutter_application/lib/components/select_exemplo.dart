import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/bairros.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

Future<List<Bairro>> getBairros() async {
  final response = await http.get(Uri.parse('$_baseUrl/recuperabairro'),
      headers: {"Accept": "application/json"});
      

  if (response.statusCode == 200) {
    List bairros = json.decode(response.body);
   print(bairros.map((data) => print(data)));
    return bairros.map((data) => new Bairro.fromJson(data)).toList();
  } else {
    throw Exception('Erro inesperado...');
  }
}

class SelectExemplo extends StatefulWidget {
  const SelectExemplo({Key? key}) : super(key: key);

  @override
  State<SelectExemplo> createState() => _SelectExemploState();
}

class _SelectExemploState extends State<SelectExemplo> {
  late Future<List<Bairro>> bairroData;

  void initState() {
    super.initState();
    bairroData = getBairros();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder<List<Bairro>>(
            future: bairroData,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<Bairro> data = snapshot.data!;

                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(data[index].bairro),
                        ),
                      );
                    });
              }
               else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
            })),
      ),
    );
  }
}
