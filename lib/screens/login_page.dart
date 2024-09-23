import 'package:awfia2/screens/home_page.dart';
import 'package:awfia2/screens/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  // TODO IMPLEMENT PROPER LOGIN LOGIC
  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  // TODO SAVE REMEMBER ME STATE TO LOCAL STORAG
  void toggleRememberMe() {
    rememberMe = !rememberMe;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                const SizedBox(height: 200.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Image.asset(
                    "assets/logo/afriwork.png",
                  ),
                ),

                // Login Form
                const TextField(
                  decoration: InputDecoration(hintText: "email..."),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "password..."),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) => toggleRememberMe(),
                        ),
                        const Text("Remember Me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    "Login",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
