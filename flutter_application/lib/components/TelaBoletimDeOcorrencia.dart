import 'package:flutter/material.dart';
import 'package:flutter_application/components/templates/Paragrafo.dart';
import 'package:flutter_application/components/templates/Cards.dart';
import 'package:flutter_application/components/templates/TextoCardsDeInfo.dart';

class TelaBoletimDeOcorrencia extends StatelessWidget {
  const TelaBoletimDeOcorrencia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 15, 45, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Paragrafo(
              texto: 'Grande parte dos brasileiros só registra um boletim de ocorrência em casos graves.',
              padding:  5),
                  
            Paragrafo(
              texto: 'Isso acontece porque não sabem a importância de registrar um B.O. Ele é responável por notificar as autoridades policiais e judiciais sobre a situação da criminalidade na região.', 
              padding: 5),

            Paragrafo(
              texto: 'É mais do que apenas recuperar um bem roubado, por exemplo, é colaborar para um bem coletivo.', 
              padding: 5),
            
            Paragrafo(
              texto: 'O link abaixo te redicionara para a Delegacia eletrônica, onde é possivel registrar um b.o. tranquilamente.', 
              padding: 5),
            
            Cards(
              width: 300, 
              height: 180, 
              color: 0xff77A8A6,
              opacity: 0.30,
              marginLeft: 0,
              marginBottom: 0,
              marginRight: 0,
              marginTop: 35,
              paddingLeft: 30,
              paddingTop: 60,
              paddingRight: 30,
              paddingBottom:60 ,
              child: TextoCardsDeInfo(texto: 'Link')
            )
          ],
        ),
      ),
    ));
  }
}