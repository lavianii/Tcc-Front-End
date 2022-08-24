// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../components/templates/EntrarBotao.dart';
import '../components/templates/Logo.dart';

import 'templates/EstiloTextFild.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(223, 245, 244, 1),
            child: Column(
              children: const [
                EstiloTextFild(
                  label: 'Usuario',
                  iconData: Icons.person,
                ),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Email',
                  iconData: Icons.mail_outline,
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
