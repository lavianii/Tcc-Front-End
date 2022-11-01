import 'dart:convert';
import '../models/bairros_models.dart';
import 'package:http/http.dart' as http;

/*Foram implementados gets de duas formas diferentes, pois um é utilizado na 
  tela inicial eo outro no form de denuncias.
  E são consumidos de formas diferentes,
  por isso a necessidade.*/

class ListaBairros {
  Iterable<dynamic> bairros = [];

  final String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  Future<List<Bairro>> getBairrosTelaInicial() async {
    final response = await http.get(Uri.parse('$_baseUrl/recuperabairro'),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List bairros = json.decode(response.body);
      return bairros.map((data) => Bairro.fromJson(data)).toList();
    } else {
      throw Exception('Erro inesperado...');
    }
  }

  Future<String> getBackEnd() async {
    http.get(Uri.parse('$_baseUrl/recuperabairro'),
        headers: {"Accept": "application/json"}).then((response) {
      Iterable data = json.decode(response.body);
      saveBairros(data);
    });

    return "Sucesso";
  }

  saveBairros(Iterable data) async {
    if (data.isEmpty) {
      throw ('usuario vazio');
    }

    bairros = data;
  }

  Future<Iterable> _getBairros() async {
    if (bairros.isEmpty) {
      throw ('bairros vazio');
    }
    return bairros;
  }

  Future<List<Bairro>> getListBairros() async {
    Iterable data = await _getBairros();
    return data.map((model) => Bairro.fromJson(model)).toList();
  }
}
