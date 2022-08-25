import 'package:flutter/material.dart';
import 'templates/EntrarBotao.dart';
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 241, 240),
        elevation: 0,
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
        color: const Color.fromARGB(255, 221, 241, 240),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
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
                  iconData: Icons.email_rounded,
                  obscureText: false,
                ),
                SizedBox(height: 15),
                EstiloTextFild(
                  label: 'Senha',
                  iconData: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 100),
                EntrarBotao(text: 'Cadastrar')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
