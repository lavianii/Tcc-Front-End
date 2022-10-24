import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_login.dart';
import 'templates/cards/cards.dart';
import 'templates/Inputs/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';
import 'templates/botoes/botao_icone.dart';

class FormAtualizaUsuario extends StatefulWidget {
  const FormAtualizaUsuario({
    Key? key,
  }) : super(key: key);

  @override
  State<FormAtualizaUsuario> createState() => _FormAtualizaUsuario();
}

class _FormAtualizaUsuario extends State<FormAtualizaUsuario> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
  int id = 0;
  String nome = '';
  String senha = '';
  String email = '';

  Future<void> atualizaUsuario() {
    final String nome = _formData['nome'] as String;
    final String email = _formData['email'] as String;
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
    atualizaUsuario();
  }

  bool _isValidEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
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
        senha = result;
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
        title: const Text('Atualiza dados', style: TextStyle(fontSize: 17)),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 1, 20, 15),
                          height: 50,
                          width: 280,
                          child: EstiloTextFild(
                            label: nome,
                            hintText: 'Digite o nome',
                            iconData: Icons.person,
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            onSaved: (nome) => _formData['nome'] = nome ?? '',
                            validator: (nomee) {
                              final name =
                                  nomee ?? ''; //lidando com null safety

                              if (name.trim().isEmpty) {
                                return 'O Nome é obrigatorio';
                              }

                              return null;
                            },
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 2, 20, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: email,
                            iconData: Icons.email,
                            hintText: 'Digite o email',
                            obscureText: false,
                            onFieldSubmitted: (_) => _submitForm(),
                            onSaved: (email) =>
                                _formData['email'] = email ?? '',
                            validator: (emaill) {
                              final email =
                                  emaill ?? ''; //lidando com null safety
                              if (!_isValidEmail(email)) {
                                return 'email Invalido';
                              }
                              return null;
                            },
                          ),
                        ),

                        //card com botao
                        Cards(
                            width: 200,
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
                              text: 'Atualizar',
                              width: 1000,
                              icon: Icons.arrow_forward,
                              color: 0xff152C42,
                              colorText: 0xffffffff,
                              colorIcon: 0xffffffff,
                            )),
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
