// ignore_for_file: avoid_print

import 'package:cadastro_e_login/login/models/login_model.dart';
import 'package:cadastro_e_login/signup/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginRepository {
  final LoginModel loginModel;
  LoginRepository(this.loginModel);

  //Lista inicializada de forma global
  var userList = List<String>.from([]);

  Future<bool> loginRepository(LoginModel loginModel) async {
    final prefs = await SharedPreferences.getInstance();
    bool loginIsOk = false;
    if (prefs.getStringList("users") != null) {
      userList = prefs.getStringList("users")!;
      //Percorre os elementos da lista de usuários
      // ignore: todo
      for (var usr in userList) {
        // ignore: todo
        //TODO: No futuro pode ser trocado por alguma função de Find que não utilize Looping
        Map<String, dynamic> valueMap = json.decode(usr);
        SignUpModel userModel = SignUpModel.fromJson(valueMap);
        //Verifica se o email e senha existem no Shared Preferences
        if ((userModel.email == loginModel.email) &&
            (userModel.password == loginModel.password)) {
          loginIsOk = true;
          break; //Ao encontrar um usuário com o email e senha informados, sai do laço de repetição
        } else {
          //Neste cenário, a base de dados existe, mas o usuário procurado não existe.
          loginIsOk = false;
        }
      }
    } else {
      //Nese cenário, ainda não existe informação salva de usuários no SharedPreferences.
      loginIsOk = false;
    }
    return loginIsOk;
  }
}
