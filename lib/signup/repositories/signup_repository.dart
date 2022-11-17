// ignore_for_file: avoid_print

import 'package:cadastro_e_login/signup/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/* Fica faltando (Cadastro):
  -> Organizar este arquivo
  -> Mostrar a mensagem na tela (que o email já existe!)
  -> Testar tudo novamente!

  Fica faltando (Login)
  -> Pegar o email correto e validar
 */

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

      //Se a lista não for vazia...
      //Percorre os elementos da lista
      for (var usr in userList) {
        Map<String, dynamic> valueMap = json.decode(usr);
        SignUpModel userModel = SignUpModel.fromJson(valueMap);
        //Verifica se o email já existe no Shared Preferences
        if (userModel.email == signUpModelReceived.email) {
          //O usuário já existe!
          userExists = true;
          break; //Ao encontrar um usuário, sai do laço de repetição
        } else {
          userExists = false;
        }
      }

      if (!userExists) {
        try {
          var encodedString = jsonEncode(signUpModelReceived);
          userList.add(encodedString); //Adiciona o novo usuário na lista
          prefs.setStringList("users", userList);
        } catch (e) {
          print("Ocorreu o seguint erro: $e");
        }
      } else {
        //O usuário já existe no sistema! - Apresentar mensagem
        print("O usuário já existe");
      }
    } else {
      //A lista é nulla/vazia, ainda não foi salvo nenhum registro
      var encodedString = jsonEncode(signUpModelReceived);
      userList
          .add(encodedString); //Adiciona o primeiro elemento/usuário na lista
      prefs.setStringList("users", userList);
    }

    return true; //Trocar!!
  }
}
