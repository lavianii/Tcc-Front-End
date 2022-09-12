import 'package:flutter/material.dart';
import 'templates/paragrafo.dart';



class TelaSobreDesenvolvedores extends StatelessWidget {
  const TelaSobreDesenvolvedores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desenvolvedores', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xffffffff),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50,50,50,50),
        child: Column(
          children: const [
              Paragrafo(
                texto: 'O safeWalk foi desenvolvido por alunos do curso de Desenvolvimento de Sistemas do COTUCA, e tem por finalidade compartilhar com os usuários o nível de segurança das regiões de campinas por meio de dados fornecidos pelos própios usuários.',
                padding: 2,
              ),
          ],
        ),
      ),
    );
  }
}
