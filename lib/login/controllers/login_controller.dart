// ignore_for_file: avoid_print
import 'package:cadastro_e_login/home/pages/home_page.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:cadastro_e_login/signup/controllers/signup_controller.dart';
import 'package:cadastro_e_login/signup/models/signup_model.dart';
import 'package:cadastro_e_login/signup/pages/signup_page.dart';
import 'package:cadastro_e_login/signup/repositories/signup_repository.dart';
import 'package:flutter/material.dart';

class LoginController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  /* Variaveis do tipo global */
  String email = "";
  String password = "";
  bool emailIsValid = false;
  bool passwordIsValid = false;
  bool emailValidRegexp = false;

  //****** Controlando a reatividade com o ValueNotifier *******
  //Botão de salvar
  ValueNotifier<bool> $btnIsValid = ValueNotifier(false);
  bool get btnIsValid => $btnIsValid
      .value; //Usado na view, para não ter que chamar sempre o .value
  set setBtnIsValid(bool captured) => $btnIsValid.value = captured;

  //Mensagem de erro no login falho
  ValueNotifier<bool> $failOnLogin = ValueNotifier(false);
  bool get failOnLogin => $failOnLogin.value;
  set setFailOnLogin(bool captured) => $failOnLogin.value = captured;

  /* Seta na variável os valores pegos da tela */
  setEmail(emailReceived) {
    email = emailReceived;

    //Validação: Verifica se o email não é vazio
    email.isNotEmpty ? emailIsValid = true : emailIsValid = false;

    //Validação: Verifica se o email tem um formato válido
    emailValidRegexp = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(email);

    emailValidRegexp ? emailIsValid = true : emailIsValid = false;

    /* Retira a mensagem: "E-mail e/ou Senha inválidos" */
    failOnLogin ? setFailOnLogin = false : null;

    //Chama a validação geral, que controla o acesso ao botão
    validaLogin();
  }

  setPassword(passwordReceived) {
    password = passwordReceived;

    //Validação: Verifica se a senha não é vazia
    password.isNotEmpty ? passwordIsValid = true : passwordIsValid = false;

    //Validação: Verifica se a senha possui ao menos 6 caracteres
    password.toString().length < 6
        ? passwordIsValid = false
        : passwordIsValid = true;

    /* Retira a mensagem: "E-mail e/ou Senha inválidos" */
    failOnLogin ? setFailOnLogin = false : null;

    //Chama a validação geral, que controla o acesso ao botão
    validaLogin();
  }

  validaLogin() {
    (emailIsValid && passwordIsValid)
        ? setBtnIsValid = true
        : setBtnIsValid = false;
  }

  login(BuildContext context) {
    //Pega as informações do objeto de login no Repository que vem do Armazenamento local do celular
    LoginModel loginDataObject = loginRepository.loginRepository();

    if (email == loginDataObject.email &&
        password == loginDataObject.password) {
      //Caso obtenha sucesso no login...
      setFailOnLogin = false;

      //Direciona para a tela de Login (Sobre-escreve a rota principal (login) pela nova rota)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      print("E-mail e/ou Senha inválidos....");

      //Exibe mensagem na tela (em cima do botão de salvar)
      setFailOnLogin = true;
    }
  }

  goToSignUpPage(BuildContext context) {
    //Direciona para a tela de Login (Sobre-escreve a rota principal (login) pela nova rota)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpPage(
          signUpController: SignUpController(
            SignUpRepository(
              SignUpModel(),
            ),
          ),
        ),
      ),
    );
  }
}
