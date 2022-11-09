import 'package:flutter/material.dart';
import 'package:flutter_application/components/pages/tela_inicial.dart';
import '../templates/Inputs/estilo_text_fild.dart';
import '../templates/botoes/botao_icone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormSugestaoBairros extends StatefulWidget {
  const FormSugestaoBairros({Key? key}) : super(key: key);

  @override
  State<FormSugestaoBairros> createState() => _FormSugestaoBairrosState();
}

class _FormSugestaoBairrosState extends State<FormSugestaoBairros> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  Future<void> enviaBairro() {
    final String bairro = _formData['bairro'] as String;

    return http
        .post(
      Uri.parse('$_baseUrl/incluirSugestao'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'sugestoesBairro': bairro,
      }),
    )
        .then((response) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sugestão enviada com sucesso!!'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaInicial(),
                            ),
                          ),
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
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('ok'))
          ],
        ),
      );
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    // caso nao seja valido não continuo o metodo
    if (!isValid) {
      return;
    }
    //o save cada um dos campos do onSaved do form
    _formKey.currentState?.save();
    enviaBairro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugestão de bairro'),
        backgroundColor: const Color(0xff77A8A6),
        foregroundColor: const Color(0xffffffff),
      ),
      backgroundColor: const Color(0xffDFF5F4),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 100, 25, 90),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            shadowColor: Colors.black87,
            color: const Color(0xff77A8A6),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 40, 25, 15),
                    child: const Text(
                        'Envie o nome do  bairro para adicionarmos a nossa base de dados!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    height: 45,
                    width: 290,
                    child: EstiloTextFild(
                      label: 'Nome do bairro',
                      hintText: 'Digite o bairro',
                      iconData: Icons.location_on,
                      obscureText: false,
                      onSaved: (bairro) => _formData['bairro'] = bairro ?? '',
                      validator: (bairoo) {
                        final bairro = bairoo ?? ''; //lidando com null safety
                        if (bairro.trim().isEmpty) {
                          return 'bairro Invalido';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (_) => _submitForm,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 30),
                    width: 250,
                    child: BotaoIcone(
                      text: 'Enviar',
                      onPressed: _submitForm,
                      icon: Icons.arrow_forward,
                      width: 150,
                      color: 0xff152C42,
                      colorText: 0xffffffff,
                      colorIcon: 0xffffffff,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
