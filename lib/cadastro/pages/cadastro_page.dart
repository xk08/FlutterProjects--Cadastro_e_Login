// ignore_for_file: avoid_print

import 'package:cadastro_e_login/cadastro/controllers/cadastro_controller.dart';
import 'package:cadastro_e_login/shared/widgets/button_widget.dart';
import 'package:cadastro_e_login/shared/widgets/simple_text_widget.dart';
import 'package:cadastro_e_login/shared/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  final String tituloPagina;
  const CadastroPage({super.key, required this.tituloPagina});

  @override
  // ignore: no_logic_in_create_state
  // ignore: todo
  //TODO: Verificar o motivo da recomendação...
  // ignore: no_logic_in_create_state
  State<CadastroPage> createState() => _CadastroPageState(tituloPagina);
}

class _CadastroPageState extends State<CadastroPage> {
  //Declara porém, inicia no initState da página
  late CadastroController cadastroController;

  final String tituloPagina;

  bool obsecureTextPassword = true;
  bool botaoEValido = true;

  _CadastroPageState(this.tituloPagina);

  @override
  void initState() {
    super.initState();

    //Inicializa o objeto do controlador
    cadastroController = const CadastroController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 141, 226),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(tituloPagina),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SimpleTextWidget(
                textoRecebido: "Informe seus dados", textSize: 30),
            const SizedBox(height: 30),
            TextFormFieldWidget(
              enabled: true,
              label: "E-mail",
              obscureText: false,
              readOnly: false,
              icon: Icons.email,
              hint: "Informe seu e-mail",
              onChanged: (emailDigitado) {
                print("Email: $emailDigitado");
              },
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return "O e-mail é obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormFieldWidget(
              enabled: true,
              label: "Senha",
              obscureText: obsecureTextPassword ? true : false,
              readOnly: false,
              icon: Icons.key,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecureTextPassword = !obsecureTextPassword;
                  });
                },
                icon: Icon(
                  obsecureTextPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              hint: "Informe sua senha",
              onChanged: (senhaDigitada) {
                print("Senha: $senhaDigitada");
              },
              validator: (senha) {
                if (senha == null || senha.isEmpty) {
                  return "A senha é obrigatória";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ButtonWidget(
                textButton: "Criar cadastro",
                colorButton: const Color.fromARGB(255, 132, 213, 55),
                onPressed: botaoEValido
                    ? () {
                        print("Teste");
                        cadastroController.teste();
                      }
                    : null) //Quando null, o botão fica desabilitado
          ],
        ),
      ),
    );
  }
}
