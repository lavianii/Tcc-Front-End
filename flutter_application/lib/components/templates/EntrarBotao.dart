import 'package:flutter/material.dart';

class EntrarBotao extends StatelessWidget {
  const EntrarBotao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        child: const Text('Entrar'),
        onPressed: () {},
      ),
    );
  }
}
