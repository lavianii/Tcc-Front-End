import 'dart:convert';
import 'bairros_models.dart';
import 'package:http/http.dart' as http;

class ListaBairros {
  Iterable<dynamic> bairros = [];
  final String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  saveBairros(Iterable data) async {
    if (data.isEmpty) {
      throw ('usuario vazio');
    }

    bairros = data;
  }

  Future<Iterable> getBairros() async {
    if (bairros.isEmpty) {
      throw ('bairros vazio');
    }
    return bairros;
  }

  Future<List<Bairro>> listBairros() async {
    Iterable data = await getBairros();
    return data.map((model) => Bairro.fromJson(model)).toList();
  }

  Future<String> getBackEnd() async {
    http.get(Uri.parse('$_baseUrl/recuperabairro'),
        headers: {"Accept": "application/json"}).then((response) {
      Iterable data = json.decode(response.body);
      saveBairros(data);
    });

    return "Sucesso";
  }
}
