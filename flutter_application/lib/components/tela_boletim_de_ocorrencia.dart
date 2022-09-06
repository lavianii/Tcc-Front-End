import 'package:flutter/material.dart';
import 'templates/texto_cards_de_info.dart';
import 'templates/cards.dart';
import 'templates/paragrafo.dart';
import 'templates/botao_padrao.dart';


class TelaBoletimDeOcorrencia extends StatelessWidget {
  const TelaBoletimDeOcorrencia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffDFF5F4),
        foregroundColor: const Color(0xff000000),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 45, 45, 0),
        child: Column(
          children: const [
            Paragrafo(
                texto:
                    'Grande parte dos brasileiros só registra um boletim de ocorrência em casos graves.',
                padding: 5),
            Paragrafo(
                texto:
                    'Isso acontece porque não sabem a importância de registrar um B.O. Ele é responável por notificar as autoridades policiais e judiciais sobre a situação da criminalidade na região.',
                padding: 5),
            Paragrafo(
                texto:
                    'É mais do que apenas recuperar um bem roubado, por exemplo, é colaborar para um bem coletivo.',
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
                paddingTop: 45,
                paddingRight: 30,
                paddingBottom: 45,
                child: TextoCardsDeInfo(
                    texto:
                        'O botão abaixo te redicionara para a Delegacia eletrônica, onde é possivel registrar um b.o. tranquilamente.')),
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
                  paddingLeft: 70,
                  paddingTop: 8,
                  paddingRight: 70,
                  paddingBottom: 8,
                  colorBackground: 0xffffffff,
                  /* ou (0xffffffff)*/
                  opacity: 0.0,
                  colorText: 0xff152C42,
                  text: 'Delegacia eletrônica'),
            ),
          ],
        ),
      ),
    );
  }
}
