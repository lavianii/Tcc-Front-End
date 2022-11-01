import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/templates/botoes/text_botao.dart';
import 'package:flutter_application/components/pages/form_sugestao_bairros.dart';
import 'package:flutter_application/controllers/lista_bairros_controller.dart';
import '../templates/botoes/botao_icone.dart';
import '../templates/Inputs/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';
import '../../models/bairros_models.dart';

ListaBairros listaBairros = ListaBairros();

class TelaDenunciaForm extends StatefulWidget {
  const TelaDenunciaForm({Key? key}) : super(key: key);

  @override
  State<TelaDenunciaForm> createState() => _FormDenunciaState();
}

class _FormDenunciaState extends State<TelaDenunciaForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  final String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
  List<Bairro> bairros = List<Bairro>.empty();

  @override
  void initState() {
    super.initState();

    listaBairros.getListBairros().then((List<Bairro> result) {
      setState(() {
        bairros = result;
      });
    });
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

  void _carregaFormSugestaoBairros() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FormSugestaoBairros(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Denuncia'),
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
                    margin: const EdgeInsets.fromLTRB(15, 40, 15, 15),
                    child: const Text('Denuncia',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    height: 45,
                    width: 290,
                    child: EstiloTextFild(
                      label: 'Observações',
                      hintText: 'Digite as Observações',
                      iconData: Icons.info_outline_rounded,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    height: 50,
                    width: 250,
                    child: SizedBox(
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
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    width: 250,
                    child: BotaoIcone(
                      text: 'Denunciar',
                      onPressed: _submitForm,
                      icon: Icons.arrow_forward,
                      width: 150,
                      color: 0xff152C42,
                      colorText: 0xffffffff,
                      colorIcon: 0xffffffff,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 30),
                    width: 250,
                    child: TextBotao(
                        onPressed: _carregaFormSugestaoBairros,
                        colorText: 0xffffffff,
                        text: 'Não encontrou seu bairro?'),
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
