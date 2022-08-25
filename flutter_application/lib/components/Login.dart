import 'package:flutter/material.dart';

import 'templates/CadastrarBotao.dart';
import 'templates/EntrarBotao.dart';
import 'templates/EstiloTextFild.dart';
import 'templates/Logo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(119, 168, 166, 1),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Logo(),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Usuario',
                  iconData: Icons.person,
                  obscureText: false,
                ),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 100),
                EntrarBotao(text: 'Entrar'),
                SizedBox(height: 150),
                CadastrarBotao()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
