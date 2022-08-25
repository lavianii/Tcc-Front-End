// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../components/templates/Cards.dart';
import '../components/templates/Paragrafo.dart';

class TextoBoletim extends StatelessWidget {
  const TextoBoletim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color.fromRGBO(119, 168, 166, 1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Paragrafo(
                texto:
                    'Grande parte dos brasileiros ó registra um boletim de ocorrência em casos graves.',
                padding: 5),
            Paragrafo(
                texto:
                    'Isso acontece porque não sabdem a importância de registrar um B.O. Ele é responável por notificar as autoridades policiais e judiciais sobre a situaçao da criminalidade na região.',
                padding: 5),
            Paragrafo(
                texto:
                    'É mais do que apenas recuperar um bem roubado, por exemplo, é colaborar para um bem coletivo.',
                padding: 5),
            Paragrafo(
                texto:
                    'O link abaixo te redicionara para a Delegacia eletrônica, ondeé possivel registrar um b.o. tranquilamente.',
                padding: 5),
            Cards(
              width: 300,
              height: 130,
              color: Color(0xff152C42),
              marginLeft: 0,
              marginBottom: 0,
              marginRight: 0,
              marginTop: 16,
              alignmentX: 0,
              alignmentY: 0,
              child: Paragrafo(texto: 'Link', padding: 0),
            )
          ],
        ),
      ),
    ));
  }
}
