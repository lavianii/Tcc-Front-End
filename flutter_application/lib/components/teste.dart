import 'dart:async';
import 'package:flutter/material.dart';
import 'templates/botoes/entrar_botao.dart';
import 'templates/textos/estilo_text_fild.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';
import 'dart:convert';
import '../models/bairros_models.dart';


String _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';
List<Bairro> bairros = List<Bairro>.empty();

Future<void> getBairros() async {
  final response = await http.get(Uri.parse('$_baseUrl/recuperabairro'),
      headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
 
   Iterable data = jsonDecode(response.body);
    bairros = data.map((model) => Bairro.fromJson(model)). toList();
 
  } else {
    throw Exception('Erro inesperado...');
  }
}

class TelaTeste extends StatefulWidget {
  const TelaTeste({Key? key}) : super(key: key);

  @override
  State<TelaTeste> createState() => _TelaTesteState();
}

class _TelaTesteState extends State<TelaTeste> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();

    getBairros();
    print('$bairros''Carregados com sucesso');

  }

  Future<void> insereDenuncia() {
    final int id = int.parse(_formData['id'].toString());
 
    return http
        .put(
      Uri.parse('$_baseUrl/atualizaqtdcrimes/$id'),
      headers:{
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
                    label: 'Tipo de crime',
                    iconData: Icons.person,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 280,
                    child: DropdownButton(
                     
                      items: bairros.map((e) => DropdownMenuItem(
                                value: e.id,
                                 child: Text(e.bairro)
                            ),
                          ).toList(),
                      onChanged: (value) => {_formData['id'] = value ?? '' } ,
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
