// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names
import 'package:damnmsg/components/Buttons.dart';
import 'package:damnmsg/components/TextBox.dart';
import 'package:damnmsg/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void LoginEmailPassowrd(
      {required String email, required String password}) async {
    try {
      showDialog(
        context: context,
        builder: ((context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      );
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('Signed In!');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('Wrong username');
      } else if (e.code == 'wrong-password') {
        print('Wrong password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Material(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Icon(Icons.message_outlined, size: 100),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Hero(
                      tag: 'emailField',
                      child: InputBox(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Hero(
                      tag: 'passwordField',
                      child: InputBox(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GenericButton(
                      text: 'Sign In',
                      onTap: () {
                        LoginEmailPassowrd(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register Now!',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
