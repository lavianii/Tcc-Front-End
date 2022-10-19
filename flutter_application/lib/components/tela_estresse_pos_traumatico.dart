import 'package:flutter/material.dart';
import 'templates/textos/texto_cards_de_info.dart';
import 'templates/cards/cards.dart';
import 'templates/textos/paragrafo.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaEstressePosTraumatico extends StatelessWidget {
  const TelaEstressePosTraumatico({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estresse pós traumatico',
            style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xffffffff),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 45, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Paragrafo(
                texto:
                    'O trauma psicológico é a dificuldade em se recuperar depois de vivenciar ou testemunhar um acontecimento assustador.Isso pode durar meses ou anos, com gatilhos que podem trazer de volta memórias acompanhadas por intensas reações emocionais e físicas as quais,muitas vezes, podem atrapalhar a vida profissional e pessoal.',
                padding: 5),
            const Paragrafo(
                texto:
                    'A maioria dos casos é necessário o auxílio de um profissional para superar um trauma.',
                padding: 5),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse('https://apsiquiatra.com.br/trauma/');

                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Não foi possivel acessar a Url:  $url';
                }
              },
              child: const Cards(
                  width: 300,
                  height: 190,
                  color: 0xff77A8A6,
                  opacity: 0.30,
                  marginLeft: 0,
                  marginBottom: 0,
                  marginRight: 0,
                  marginTop: 35,
                  paddingLeft: 30,
                  paddingTop: 35,
                  paddingRight: 30,
                  paddingBottom: 35,
                  child: TextoCardsDeInfo(
                      texto:
                          'Para entender melhor todo o processo de um trauma, a dra.Aline Rangel, psiquiatra, aborda esse tema em seu site de forma resumida e esclarecedora:')),
            ),
          ],
        ),
      ),
    );
  }
}
