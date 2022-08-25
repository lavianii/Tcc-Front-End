
import 'package:flutter/material.dart';
import 'package:flutter_application/components/templates/Paragrafo.dart';
import 'package:flutter_application/components/templates/Cards.dart';
import 'package:flutter_application/components/templates/TextoCardsDeInfo.dart';
import 'package:flutter_application/components/templates/BotaoPadrao.dart';


class TelaDenuncia extends StatelessWidget {
  const TelaDenuncia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(0xffDFF5F4),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Paragrafo(
              texto: 'A denúncia serve para que ao presenciar, como vitíma ou testemunha, um furto, assalto, ou qualquer outra atividade considerada uma ameaça para a sociedade você possa compartilhar com a gente',
              padding:  5),
                  
            Paragrafo(
              texto: 'Os acontecimentos relatados por você em nosso questionário serão fundamentais para a construção do mapeamento.', 
              padding: 5),

            Cards(
              width: 300, 
              height: 180, 
              color: 0xff77A8A6,
              opacity: 0.30,
              marginLeft: 0,
              marginBottom: 0,
              marginRight: 0,
              marginTop: 25,
              paddingLeft: 30,
              paddingTop: 60,
              paddingRight: 30,
              paddingBottom:60 ,
              child: TextoCardsDeInfo(texto: 'O Boletim de Ocorrência é importante?'),
              ),
              Cards(
                width: 300, 
                height: 45, 
                color: 0xff77A8A6, 
                marginLeft: 0, 
                marginTop: 50, 
                marginRight: 0, 
                marginBottom: 0, 
                paddingLeft: 0, 
                paddingTop: 0, 
                paddingRight: 0, 
                paddingBottom: 0,
                opacity: 0,
                child: 
                  BotaoPadrao(
                paddingLeft: 103, 
                paddingTop: 15, 
                paddingRight: 103, 
                paddingBottom: 15, 
                colorBackground: 0xff77A8A6, 
                colorText: 0xffffffff, 
                text: 'Denunciar'
              ), 
               )
          ],
        ),
      ),
    ));
  }
}