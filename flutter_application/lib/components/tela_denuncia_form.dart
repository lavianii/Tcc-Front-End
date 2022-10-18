

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/lista_bairros.dart';
import 'templates/botoes/entrar_botao.dart';
import 'templates/textos/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';
import '../models/bairros.dart';

String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
ListaBairros listaBairros = ListaBairros();

class TelaDenunciaForm extends StatefulWidget {
  const TelaDenunciaForm({Key? key}) : super(key: key);

  @override
  State<TelaDenunciaForm> createState() => _FormDenunciaState();
}

class _FormDenunciaState extends State<TelaDenunciaForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  List<Bairro> bairros = List<Bairro>.empty();
  

  @override
  void initState() {
    super.initState();

        listaBairros.listBairros().then((List<Bairro> result) {
          setState(() {
            bairros = result;
          });
        });
 
    print('$bairros' 'Carregados com sucesso');
  }

  Future<void> insereDenuncia() {
    final int id = int.parse(_formData['id'].toString());

    return http
        .put(
      Uri.parse('$_baseUrl/atualizaqtdcrimes/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': id,
      }),
    )
        .then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Denuncia cadastrada com sucesso!!'),
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

  void _submitForm() {
    insereDenuncia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDFF5F4),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  EstiloTextFild(
                    label: 'Observações',
                    iconData: Icons.info_outline_rounded,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 280,
                    child: DropdownButton(
                      items: bairros
                          .map(
                            (e) => DropdownMenuItem(
                                value: e.id, child: Text(e.bairro)),
                          )
                          .toList(),
                      onChanged: (value) => {_formData['id'] = value ?? ''},
                      hint: const Text('Escolha o bairro'),
                      isExpanded: true,
                    ),
                  ),
                  const SizedBox(height: 100),
                  EntrarBotao(
                    text: 'Denunciar',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
