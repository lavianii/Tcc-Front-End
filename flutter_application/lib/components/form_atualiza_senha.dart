import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_login.dart';
import 'templates/cards/cards.dart';
import 'templates/Inputs/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';
import './templates/botoes/botao_icone.dart';

class FormAtualizaSenha extends StatefulWidget {
  const FormAtualizaSenha({
    Key? key,
  }) : super(key: key);

  @override
  State<FormAtualizaSenha> createState() => _FormAtualizaSenha();
}

class _FormAtualizaSenha extends State<FormAtualizaSenha> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  int id = 0;
  String nome = '';
  String senhaAntiga = '';
  String email = '';

  Future<void> atualizaSenha() {
    final String senha = _formData['senhaNova'] as String;
    final String idd = id.toString();

    return http
        .put(
      Uri.parse('$_baseUrl/atualiza/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': idd,
        'nome': nome,
        'senha': senha,
        'email': email,
      }),
    )
        .then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                    'Informações atualizadas com sucesso, você será redirecionado para a tela de login'),
                actions: [
                  TextButton(
                      onPressed: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaLogin(),
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

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    // caso nao seja valido não continuo o metodo
    if (!isValid) {
      return;
    }
    //o save cada um dos campos do onSaved do form
    _formKey.currentState?.save();
    atualizaSenha();
  }

  @override
  void initState() {
    super.initState();

    loginModels.getId().then((int result) {
      setState(() {
        id = result;
      });
    });

    loginModels.getNome().then((String result) {
      setState(() {
        nome = result;
      });
    });

    loginModels.getSenha().then((String result) {
      setState(() {
        senhaAntiga = result;
      });
    });

    loginModels.getEmail().then((String result) {
      setState(() {
        email = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDFF5F4),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Atualizar senha', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 90, 25, 90),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Colors.black87,
              color: const Color(0xff77A8A6),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 35, 15, 15),
                    child: const Text(
                      'Alterar senha',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: 'Digite sua senha atual',
                            hintText: 'Digite sua senha atual',
                            iconData: Icons.lock,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            validator: (senha) {
                              final senhaa =
                                  senha ?? ''; //lidando com null safety

                              if (senhaa != senhaAntiga) {
                                return 'A senha está errada';
                              }

                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 1, 20, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: 'Digite sua nova senha',
                            iconData: Icons.lock,
                            hintText: 'Digite sua nova senha',
                            obscureText: true,
                            textInputAction: TextInputAction.send,
                            onSaved: (senhaNova) =>
                                _formData['senhaNova'] = senhaNova ?? '',
                            validator: (senha) {
                              final senhaNova =
                                  senha ?? ''; //lidando com null safety
                              if (senhaNova.trim().isEmpty) {
                                return 'A senha é obrigatoria';
                              }

                              if (senhaNova == senhaAntiga) {
                                return 'A senha é igual a antiga, digite uma nova senha';
                              }

                              return null;
                            },
                          ),
                        ),
                        Cards(
                          width: 210,
                          height: 35,
                          color: 0xffffffff,
                          marginLeft: 0,
                          marginTop: 20,
                          marginRight: 0,
                          marginBottom: 40,
                          paddingLeft: 0,
                          paddingTop: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          opacity: 0,
                          child: BotaoIcone(
                            onPressed: _submitForm,
                            text: 'Alterar',
                            width: 1000,
                            icon: Icons.arrow_forward,
                            color: 0xff152C42,
                            colorText: 0xffffffff,
                            colorIcon: 0xffffffff,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
