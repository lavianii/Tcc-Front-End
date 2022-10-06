import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tela_inicial.dart';

class FormTeste extends StatefulWidget {
  const FormTeste({Key? key}) : super(key: key);

  @override
  State<FormTeste> createState() => _FormAtualizaUserState();
}

class _FormAtualizaUserState extends State<FormTeste> {

  //chave global do form onde obtenho o estado
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _baseUrl = 'https://back-end-tcc-deploy.lavianii.repl.co';

  Future<void> criaUsuario() {

    final String nome = _formData['nome'] as String;
    final String senha = _formData['senha'] as String;
    final String email =_formData['email'] as String;

   return http.post(
    Uri.parse('$_baseUrl/incluir'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
      'senha': senha,
      'email': email,
    }),

  ).then((response) {
    return showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const  Text('Usuario criado com sucesso'),
        actions: [
          TextButton(
             onPressed: (() => Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) => const TelaInicial(),
                ),
              )), 
            child: const  Text('ok'))
        ],
      )
    );
    
  }).catchError((error){

    return showDialog(
      context: context,
       builder:  (context) => AlertDialog(
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
            child: const  Text('ok'))
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
    criaUsuario();
  }

  bool _isValidEmail(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('form'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          //passando meu estado
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onSaved: ((nome) => _formData['nome'] = nome ?? ''),
                //sempre que retorno algo que não seja null exibe mensagem de erro
                validator: ((_nome) {
                  final name = _nome ?? ''; //lidando com null safety

                  if (name.trim().isEmpty) {
                    return 'O Nome é obrigatorio';
                  }

                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                textInputAction: TextInputAction.next,
                onSaved: ((senha) => _formData['senha'] = senha ?? ''),
                //sempre que retorno algo que não seja null exibe mensagem de erro
                validator: ((_senha) {
                  final senha = _senha ?? ''; //lidando com null safety

                  if (senha.trim().isEmpty) {
                    return 'A senha é obrigatoria';
                  }

                  return null;
                }),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                textInputAction: TextInputAction.done,
                onSaved: ((email) => _formData['email'] = email ?? ''),
                validator: ((_email) {

                  final email = _email ?? ''; //lidando com null safety
                    if (!_isValidEmail(email)) {
                      return 'email Invalido';
                    }
                  return null;
                }),
                onFieldSubmitted: (_) => _submitForm(),
              ),
              ElevatedButton(
                  onPressed: _submitForm, child: const Text('atualizar'))
            ],
          ),
        ),
      ),
    );
  }
}
