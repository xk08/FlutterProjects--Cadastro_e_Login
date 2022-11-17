class SignUpModel {
  String? name;
  String? lastName;
  String? email;
  String? password;

  SignUpModel({
    this.name = "",
    this.email = "",
    this.password = "",
    this.lastName = "",
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
