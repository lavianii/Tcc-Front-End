import 'package:flutter/material.dart';
import 'templates/entrar_botao.dart';
import 'templates/estilo_text_fild.dart';

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
        backgroundColor: const Color(0xffDFF5F4),
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
        color: const Color(0xffDFF5F4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                const SizedBox(height: 15),
                const EstiloTextFild(
                  label: 'Nome',
                  iconData: Icons.person,
                  obscureText: false,
                ),
                const SizedBox(height: 100),
                EntrarBotao(
                  text: 'Cadastrar',
                  funcao: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
