import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_login.dart';
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
   int id = 0;
   String nome = '';
   String senha = '';
   String email = '';

  Future<void> atualizaUsuario() {
    final String nome = _formData['nome'] as String;
    final String senha = _formData['senha'] as String;
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

 Future<void> removeUsuario(){

 return http.delete(
      Uri.parse('$_baseUrl/remove/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                    'Sua conta foi removida, você será redirecionado para a tela de login'),
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
  void _submitRemove() {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const  Text('Excluir Conta'),
        content: const  Text('Tem certeza que deseja excluir sua conta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:const  Text('cancelar'),
          ),
          TextButton(
            onPressed: removeUsuario,
            child: const Text('Sim'),
          ),
        ],
      ),
    );
    
    // removeUsuario();
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
      print(result);
      setState(() {
        id = result;
      });
    });

    loginModels.getNome().then((String result) {
      print(result);
      setState(() {
        nome = result;
      });
    });

    loginModels.getSenha().then((String result) {
      print(result);
      setState(() {
        senha = result;
      });
    });

    loginModels.getEmail().then((String result) {
      print(result);
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
        title: const Text('Dados', style: TextStyle(fontSize: 17)),
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
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: nome,
                            hintText: 'Digite o nome',
                            iconData: Icons.person,
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            onSaved: (nome) => _formData['nome'] = nome ?? '',
                            validator: (_nome) {
                              final name =
                                  _nome ?? ''; //lidando com null safety

                              if (name.trim().isEmpty) {
                                return 'O Nome é obrigatorio';
                              }

                              return null;
                            },
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: email,
                            iconData: Icons.email,
                            hintText: 'Digite o email',
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            onSaved: (email) =>
                                _formData['email'] = email ?? '',
                            validator: (_email) {
                              final email =
                                  _email ?? ''; //lidando com null safety
                              if (!_isValidEmail(email)) {
                                return 'email Invalido';
                              }
                              return null;
                            },
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          height: 50,
                          width: 300,
                          child: EstiloTextFild(
                            label: senha,
                            hintText: 'Digite a senha',
                            iconData: Icons.lock,
                            obscureText: false,
                            onSaved: (senha) =>
                                _formData['senha'] = senha ?? '',
                            validator: (_senha) {
                              final senha =
                                  _senha ?? ''; //lidando com null safety

                              if (senha.trim().isEmpty) {
                                return 'A senha é obrigatoria';
                              }

                              return null;
                            },
                            onFieldSubmitted: (_) => _submitForm(),
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
                              funcao: _submitForm),
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
                              funcao: _submitRemove),
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
