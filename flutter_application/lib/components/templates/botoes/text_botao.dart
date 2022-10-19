import 'package:flutter/material.dart';

import '../../tela_cadastro.dart';

class TextBotao extends StatelessWidget {
  const TextBotao({Key? key, required}) : super(key: key);

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
            fontSize: 17,
            color: Color(0xff152C42),
          ),
        ),
      ),
    );
  }
}
