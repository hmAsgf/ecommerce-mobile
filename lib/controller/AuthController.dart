import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/models/AuthResponseModel.dart';

class AuthController {
  static const String apiUrl = "http://127.0.0.1:8000/api";

  static Future<AuthResponseModel?> loginUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return AuthResponseModel.fromJson(responseData);
      } else {
        print("Login gagal: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      return null;
    }
  }

  static Future<bool> registerUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/register'),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return true; // Pendaftaran berhasil
      } else {
        print("Pendaftaran gagal: ${response.body}");
        return false; // Pendaftaran gagal
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      return false; // Pendaftaran gagal karena kesalahan
    }
  }
}
