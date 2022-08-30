import 'package:flutter/material.dart';

import 'templates/cadastrar_botao.dart';
import 'templates/entrar_botao.dart';
import 'templates/estilo_text_fild.dart';
import 'templates/logo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                const EstiloTextFild(
                  label: 'Email',
                  iconData: Icons.email_rounded,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                const EstiloTextFild(
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                EntrarBotao(
                  text: 'Entrar',
                  funcao: () {},
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
}
