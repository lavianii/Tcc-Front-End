
import 'package:flutter/material.dart';
import 'templates/textos/paragrafo.dart';
import 'templates/cards/cards.dart';
import 'templates/textos/texto_cards_de_info.dart';
import 'templates/botoes/botao_padrao.dart';
import 'tela_denuncia_form.dart';

class TelaDenuncia extends StatefulWidget {
  const TelaDenuncia({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaDenuncia> createState() => _TelaDenunciaState();
}

class _TelaDenunciaState extends State<TelaDenuncia> {

 void carregaForm () {
  Navigator.push(
     context,
      MaterialPageRoute(
        builder: (context) => const TelaDenunciaForm())
    );
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
        padding: const EdgeInsets.fromLTRB(45, 50, 45, 0),

        child: Column(
          
          children:  [

          const  Paragrafo(
              texto: 'A denúncia serve para que ao presenciar, como vitíma ou testemunha, um furto, assalto, ou qualquer outra atividade considerada uma ameaça para a sociedade você possa compartilhar com a gente',
              padding:  0),
                  
          const    Paragrafo(
              texto: 'Os acontecimentos relatados por você em nosso questionário serão fundamentais para a construção do mapeamento.', 
              padding: 5),
            
            // card de texto
           const  Cards(
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
          const  Cards(
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
                    paddingLeft: 118, 
                    paddingTop: 10, 
                    paddingRight: 118, 
                    paddingBottom: 10, 
                    colorBackground: 0xfffffff, 
                    opacity: 0.0,
                    colorText: 0xff152C42, 
                    text: 'Denunciar',
                    funcao: carregaForm ,
                    
              ), 
            ),
          ],
        ),
      ),
    );
  }
}