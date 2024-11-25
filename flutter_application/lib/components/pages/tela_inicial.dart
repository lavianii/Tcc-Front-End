import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/lista_bairros_controller.dart';
import 'package:flutter_application/controllers/localizacao_controller.dart';
import 'package:flutter_application/controllers/login_controller.dart';
import 'barra_pesquisa.dart';
import 'tela_denuncia.dart';
import 'tela_boletim_de_ocorrencia.dart';
import '../templates/cards/cards_bairros.dart';
import 'tela_estresse_pos_traumatico.dart';
import 'tela_sobre_desenvolvedores.dart';
import '../../models/bairros_models.dart';
import 'tela_conta.dart';
import 'tela_mapa.dart';


LoginController loginModels = LoginController();
Localizacao localizacao = Localizacao();
ListaBairros bairros = ListaBairros();


class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {

  late Future<List<Bairro>> bairroData;
  String email = '';
  String nome = '';
  double longitude = 0;
  double latitude = 0;

  @override
  void initState() {
    super.initState();

    bairroData = bairros.getBairrosTelaInicial();

    localizacao.getlocalizacao().then((value) => setState(() {
          longitude = value.longitude;
          latitude = value.latitude;
        }));

    loginModels.getEmail().then((String result) {
      setState(() {
        email = result;
      });
    });

    loginModels.getNome().then((String result) {
      setState(() {
        nome = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(0xff77A8A6),
      appBar: AppBar(
        backgroundColor: const Color(0xff77A8A6),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: BarraDePesquisa());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xffffffff),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text(email,
                  style:
                      const TextStyle(color: Color(0xff000000), fontSize: 14)),
              accountName: Text(nome,
                  style:
                      const TextStyle(color: Color(0xff000000), fontSize: 14)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://xsgames.co/randomusers/assets/avatars/female/48.jpg'),
                backgroundColor: Color(0xffffffff),
              ),
              decoration: const BoxDecoration(
                color: Color(0xffDFF5F4),
              ),
            ),
            //inicial
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
             //conta
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Conta"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaConta(),
                  ),
                );
              },
            ),
            //mapa
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text("Mapa"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TelaMapa(longitude: longitude, latitude: latitude),
                  ),
                );
              },
            ),
            //denuncia
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
            //estresse pos traumatico
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_outlined),
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
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text("Boletim de ocorrência"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaBoletimDeOcorrencia(),
                  ),
                );
              },
            ),

            //sobre os devs
            ListTile(
              leading: const Icon(Icons.developer_mode_outlined),
              title: const Text("Desenvolvedores"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaSobreDesenvolvedores(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Bairro>>(
          future: bairroData,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Bairro> data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String text = 'baixa Periculosidade';
                    int color = 0xff78CF46;

                    if (data[index].qtd >= 10) {
                      color = 0xffF03E44;
                      text = 'Alta periculosidade';
                    }
                    if (data[index].qtd >= 5 && data[index].qtd < 10) {
                      color = 0xffF0913E;
                      text = 'Media Periculosidade';
                    }

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title:  Text(data[index].bairro.toString()),
                              content: Text(' Número de denuncias: '+ data[index].qtd.toString() ) ,
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CardsBairros(
                          colorSuperior: color,
                          colorInferior: 0xffffffff,
                          borderRadius: 4,
                          width: 300,
                          height: 60,
                          paddingSuperior: 15,
                          textInferior: data[index].bairro,
                          textSuperior: text,
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    ));
  }
}
