import 'package:flutter/material.dart';
import './templates/cards/cards.dart';
import 'form_atualiza_usuario.dart';
import './templates/cards/cards_conta.dart';
import 'tela_inicial.dart';
import 'tela_login.dart';
import 'package:http/http.dart' as http;
import 'form_atualiza_senha.dart';

class TelaConta extends StatefulWidget {
  const TelaConta({super.key});

  @override
  State<TelaConta> createState() => _TelaContaState();
}

class _TelaContaState extends State<TelaConta> {
  int id = 0;
  String nome = '';
  String email = '';

  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  void carregaFormInfs() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FormAtualizaUsuario()));
  }

  void carregaFormSenha() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FormAtualizaSenha()));
  }

  void _submitRemove() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Conta'),
        content: const Text('Tem certeza que deseja excluir sua conta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('cancelar'),
          ),
          TextButton(
            onPressed: removeUsuario,
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }

  Future<void> removeUsuario() {
    return http.delete(
      Uri.parse('$_baseUrl/remove/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                    'Sua conta foi removida, você será redirecionado para a tela de login'),
                actions: [
                  TextButton(
                      onPressed: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaLogin(),
                            ),
                          )),
                      child: const Text('ok'))
                ],
              ));
    }).catchError((error) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ocorreu um erro'),
          content: Text(error.toString()),
          actions: [
            TextButton(
                onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaInicial(),
                      ),
                    )),
                child: const Text('ok'))
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    loginModels.getId().then((int result) {
      setState(() {
        id = result;
      });
    });

    loginModels.getNome().then((String result) {
      setState(() {
        nome = result;
      });
    });

    loginModels.getEmail().then((String result) {
      setState(() {
        email = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Conta', style: TextStyle(fontSize: 17)),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(
                      color: const Color.fromARGB(95, 212, 212, 212))),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: 90,
                      height: 125,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://xsgames.co/randomusers/assets/avatars/female/48.jpg')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,40,0,0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nome,
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold ),
                          ),
                          Text(
                            email,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
                onTap: carregaFormInfs,
                child: CardsConta(
                  width: 400,
                  height: 60,
                  color: 0xffffffff,
                  text: 'Alterar dados da conta',
                )),
            InkWell(
                onTap: carregaFormSenha,
                child: CardsConta(
                  width: 400,
                  height: 60,
                  color: 0xffffffff,
                  text: 'Alterar senha',
                )),
            InkWell(
                onTap: _submitRemove,
                child: CardsConta(
                  width: 400,
                  height: 60,
                  color:  0xffffffff,
                  text: 'Remover conta' ,
                )),
          ],
        ),
      ),
    );
  }
}
//0xffF03E44