import 'package:flutter/material.dart';

import '../../tela_cadastro.dart';

class CadastrarBotao extends StatelessWidget {
  const CadastrarBotao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TelaCadastro(),
            ),
          );
        },
        child: const Text(
          "Me cadastrar",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff152C42),
          ),
        ),
      ),
    );
  }
}
