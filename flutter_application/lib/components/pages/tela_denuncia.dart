import 'package:flutter/material.dart';
import '../templates/textos/paragrafo.dart';
import '../templates/cards/cards.dart';
import '../templates/textos/texto_cards_de_info.dart';
import 'tela_denuncia_form.dart';
import 'tela_boletim_de_ocorrencia.dart';


class TelaDenuncia extends StatefulWidget {
  const TelaDenuncia({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaDenuncia> createState() => _TelaDenunciaState();
}

class _TelaDenunciaState extends State<TelaDenuncia> {
  @override
  void initState() {
    super.initState();

    listaBairros.getBackEnd();
  
  }

  void carregaForm() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TelaDenunciaForm()));
  }

  void carregaBoletimDeOcorrencia() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TelaBoletimDeOcorrencia()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denuncia', style: TextStyle(fontSize: 17)),
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
                    'A denúncia serve para que ao presenciar, como vitíma ou testemunha, um furto, assalto, ou qualquer outra atividade considerada uma ameaça para a sociedade você possa compartilhar com a gente',
                padding: 0),

            const Paragrafo(
                texto:
                    'Os acontecimentos relatados por você em nosso questionário serão fundamentais para a construção do mapeamento.',
                padding: 5),

            // card de texto
            InkWell(
              onTap: carregaBoletimDeOcorrencia,
              child: const Cards(
                width: 300,
                height: 135,
                color: 0xff77A8A6,
                opacity: 0.40,
                marginLeft: 0,
                marginBottom: 0,
                marginRight: 0,
                marginTop: 25,
                paddingLeft: 30,
                paddingTop: 45,
                paddingRight: 30,
                paddingBottom: 45,
                child: TextoCardsDeInfo(
                    texto: 'O Boletim de Ocorrência é importante?'),
              ),
            ),

            //card de texto
            InkWell(
              onTap: carregaForm,
              child: const Cards(
                  width: 300,
                  height: 135,
                  color: 0xff77A8A6,
                  opacity: 0.40,
                  marginLeft: 0,
                  marginBottom: 0,
                  marginRight: 0,
                  marginTop: 20,
                  paddingLeft: 30,
                  paddingTop: 37,
                  paddingRight: 30,
                  paddingBottom: 37,
                  child: TextoCardsDeInfo(
                      texto:
                          ' Clique aqui! Denuncie e contribua com nosso banco de dados!')),
            )

            //card para alinhar o botao
          ],
        ),
      ),
    );
  }
}
