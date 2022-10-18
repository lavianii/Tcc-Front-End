import 'package:flutter/material.dart';
import 'package:flutter_application/models/barra_de_pesquisa_models.dart';

import 'templates/cards/cards_bairros.dart';
import '../models/bairros_models.dart';

class BarraDePesquisa extends SearchDelegate {
  BairroListPesquisa bairroList = BairroListPesquisa();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Bairro>>(
        future: bairroList.getuserList(query: query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Bairro> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  String text = 'baixa Periculosidade';
                  int color = 0xff78CF46;

                  if (data[index].qtd >= 10) {
                    color = 0xffF03E44;
                    text = 'Alta periculosidade';
                  }
                  if (data[index].qtd >= 5 && data[index].qtd < 10) {
                    color = 0xffF0913E;
                    text = 'Media Periculosidade';
                  }

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: CardsBairros(
                      colorSuperior: color,
                      colorInferior: 0xffffffff,
                      borderRadius: 4,
                      width: 300,
                      height: 60,
                      paddingSuperior: 15,
                      textInferior: data[index].bairro,
                      textSuperior: text,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Bairro>>(
        future: bairroList.getuserList(query: query),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Bairro> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  String text = 'baixa Periculosidade';
                  int color = 0xff78CF46;

                  if (data[index].qtd >= 10) {
                    color = 0xffF03E44;
                    text = 'Alta periculosidade';
                  }
                  if (data[index].qtd >= 5 && data[index].qtd < 10) {
                    color = 0xffF0913E;
                    text = 'Media Periculosidade';
                  }

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: CardsBairros(
                      colorSuperior: color,
                      colorInferior: 0xffffffff,
                      borderRadius: 4,
                      width: 300,
                      height: 60,
                      paddingSuperior: 15,
                      textInferior: data[index].bairro,
                      textSuperior: text,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
