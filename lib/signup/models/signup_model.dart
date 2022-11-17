class SignUpModel {
  String name;
  String? lastName;
  String email;
  String password;

  SignUpModel({
    this.name = "",
    this.email = "",
    this.password = "",
    this.lastName,
  });
}
