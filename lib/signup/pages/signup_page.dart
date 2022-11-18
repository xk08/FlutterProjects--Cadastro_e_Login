// ignore_for_file: no_logic_in_create_state

import 'package:cadastro_e_login/shared/widgets/button_widget.dart';
import 'package:cadastro_e_login/shared/widgets/simple_text_widget.dart';
import 'package:cadastro_e_login/shared/widgets/text_form_field_widget.dart';
import 'package:cadastro_e_login/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final SignUpController signUpController;
  const SignUpPage({
    super.key,
    required this.signUpController,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState(signUpController);
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signUpController;

  _SignUpPageState(this.signUpController);

  bool obsecureTextPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 121, 209),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Cadastro"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const SimpleTextWidget(
                    textoRecebido: "Informe seus dados", textSize: 30),
                const SizedBox(height: 30),

                /* NOME */
                TextFormFieldWidget(
                  enabled: true,
                  label: "Nome",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.text_format,
                  hint: "Informe seu primeiro nome",
                  onChanged: (nomeDigitado) {
                    signUpController.setName(nomeDigitado);
                  },
                  validator: (nome) {
                    if (nome == null || nome.isEmpty) {
                      return "O nome é obrigatório";
                    }
                    if (nome.length <= 2) {
                      return "O nome deve possuir mais de 2 letras";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                /* SOBRENOME (último nome) */
                TextFormFieldWidget(
                  enabled: true,
                  label: "Sobrenome",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.text_format,
                  hint: "Informe seu último nome",
                  onChanged: (sobrenomeDigitado) {
                    signUpController.setLastName(sobrenomeDigitado);
                  },
                  validator: (sobrenome) {
                    if (sobrenome == null || sobrenome.isEmpty) {
                      return "O sobrenome é obrigatório";
                    }
                    if (sobrenome.length <= 2) {
                      return "O sobrenome deve possuir mais de 2 letras";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                /* E-MAIL */
                TextFormFieldWidget(
                  enabled: true,
                  label: "E-mail",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.email,
                  hint: "Informe seu e-mail",
                  onChanged: (emailDigitado) {
                    signUpController.setEmail(emailDigitado);
                  },
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "O e-mail é obrigatório";
                    }

                    if (!signUpController.emailValidRegexp) {
                      return "O e-mail não é de um tipo válido";
                    }

                    return null;
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: signUpController.$emailIsValidMessage,
                  builder: (_, __, ___) {
                    return !signUpController.emailIsValidMessage
                        ? const SimpleTextWidget(
                            textoRecebido: "Este e-mail já foi cadastrado!",
                            textSize: 15,
                            textColor: Color.fromARGB(255, 192, 31, 19),
                          )
                        : const SizedBox();
                  },
                ),
                const SizedBox(height: 30),
                /* SENHA */
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
                    signUpController.setPassword(senhaDigitada);
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
                  valueListenable: signUpController.$btnIsValid,
                  builder: (_, __, ___) {
                    return ButtonWidget(
                        textButton: "Criar cadastro",
                        colorButton: Colors.deepPurple,
                        isBtnDisabled: !signUpController.btnIsValid,
                        onPressed: signUpController
                                .btnIsValid //Pega o get do controller
                            ? () {
                                signUpController.signUp(context);
                              }
                            : null);
                  },
                ),
                const SizedBox(height: 30),
                SimpleTextWidget(
                    textoRecebido: "Clique para acessar",
                    onSimpleTap: () {
                      signUpController.goToLoginPage(context);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
