import 'package:ecommerce/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/controller/AuthController.dart';
import 'package:ecommerce/models/AuthResponseModel.dart';
import 'package:ecommerce/views/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUserIn() async {
    final UserModel user = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );

    final AuthResponseModel? authResponse =
        await AuthController.loginUser(user);

    if (authResponse != null) {
      print("Login berhasil: ${authResponse.token}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login gagal. Periksa kembali email dan password."),
        ),
      );
    }
  }

  void signWithGoogle() {
    // Implement Google sign-in functionality
  }

  void signWithFacebook() {
    // Implement Facebook sign-in functionality
  }

  void navigateToRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue, // Set your desired app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signUserIn,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set your desired button color
                    ),
                    child: Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signWithGoogle,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set your desired button color
                    ),
                    child: Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: signWithFacebook,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set your desired button color
                    ),
                    child: Text('Sign in with Facebook'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          navigateToRegisterPage(context);
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
