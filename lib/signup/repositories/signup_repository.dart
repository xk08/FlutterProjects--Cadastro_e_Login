// ignore_for_file: avoid_print

import 'package:cadastro_e_login/signup/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SignUpRepository {
  final SignUpModel signUpModel;
  SignUpRepository(
    this.signUpModel,
  );

  //Lista inicializada de forma global
  var userList = List<String>.from([]);

  Future<bool> signUp(SignUpModel signUpModelReceived) async {
    bool userExists = false;
    final prefs = await SharedPreferences.getInstance();

    /* OBS: Na primeira exeução, o SharedPreferences, sempre será nulo para esta chave! */
    if (prefs.getStringList("users") != null) {
      //Busca a lista de usuários
      userList = prefs.getStringList("users")!;
      //Percorre os elementos da lista
      // ignore: todo
      for (var usr in userList) {
        // ignore: todo
        //TODO: No futuro pode ser trocado por alguma função de Find que não utilize Looping
        Map<String, dynamic> valueMap = json.decode(usr);
        SignUpModel userModel = SignUpModel.fromJson(valueMap);
        //Verifica se o email já existe no Shared Preferences
        if (userModel.email == signUpModelReceived.email) {
          //O usuário já existe!
          userExists = true;
          break; //Ao encontrar um usuário com o email informado, sai do laço de repetição
        } else {
          userExists = false;
        }
      }

      if (!userExists) {
        //Se o usuário não existir
        try {
          var encodedString = jsonEncode(signUpModelReceived);
          userList.add(encodedString); //Adiciona o novo usuário na lista
          prefs.setStringList("users", userList);
          return true;
        } catch (e) {
          print("Ocorreu o seguinte erro: $e");
          return false;
        }
      } else {
        //Este email já foi cadastrado
        return false;
      }
    } else {
      //A lista é nulla/vazia e ainda não foi salvo nenhum registro
      var encodedString = jsonEncode(signUpModelReceived);
      userList
          .add(encodedString); //Adiciona o primeiro elemento/usuário na lista
      prefs.setStringList("users", userList);
      return true;
    }
  }
}
