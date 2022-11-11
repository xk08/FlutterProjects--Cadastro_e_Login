import 'package:cadastro_e_login/login/models/login_model.dart';

class LoginRepository {
  final LoginModel loginModel;
  LoginRepository(this.loginModel);

  loginRepository() {
    loginModel.email = "marcos@gmail.com";
    loginModel.password = "123456";
    return loginModel;
  }
}
