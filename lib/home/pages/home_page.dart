import 'package:cadastro_e_login/login/controllers/login_controller.dart';
import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/login/pages/login_page.dart';
import 'package:cadastro_e_login/login/repositories/login_repository.dart';
import 'package:cadastro_e_login/shared/widgets/button_widget.dart';
import 'package:cadastro_e_login/shared/widgets/simple_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 186, 182),
      appBar: AppBar(
        title: const Text("Início"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SimpleTextWidget(
              textoRecebido: "Você foi logado!",
              textSize: 25,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            ButtonWidget(
                colorButton: Colors.orangeAccent,
                textButton: "Sair",
                onPressed: () {
                  Navigator.pushReplacement(
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
                })
          ],
        ),
      ),
    );
  }
}
