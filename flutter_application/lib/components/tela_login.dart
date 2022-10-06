import 'package:flutter/material.dart';

import 'templates/botoes/cadastrar_botao.dart';
import 'templates/botoes/entrar_botao.dart';
import 'templates/textos/estilo_text_fild.dart';
import 'templates/logo.dart';

class tela_login extends StatefulWidget {
  const tela_login({Key? key}) : super(key: key);

  @override
  State<tela_login> createState() => _LoginState();
}

class _LoginState extends State<tela_login> {
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
                 EstiloTextFild(
                  label: 'Email',
                  iconData: Icons.email_rounded,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                 EstiloTextFild(
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 100),
                EntrarBotao(
                  text: 'Entrar',
                  onPressed: () {},
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
