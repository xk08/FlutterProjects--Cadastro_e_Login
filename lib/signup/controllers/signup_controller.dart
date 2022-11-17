import 'package:cadastro_e_login/login/controllers/login_controller.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/pages/login_page.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:cadastro_e_login/signup/repositories/signup_repository.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final SignUpRepository signUpRepository;
  SignUpController(
    this.signUpRepository,
  );

  goToLoginPage(BuildContext context) {
    //Direciona para a tela de Login (Sobre-escreve a rota principal (login) pela nova rota)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          tituloPagina: "Login",
          loginController: LoginController(
            LoginRepository(
              LoginModel(),
            ),
          ),
        ),
      ),
    );
  }
}
