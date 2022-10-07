import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_cadastro.dart';
import 'tela_denuncia.dart';
import 'tela_boletim_de_ocorrencia.dart';
import 'templates/cards/cards_bairros.dart';
import 'tela_estresse_pos_traumatico.dart';
import 'tela_infs_do_usuario.dart';
import 'tela_sobre_desenvolvedores.dart';
import 'tela_favoritos.dart';
import 'select_exemplo.dart';


class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {


  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      backgroundColor:const  Color(0xff77A8A6),
      appBar: AppBar(
       backgroundColor: const Color(0xff77A8A6),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xffffffff),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             
             UserAccountsDrawerHeader(
              
              accountEmail: const  Text(
                "Teste@email.com",
                style: TextStyle(color: Color(0xff000000),fontSize:  14)
                ),

              accountName: const Text(
                "Teste",
                style: TextStyle(color: Color(0xff000000),fontSize:  14)
                ),

              currentAccountPicture: const  CircleAvatar(
                backgroundColor:  Color(0xffffffff) ,
                child: Text("TS"),
              ),

              onDetailsPressed: () {
                Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => const TelaInfsDoUsuario(),
                  ),
                );
              },

              decoration: const BoxDecoration(
                color:  Color(0xffDFF5F4),
              ),
            ),

          //Tela inicial
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => const TelaInicial(),
                  ),
                );
              },
            ),

          //Favoritos
            ListTile(
              leading: const Icon(Icons.star_rate_outlined),
              title: const Text("Favoritos"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const TelaFavoritos(),
                   ),
                 );
              },
            ),

          //Tela denuncia 
            ListTile(
              leading: const Icon(Icons.warning_amber_rounded),
              title: const Text("Denuncia"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaDenuncia(),
                  ),
               );
              },
            ),

          //Tela estresse pos traumatico 
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_outlined ),
              title: const Text("Estresse pós-traumatico"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => const TelaEstressePosTraumatico(),
                    ),
                  );
               },
             ),

            //Boletim de ocorrencia 
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined ),
              title:  const Text("Boletim de ocorrência"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => const TelaBoletimDeOcorrencia(),
                    ),
                  );
               },
             ),

            //Tela sobre os devs
             ListTile(
              leading: const Icon(Icons.developer_mode_outlined ),
              title:  const Text("Desenvolvedores"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => const TelaSobreDesenvolvedores(),
                    ),
                  );
               },
             ),

              ListTile(
              leading: const Icon(Icons.supervised_user_circle_outlined),
              title: const Text("**Form Cadastro"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const TelaCadastro(),
                   ),
                 );
              },
            ),
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_outlined),
              title: const Text("**Select"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const SelectExemplo(),
                   ),
                 );
              },
            ),
           ],
         ),
       ),
       body: SingleChildScrollView(
        child: Stack(
          children: [
           Center(
            
            child: Column( 

              children: const  [

                Padding(
                  padding: EdgeInsets.fromLTRB(0,20,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xffF03E44,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Alta Periculosidade',
                    ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0,20,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xffF03E44,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Alta Periculosidade',
                    ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xffF0913E,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Media Periculosidade',
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xffF0913E,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Media Periculosidade',
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xff78CF46,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Baixa Periculosidade',
                   ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,20),
                  child: CardsBairros(
                    colorSuperior: 0xff78CF46,
                    colorInferior: 0xffffffff,
                    borderRadius: 4,
                    width: 300,
                    height: 60,
                    paddingSuperior: 15,
                    textInferior: 'Vila mimosa',
                    textSuperior: 'Baixa Periculosidade',
                   ),
                  ),
                ],
              )
            ),
         ],
        ),
       ),
      )
    );
  }
}