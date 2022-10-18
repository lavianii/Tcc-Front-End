import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/tela_inicial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'templates/botoes/cadastrar_botao.dart';
import 'templates/botoes/entrar_botao.dart';
import 'templates/textos/estilo_text_fild.dart';
import 'templates/logo.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _LoginState();
}

class _LoginState extends State<TelaLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff77A8A6),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Logo(),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: EstiloTextFild(
                    controller: _emailController,
                    label: 'Email',
                    iconData: Icons.email_rounded,
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 15),
                EstiloTextFild(
                  controller: _senhaController,
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                EntrarBotao(
                  text: 'Entrar',
                  onPressed: logar,
                ),
                const SizedBox(height: 150),
                const CadastrarBotao()
              ],
            ),
          ),
        ),
      ),
    );
  }

  logar() async {
    var urlLogin = Uri.parse(
      "https://back-end-tcc-deploy.lavianii.repl.co/login/${_emailController.text}/${_senhaController.text}",
    );
    await http.get(
      urlLogin,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        Iterable usuario = json.decode(value.body);
        loginModels.saveUsuario(usuario);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TelaInicial(),
          ),
        );
      } else if (value.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("e-mail ou senha inválidos"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      }
    });
  }
}
