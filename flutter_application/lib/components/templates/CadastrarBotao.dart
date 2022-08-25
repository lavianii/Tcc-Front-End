

import 'package:flutter/material.dart';

import '../Cadastro.dart';

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
              builder: (context) => const Cadastro(),
            ),
          );
        },
        child: const Text(
          "Me cadastrar",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(21, 44, 66, 0.9),
          ),
        ),
      ),
    );
  }
}
