// ignore_for_file: use_build_context_synchronously

import 'package:cadastro_e_login/login/controllers/login_controller.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/pages/login_page.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:cadastro_e_login/signup/models/signup_model.dart';
import 'package:cadastro_e_login/signup/repositories/signup_repository.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final SignUpRepository signUpRepository;
  SignUpController(
    this.signUpRepository,
  );

  /* Variaveis do tipo global */
  String name = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool nameIsValid = false;
  bool lastNameIsValid = false;

  bool emailIsValid = false;
  bool passwordIsValid = false;
  bool emailValidRegexp = false;

  //****** Controlando a reatividade com o ValueNotifier *******
  //Botão de salvar
  ValueNotifier<bool> $btnIsValid = ValueNotifier(false);
  bool get btnIsValid => $btnIsValid
      .value; //Usado na view, para não ter que chamar sempre o .value
  set setBtnIsValid(bool captured) => $btnIsValid.value = captured;

  /* NAME */
  setName(nameReceived) {
    name = nameReceived;

    //Validação: Verifica se o nome não é vazio
    name.isNotEmpty ? nameIsValid = true : nameIsValid = false;

    //Validação: Verifica se o nome possui ao menos 2 caracteres
    name.toString().length <= 2 ? nameIsValid = false : nameIsValid = true;

    //Chama a validação geral, que controla o acesso ao botão
    validaSignUp();
  }

  /* LAST NAME (sobrenome) */
  setLastName(latNameReceived) {
    lastName = latNameReceived;

    //Validação: Verifica se o nome não é vazio
    lastName.isNotEmpty ? lastNameIsValid = true : lastNameIsValid = false;

    //Validação: Verifica se o nome possui ao menos 2 caracteres
    lastName.toString().length <= 2
        ? lastNameIsValid = false
        : lastNameIsValid = true;

    //Chama a validação geral, que controla o acesso ao botão
    validaSignUp();
  }

  /* E-MAIL */
  /* Seta na variável os valores pegos da tela */
  setEmail(emailReceived) {
    email = emailReceived;

    //Validação: Verifica se o email não é vazio
    email.isNotEmpty ? emailIsValid = true : emailIsValid = false;

    //Validação: Verifica se o email tem um formato válido
    emailValidRegexp = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(email);

    emailValidRegexp ? emailIsValid = true : emailIsValid = false;

    //Chama a validação geral, que controla o acesso ao botão
    validaSignUp();
  }

  /* PASSWORD */
  setPassword(passwordReceived) {
    password = passwordReceived;

    //Validação: Verifica se a senha não é vazia
    password.isNotEmpty ? passwordIsValid = true : passwordIsValid = false;

    //Validação: Verifica se a senha possui ao menos 6 caracteres
    password.toString().length < 6
        ? passwordIsValid = false
        : passwordIsValid = true;

    //Chama a validação geral, que controla o acesso ao botão
    validaSignUp();
  }

  validaSignUp() {
    (emailIsValid && passwordIsValid && nameIsValid && lastNameIsValid)
        ? setBtnIsValid = true
        : setBtnIsValid = false;
  }

  //Função responsável pelo cadastro do usuário no Armazenamento local da aplicação
  signUp(BuildContext context) async {
    //Instanciando um novo objeto e o completando
    SignUpModel signUpModel = SignUpModel();
    signUpModel.name = name;
    signUpModel.lastName = lastName;
    signUpModel.email = email;
    signUpModel.password = password;

    //Chama o repository que faz a interação com o Armazenamento Local
    bool signUpResult = await signUpRepository.signUp(signUpModel);

    if (signUpResult) {
      //Sucesso ao criar, direciona para o Login
      goToLoginPage(context);
    } else {
      //Algum erro ao criar o cadastro
    }
  }

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
