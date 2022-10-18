import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_application/models/bairros.dart';

class BairroList {
  var data = [];
  List<Bairro> results = [];
  String urlList = 'https://back-end-tcc-deploy.lavianii.repl.co/recuperabairro';

  Future<List<Bairro>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => Bairro.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.bairro.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        throw("erro inesperado");
      }
    } on Exception catch (e) {
      throw('error: $e');
    }
    return results;
  }
}