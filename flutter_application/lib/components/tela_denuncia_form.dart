import 'package:flutter/material.dart';
import 'package:flutter_application/components/templates/entrar_botao.dart';
import 'package:flutter_application/components/templates/estilo_text_fild.dart';


class FormDenuncia extends StatefulWidget {
  const FormDenuncia({Key? key}) : super(key: key);

  @override
  State<FormDenuncia> createState() => _FormDenunciaState();
}

class _FormDenunciaState extends State<FormDenuncia> {
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;
  bool _checked5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffDFF5F4),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'lib/components/assets/images/logo2.png',
              height: 50,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        color: const Color(0xffDFF5F4),
        child: Column(
          textDirection: TextDirection.values.first,
          children: [
            const EstiloTextFild(
              label: 'Coloque seu endereço',
            ),
            const SizedBox(height: 15),
            const Text(
              'Você é: ',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            CheckboxListTile(
              title: const Text('Vítima'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked1,
              onChanged: (value) {
                setState(() {
                  _checked1 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Testemunha'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked2,
              onChanged: (value) {
                setState(() {
                  _checked2 = value!;
                });
              },
            ),
            const Text(
              'O ocorrido foi: ',
              style: TextStyle(fontSize: 17),
            ),
            CheckboxListTile(
              title: const Text('Assalto'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked3,
              onChanged: (value) {
                setState(() {
                  _checked3 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Furto'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked4,
              onChanged: (value) {
                setState(() {
                  _checked4 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Outro'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked5,
              onChanged: (value) {
                setState(() {
                  _checked5 = value!;
                });
              },
            ),
            const SizedBox(
              height: 150,
            ),
            EntrarBotao(
              text: 'Enviar',
              funcao: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bd) {
                    return Wrap(
                      children: [
                        ListTile(
                          title: const Text('Formulário enviado com sucesso!'),
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
