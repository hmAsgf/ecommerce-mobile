class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class AuthResponseModel {
  final String token;

  AuthResponseModel({required this.token});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(token: json['token']);
  }
}
