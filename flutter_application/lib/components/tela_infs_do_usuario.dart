import 'package:flutter/material.dart';
import 'templates/cards/cards.dart';
import 'templates/botoes/botao_padrao.dart';
import './templates/textos/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';

class TelaInfsDoUsuario extends StatefulWidget {
  const TelaInfsDoUsuario({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaInfsDoUsuario> createState() => _TelaInfsDoUsuarioState();
}

class _TelaInfsDoUsuarioState extends State<TelaInfsDoUsuario> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
  String id = '';

  Future<void> criaUsuario() {
    final String nome = _formData['nome'] as String;
    final String senha = _formData['senha'] as String;
    final String email = _formData['email'] as String;

    return http
        .put(
      Uri.parse('$_baseUrl/atualiza/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'senha': senha,
        'email': email,
      }),
    )
        .then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Informações atualizadas com sucesso'),
                actions: [
                  TextButton(
                      onPressed: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaInicial(),
                            ),
                          )),
                      child: const Text('ok'))
                ],
              ));
    }).catchError((error) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ocorreu um erro'),
          content: Text(error.toString()),
          actions: [
            TextButton(
                onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaInicial(),
                      ),
                    )),
                child: const Text('ok'))
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
        loginModels.getNome().then((String result) {
      setState(() {
        id = result;
      });
    });
  }

  void teste() {
    print('apertei');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFF5F4),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Dados', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 130, 25, 130),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Colors.black87,
              color: const Color(0xff77A8A6),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: [
                        //container foto
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                          alignment: const Alignment(0, 0),
                          width: 500,
                          height: 125,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://xsgames.co/randomusers/assets/avatars/female/48.jpg'))),
                        ),
                      ],
                    ),
                  ),

                  //inputs
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    height: 50,
                    width: 300,
                    child: EstiloTextFild(),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    height: 50,
                    width: 300,
                    child: const TextField(
                      decoration: InputDecoration(label: Text('Nome:')),
                    ),
                  ),

                  //card com botao
                  Cards(
                    width: 310,
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
                        paddingLeft: 127,
                        paddingTop: 8,
                        paddingRight: 126,
                        paddingBottom: 10,
                        colorBackground: 0xffffffff,
                        opacity: 0.0,
                        colorText: 0xff152C42,
                        text: 'Atualizar',
                        funcao: teste),
                  ),

                  Cards(
                    width: 310,
                    height: 35,
                    color: 0xffffffff,
                    marginLeft: 0,
                    marginTop: 10,
                    marginRight: 0,
                    marginBottom: 30,
                    paddingLeft: 0,
                    paddingTop: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    opacity: 0,
                    child: BotaoPadrao(
                        paddingLeft: 106,
                        paddingTop: 8,
                        paddingRight: 107,
                        paddingBottom: 10,
                        colorBackground: 0xffffffff,
                        opacity: 0.0,
                        colorText: 0xff152C42,
                        text: 'Remover Conta',
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
