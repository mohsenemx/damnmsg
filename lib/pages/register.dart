// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unused_local_variable

// Importing local files
import 'package:damnmsg/components/Buttons.dart';
import 'package:damnmsg/components/TextBox.dart';
import 'package:damnmsg/pages/login.dart';
import 'package:damnmsg/components/popup.dart';

// Importing dependencies
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final supabase = Supabase.instance.client;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void SignUpUser(email, username, password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    final Session? session = res.session;
    final User? user = res.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      'Let\'s get you set up!',
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
                      height: 25,
                    ),
                    InputBox(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GenericButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (emailController.text.trim() == '') {}
                        if (passwordController.text.trim() == '') {}
                        if (confirmPasswordController.text.trim() == '') {}
                        if (passwordController.text !=
                            confirmPasswordController.text) {}
                        String extraInfo =
                            'You have to chose a unique username that others will use to find you.';
                        String username = GenericInputPopUp(
                            context: context,
                            title: 'Choose a username',
                            extraInfo: extraInfo,
                            inputHint: 'Enter a username',
                            inputTitle: 'Username');
                        SignUpUser(emailController.text, username,
                            passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a member?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text(
                            'Login Now!',
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
