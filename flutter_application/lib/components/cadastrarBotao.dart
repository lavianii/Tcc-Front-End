import 'package:flutter/material.dart';

class CadastrarBotao extends StatelessWidget {
  const CadastrarBotao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
      child: TextButton(
        onPressed: () {},
        child: const Text("Cadastrar"),
      ),
    );
  }
}
