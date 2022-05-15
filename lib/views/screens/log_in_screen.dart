import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:ist_bug/views/widgets/input.dart';
import 'package:ist_bug/views/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: screenWidth / 100 * 33,
                  child: Image.asset(
                    'assets/header-login.png',
                  ),
                ),
                SizedBox(
                  width: screenWidth / 100 * 5,
                ),
                SizedBox(
                  width: screenWidth / 100 * 27,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              ],
            ),
            // Login Methods Container
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: screenHeight / 100 * 1),
                  Text(
                    'Please sign in to continue.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: screenHeight / 100 * 3),
                  AuthFlowBuilder<EmailFlowController>(
                    listener: (oldState, state, controller) {
                      if (state is SignedIn) {
                        Navigator.of(context).pushReplacementNamed('/profile');
                      }
                    },
                    builder: (context, state, controller, _) {
                      if (state is AwaitingEmailAndPassword) {
                        return SizedBox(
                          height: screenHeight / 100 * 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInput(
                                  inputController: emailCtrl,
                                  isPassword: false,
                                  hintText: 'Email',
                                  labelText: 'Email'),
                              CustomInput(
                                  inputController: passwordCtrl,
                                  isPassword: true,
                                  hintText: 'Password',
                                  labelText: 'Password'),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: LoginButton(
                                  action: () {
                                    controller.setEmailAndPassword(
                                      emailCtrl.text,
                                      passwordCtrl.text,
                                    );
                                  },
                                  name: 'LOGIN',
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is SigningIn) {
                        return const CircularProgressIndicator();
                      } else if (state is AuthFailed) {
                        return ErrorText(exception: state.exception);
                      }
                      return const Center(
                        child: Text(''),
                      );
                    },
                  ),
                  SizedBox(
                    height: screenHeight / 100 * 10,
                  ),
                  SizedBox(
                    height: screenHeight / 100 * 2,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: screenHeight / 100 * 5),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.pushNamed(context, '/register');
                        },
                      text: 'Sign Up',
                      style: const TextStyle(
                          color: Color(0xffE94335), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
