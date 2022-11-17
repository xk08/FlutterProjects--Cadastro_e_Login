// ignore_for_file: no_logic_in_create_state

import 'package:cadastro_e_login/shared/widgets/simple_text_widget.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Cadastro"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            SimpleTextWidget(
                textoRecebido: "Clique para acessar",
                onSimpleTap: () {
                  signUpController.goToLoginPage(context);
                }),
          ],
        ),
      ),
    );
  }
}
