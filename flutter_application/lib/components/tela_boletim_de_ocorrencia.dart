import 'package:flutter/material.dart';
import 'templates/textos/texto_cards_de_info.dart';
import 'templates/cards/cards.dart';
import 'templates/textos/paragrafo.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaBoletimDeOcorrencia extends StatelessWidget {
  const TelaBoletimDeOcorrencia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Boletim de Ocorrencia', style: TextStyle(fontSize: 17)),
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
                    'Grande parte dos brasileiros só registra um boletim de ocorrência em casos graves.',
                padding: 5),
            const Paragrafo(
                texto:
                    'Isso acontece porque não sabem a importância de registrar um B.O. Ele é responável por notificar as autoridades policiais e judiciais sobre a situação da criminalidade na região.',
                padding: 5),
            const Paragrafo(
                texto:
                    'É mais do que apenas recuperar um bem roubado, por exemplo, é colaborar para um bem coletivo.',
                padding: 5),
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.delegaciaeletronica.policiacivil.sp.gov.br/ssp-de-cidadao/pages/comunicar-ocorrencia');

                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Não foi possivel acessar a Url:  $url';
                }
              },
              child: const Cards(
                  width: 300,
                  height: 190,
                  color: 0xff77A8A6,
                  opacity: 0.40,
                  marginLeft: 0,
                  marginBottom: 0,
                  marginRight: 0,
                  marginTop: 35,
                  paddingLeft: 30,
                  paddingTop: 50,
                  paddingRight: 30,
                  paddingBottom: 50,
                  child: TextoCardsDeInfo(
                      texto:
                          'Clique aqui e sera redicionado para a Delegacia eletrônica, onde é possivel registrar um B.O tranquilamente.')),
            ),
          ],
        ),
      ),
    );
  }
}
