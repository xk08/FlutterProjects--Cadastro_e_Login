// ignore_for_file: avoid_print

import 'package:cadastro_e_login/home/pages/home_page.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:flutter/material.dart';

class LoginController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  /* Variaveis do tipo global */
  String email = "";
  String password = "";
  bool btnIsValid = false;
  bool emailIsValid = false;
  bool passwordIsValid = false;

  bool failOnLogin = false;
  bool emailValidRegexp = false;

  /* Seta na variável os valores pegos da tela */
  setEmail(emailReceived) {
    email = emailReceived;

    //Validação: Verifica se o email não é nullo ou vazio
    email.isNotEmpty ? emailIsValid = true : emailIsValid = false;

    //Validação: Verifica se o email é de um formato válido
    emailValidRegexp = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(email);

    emailValidRegexp ? emailIsValid = true : emailIsValid = false;

    //Retorna para o page a validação
    return validaLogin();
  }

  setPassword(passwordReceived) {
    password = passwordReceived;

    //Validação: Verifica se a senha não é nulla ou vazia
    password.isNotEmpty ? passwordIsValid = true : passwordIsValid = false;

    //Validação: Verifica se a senha possui ao menos 6 caracteres
    password.toString().length < 6
        ? passwordIsValid = false
        : passwordIsValid = true;

    return validaLogin();
  }

  validaLogin() {
    if (emailIsValid && passwordIsValid) {
      btnIsValid = true;
    } else {
      btnIsValid = false;
    }
    return btnIsValid;
  }

  login(BuildContext context) {
    /*  print(email);
    print(password); */

    //Pega as informações do objeto de login
    LoginModel loginDataObject = loginRepository.loginRepository();

    if (email == loginDataObject.email &&
        password == loginDataObject.password) {
      //Caso obtenha sucesso no login...
      failOnLogin = false; //Obteve sucesso no login

      //Direciona para a tela de Login (Sobre-escreve a rota principal (login) pela nova rota)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
      return true;
    } else {
      print("E-mail e/ou Senha inválidos....");
      failOnLogin = true; //O login falhou em algum ponto
      return false;
    }
  }
}
