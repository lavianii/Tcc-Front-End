import 'package:flutter/material.dart';
import 'package:flutter_application/models/login_models.dart';
import 'barra_pesquisa.dart';
import 'tela_denuncia.dart';
import 'tela_boletim_de_ocorrencia.dart';
import 'templates/cards/cards_bairros.dart';
import 'tela_estresse_pos_traumatico.dart';
import 'tela_infs_do_usuario.dart';
import 'tela_sobre_desenvolvedores.dart';
import 'tela_favoritos.dart';
import 'dart:convert';
import '../models/bairros.dart';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

Future<List<Bairro>> getBairros() async {
  final response = await http.get(Uri.parse('$_baseUrl/recuperabairro'),
      headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    List bairros = json.decode(response.body);
    return bairros.map((data) => Bairro.fromJson(data)).toList();
  } else {
    throw Exception('Erro inesperado...');
  }
}

List<Usuario> usuario = List<Usuario>.empty();
LoginModels loginModels = LoginModels();
String email = '';

Future<void> getUser() async {
  Iterable user = await loginModels.getUsuario();
  usuario = user.map((model) => Usuario.fromJson(model)).toList();
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicial();
}

class _TelaInicial extends State<TelaInicial> {
  late Future<List<Bairro>> bairroData;

  Future<bool> verificarUsuario() async {
    final usuario = await loginModels.getUsuario();

    if (usuario.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();

    bairroData = getBairros();
    getUser().then((e) {
      email = usuario.map((e) => e.email).toString();
    });

    verificarUsuario().then(
      (temUsuario) => {
        if (temUsuario)
          {
            print('tem usuario '),
          }
        else
          {
            print("não tem usuario"),
          }
      },
    );
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
          }, icon: const Icon(Icons.search)),
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
              accountName: const Text("Teste",
                  style: TextStyle(color: Color(0xff000000), fontSize: 14)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color(0xffffffff),
                child: Text("TS"),
              ),
              decoration: const BoxDecoration(
                color: Color(0xffDFF5F4),
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
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Conta"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaInfsDoUsuario(),
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

            //Tela sobre os devs
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
