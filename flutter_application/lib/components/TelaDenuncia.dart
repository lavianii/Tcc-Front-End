
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
        padding: const EdgeInsets.fromLTRB(45, 50, 45, 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Paragrafo(
              texto: 'A denúncia serve para que ao presenciar, como vitíma ou testemunha, um furto, assalto, ou qualquer outra atividade considerada uma ameaça para a sociedade você possa compartilhar com a gente',
              padding:  5),
                  
            Paragrafo(
              texto: 'Os acontecimentos relatados por você em nosso questionário serão fundamentais para a construção do mapeamento.', 
              padding: 5),
            
            // card de texto
            Cards(
              width: 300, 
              height: 120, 
              color: 0xff77A8A6,
              opacity: 0.30,
              marginLeft: 0,
              marginBottom: 0,
              marginRight: 0,
              marginTop: 25,
              paddingLeft: 30,
              paddingTop: 37,
              paddingRight: 30,
              paddingBottom:37 ,
              child: TextoCardsDeInfo(texto: 'O Boletim de Ocorrência é importante?'),
            ),

            //card de texto
            Cards(
              width: 300, 
              height: 110, 
              color: 0xff77A8A6,
              opacity: 0.30,
              marginLeft: 0,
              marginBottom: 0,
              marginRight: 0,
              marginTop: 20,
              paddingLeft: 30,
              paddingTop: 37,
              paddingRight: 30,
              paddingBottom:37 ,
              child: TextoCardsDeInfo(texto: 'Denuncie e contribua com nosso banco de dados!')

            ),

            //card para alinhar o botao
              Cards(
                width: 300, 
                height: 35, 
                color: 0xff77A8A6, 
                marginLeft: 0, 
                marginTop: 0, 
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
                    paddingTop: 10, 
                    paddingRight: 103, 
                    paddingBottom: 10, 
                    colorBackground: 0xffDFF5F4, 
                    opacity: 0.90,
                    colorText: 0xffffffff, 
                    text: 'Denunciar',
                    
              ), 
            ),
          ],
        ),
      ),
    ));
  }
}