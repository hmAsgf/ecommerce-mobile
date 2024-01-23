class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String birthDay;
  final String phoneNumber;
  final String address;

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.birthDay,
    required this.phoneNumber,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'birthDay': birthDay,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
