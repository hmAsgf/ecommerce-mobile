import 'package:flutter/material.dart';
import 'package:ecommerce/components/button_facebook.dart';
import 'package:ecommerce/components/button_google.dart';
import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/components/my_textfield.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/views/home.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

  void signUserIn() {}
  void signWithGoogle() {}
  void signWithFacebook() {}

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Image.asset(
                    'lib/images/logo.png',
                    width: 100,
                    height: 100,
                  ),

                  const SizedBox(height: 50),

                  GestureDetector(
                    onTap: () {
                      // Navigate to HomePage when the text is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Register For New Costumer',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (newValue) {
                          // setState(() {
                          //   rememberMe = newValue ?? false;
                          // });
                        },
                      ),
                      Text(
                        'I have read and agree to the terms & conditions',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10, width: 50),

                  // sign in button
                  MyButtonRegister(
                    onTap: signUserIn,
                  ),

                  const SizedBox(height: 50),

                  // or continue with
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

                  const SizedBox(height: 50),

                  button_google(
                    onTap: signWithGoogle,
                  ),

                  const SizedBox(height: 20),

                  button_facebook(
                    onTap: signWithFacebook,
                  ),

                  const SizedBox(height: 20),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have a Account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          navigateToLoginPage(context);
                        },
                        child: const Text(
                          'Login Now',
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
