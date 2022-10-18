import 'package:flutter/material.dart';
import 'templates/cards/cards.dart';
import 'templates/botoes/botao_padrao.dart';

class TelaInfsDoUsuario extends StatefulWidget {
  const TelaInfsDoUsuario({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaInfsDoUsuario> createState() => _TelaInfsDoUsuarioState();
}

class _TelaInfsDoUsuarioState extends State<TelaInfsDoUsuario> {

  void teste(){
    print('apertei');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffDFF5F4),
      appBar: AppBar(

        title: const Text('Dados', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),

      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(25,50,25,50),
        child: Column(
             children: [

              Card(
                elevation: 10, 
                shadowColor: Colors.black87,
                color: const Color(0xff77A8A6),

                child: Column(
                  children: [
                    Container(
                    padding:const  EdgeInsets.only(top:  0),
                    child: Column(
                        children: [

                          //container foto
                          Container(
                            margin: const EdgeInsets.fromLTRB(0,10,0,30),
                            alignment: const Alignment(0,0),
                            width: 300,
                            height: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    //inputs
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10), 
                        height: 50, 
                        width: 300,
                        child: const TextField(
                          decoration: InputDecoration(
                            label:  Text('E-mail:')
                          ),
                        ),
                      ),

                       Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10), 
                        height: 50, 
                        width: 300,
                        child:   const TextField(
                          decoration: InputDecoration(
                            label:  Text('Nome:')
                          ),
                        ),
                      ),
 
                    //card com botao
                      Cards(
                        width: 320,
                        height: 35,
                        color: 0xffffffff,
                        marginLeft: 0,
                        marginTop: 40,
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
                            text: 'Atualizar',
                            funcao: teste),
                    ),
                  ],
                ),
              ),
            ],
         ),
      ),
    );
  }
}




