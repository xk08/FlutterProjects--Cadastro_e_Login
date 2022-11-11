// ignore_for_file: avoid_print, no_logic_in_create_state
import 'package:cadastro_e_login/login/controllers/login_controller.dart';
import 'package:cadastro_e_login/shared/widgets/button_widget.dart';
import 'package:cadastro_e_login/shared/widgets/simple_text_widget.dart';
import 'package:cadastro_e_login/shared/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String tituloPagina;
  final LoginController loginController;

  const LoginPage({
    super.key,
    required this.tituloPagina,
    required this.loginController,
  });

  @override
  // ignore: todo
  //TODO: Verificar o motivo da recomendação...
  State<LoginPage> createState() => _LoginPageState(
        tituloPagina,
        loginController,
      );
}

class _LoginPageState extends State<LoginPage> {
  //Declara porém, inicia no initState da página
  final LoginController loginController;
  final String tituloPagina;

  bool obsecureTextPassword = true;
  _LoginPageState(
    this.tituloPagina,
    this.loginController,
  );

  @override
  void initState() {
    super.initState();
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
            const SimpleTextWidget(textoRecebido: "Seus dados", textSize: 30),
            const SizedBox(height: 30),
            TextFormFieldWidget(
              enabled: true,
              label: "E-mail",
              obscureText: false,
              readOnly: false,
              icon: Icons.email,
              hint: "Informe seu e-mail",
              onChanged: (emailDigitado) {
                loginController.setEmail(emailDigitado);
              },
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return "O e-mail é obrigatório";
                }

                if (!loginController.emailValidRegexp) {
                  return "O e-mail não é de um tipo válido";
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
                loginController.setPassword(senhaDigitada);
              },
              validator: (senha) {
                if (senha == null || senha.isEmpty) {
                  return "A senha é obrigatória";
                }

                if (senha.toString().length < 6) {
                  return "A senha deve ter ao menos 6 caracteres";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            /* Responsável por reconstruir esse fragmento na tela, ao sofrer alguma alteração*/
            ValueListenableBuilder(
              valueListenable: loginController.$failOnLogin,
              builder: (_, __, ___) {
                return loginController
                        .failOnLogin //testa com o get do controller
                    ? Column(
                        children: const [
                          SimpleTextWidget(
                              textoRecebido: "E-mail e/ou Senha inválidos",
                              textSize: 18,
                              textColor: Color.fromARGB(255, 208, 27, 14)),
                          SizedBox(height: 10),
                        ],
                      )
                    : const SizedBox();
              },
            ),
            ValueListenableBuilder(
              valueListenable: loginController.$btnIsValid,
              builder: (_, __, ___) {
                return ButtonWidget(
                    textButton: "Acessar",
                    colorButton: const Color.fromARGB(255, 132, 213, 55),
                    onPressed:
                        loginController.btnIsValid //Pega o get do controller
                            ? () {
                                loginController.login(context);
                              }
                            : null);
              },
            ),
          ],
        ),
      ),
    );
  }
}
