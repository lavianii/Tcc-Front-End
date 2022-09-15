import 'package:flutter/material.dart';
import 'templates/texto_cards_de_info.dart';
import 'templates/cards.dart';
import 'templates/paragrafo.dart';
import 'templates/botao_padrao.dart';


class TelaEstressePosTraumatico extends StatelessWidget {
  const TelaEstressePosTraumatico({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Estresse pós traumatico', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xffffffff),
      ),

      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 45, 45, 0),
        child: Column(
          children: const [
            Paragrafo(
                texto:
                    'O trauma psicológico é a dificuldade em se recuperar depois de vivenciar ou testemunhar um acontecimento assustador.Isso pode durar meses ou anos, com gatilhos que podem trazer de volta memórias acompanhadas por intensas reações emocionais e físicas as quais,muitas vezes, podem atrapalhar a vida profissional e pessoal.',
                padding: 5),
            Paragrafo(
                texto:
                    'A maioria dos casos é necessário o auxílio de um profissional para superar um trauma.',
                padding: 5),

            Cards(
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
            Cards(
              width: 300,
              height: 35,
              color: 0xffffffff,
              marginLeft: 0,
              marginTop: 0,
              marginRight: 0,
              marginBottom: 0,
              paddingLeft: 0,
              paddingTop: 0,
              paddingRight: 0,
              paddingBottom: 0,
              opacity: 0,
              child: BotaoPadrao(
                  paddingLeft: 120,
                  paddingTop: 8,
                  paddingRight: 120,
                  paddingBottom: 8,
                  colorBackground: 0xffffffff,
                  /* ou (0xffffffff)*/
                  opacity: 0.0,
                  colorText: 0xff152C42,
                  link: 'https://apsiquiatra.com.br/trauma/',
                  text: 'Site'),
            ),
          ],
        ),
      ),
    );
  }
}
