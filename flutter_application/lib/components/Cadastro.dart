import 'package:flutter/material.dart';

import 'templates/CadastrarBotao.dart';
import 'templates/EntrarBotao.dart';
import 'templates/EstiloTextFild.dart';
import 'templates/Logo.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 245, 244, 1),
      resizeToAvoidBottomInset: false,
      body: Center(
        heightFactor: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Usuario',
                  iconData: Icons.person,
                  obscureText: false,
                ),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Email',
                  iconData: Icons.email,
                  obscureText: false,
                ),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
