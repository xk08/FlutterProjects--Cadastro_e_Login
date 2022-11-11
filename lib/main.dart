import 'package:cadastro_e_login/login/controllers/login_controller.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/pages/login_page.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro e Login',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(
        tituloPagina: "Login",
        loginController: LoginController(
          LoginRepository(
            LoginModel(),
          ),
        ),
      ),
    );
  }
}
