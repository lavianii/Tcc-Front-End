import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_login.dart';
import 'templates/botoes/entrar_botao.dart';
import 'templates/textos/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _CadastroState();
}

class _CadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  Future<void> criaUsuario() {
    final String nome = _formData['nome'] as String;
    final String senha = _formData['senha'] as String;
    final String email = _formData['email'] as String;

    return http
        .post(
      Uri.parse('$_baseUrl/incluir'),
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
                title: const Text('Usuario criado com sucesso'),
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
                        builder: (context) => const TelaLogin(),
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
    criaUsuario();
  }

  bool _isValidEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDFF5F4),
        title: Row(
          children: [
            Image.asset(
              'lib/components/assets/images/logo2.png',
              height: 50,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffDFF5F4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  EstiloTextFild(
                    label: 'Nome',
                    hintText: 'Digite o nome',
                    iconData: Icons.person,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    onSaved: (nome) => _formData['nome'] = nome ?? '',
                    validator: (_nome) {
                      final name = _nome ?? ''; //lidando com null safety

                      if (name.trim().isEmpty) {
                        return 'O Nome é obrigatorio';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  EstiloTextFild(
                    label: 'Senha',
                    hintText: 'Digite a senha',
                    iconData: Icons.lock,
                    obscureText: true,
                    onSaved: (senha) => _formData['senha'] = senha ?? '',
                    validator: (_senha) {
                      final senha = _senha ?? ''; //lidando com null safety

                      if (senha.trim().isEmpty) {
                        return 'A senha é obrigatoria';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  EstiloTextFild(
                    label: 'email',
                    hintText: 'Digite o email',
                    iconData: Icons.email_rounded,
                    obscureText: false,
                    onSaved: (email) => _formData['email'] = email ?? '',
                    validator: (_email) {
                      final email = _email ?? ''; //lidando com null safety
                      if (!_isValidEmail(email)) {
                        return 'email Invalido';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) => _submitForm(),
                  ),
                  const SizedBox(height: 100),
                  EntrarBotao(
                    text: 'Cadastrar',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
