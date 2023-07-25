// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, cancel_subscriptions
import 'package:damnmsg/components/Buttons.dart';
import 'package:damnmsg/components/ImgButton.dart';
import 'package:damnmsg/components/TextBox.dart';
import 'package:damnmsg/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    final supabase = Supabase.instance.client;
    showDialog(
      context: context,
      builder: ((context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );

    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: 'example@email.com',
      password: 'example-password',
    );
    final Session? session = res.session;
    final User? user = supabase.auth.currentUser;
    final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        // handle signIn
        print('Signed In!');
      }
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height;
    print(screenSizeHeight);
    double BaseSpacing = (screenSizeHeight < 400) ? 0.5 : 1.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Material(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55 * BaseSpacing,
                      ),
                      Icon(Icons.message_outlined, size: 100),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        height: 55 * BaseSpacing,
                      ),
                      InputBox(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 25 * BaseSpacing,
                      ),
                      InputBox(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10 * BaseSpacing,
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
                        height: 25 * BaseSpacing,
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
                        height: 10 * BaseSpacing,
                      ),
                      Text(
                        'Or continue with: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10 * BaseSpacing,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageButton(
                              ImgPath: 'assets/google.png', onTap: () {}),
                          SizedBox(
                            width: 15,
                          ),
                          ImageButton(
                              ImgPath: 'assets/facebook.png', onTap: () {}),
                        ],
                      ),
                      SizedBox(
                        height: 55 * BaseSpacing,
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
