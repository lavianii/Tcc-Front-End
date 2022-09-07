import 'package:flutter/material.dart';
import 'tela_denuncia.dart';
import 'tela_boletim_de_ocorrencia.dart';
import 'templates/cards_bairros.dart';


class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _tela_inicial();
}

class _tela_inicial extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      backgroundColor:const  Color(0xff77A8A6),
      appBar: AppBar(
       backgroundColor: const Color(0xff77A8A6),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xffDFF5F4),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             
            const UserAccountsDrawerHeader(
              arrowColor: const Color(0xffDFF5F4) ,
              accountEmail: Text("Teste@email.com"),
              accountName: Text("Teste"),
              currentAccountPicture: CircleAvatar(
                child: Text("TS"),
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

          //Favoritos ***** ainda nao tenho 
            ListTile(
              leading: const Icon(Icons.star_rate_outlined),
              title: const Text("Favoritos"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const TelaInicial(),
                   ),
                 );
              },
            ),

          //Tela denuncia 
            ListTile(
              leading: const Icon(Icons.error_outline),
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

          //Tela estresse pos traumatico **** ainda nao tenho
            ListTile(
              leading: const Icon(Icons.info_outline ),
              title: const Text("Estresse pós-traumatico"),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => const TelaDenuncia(),
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