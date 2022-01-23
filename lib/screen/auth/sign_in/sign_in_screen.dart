import 'package:flutter/material.dart';

import 'widget/create_new_account.dart';
import 'widget/email_text_field.dart';
import 'widget/forgot_password.dart';
import 'widget/login_button.dart';
import 'widget/password_text_field.dart';
import 'widget/sign_in_logo.dart';
import 'widget/sign_in_screen_background.dart';
import 'widget/sign_in_title_text.dart';
import 'widget/sign_in_sub_title_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const SignInScreenBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const SignInLogo(),
                    const SizedBox(height: 100),
                    const SignInTitleText(),
                    const SizedBox(height: 15),
                    const SignInSubTitleText(),
                    const SizedBox(height: 40),
                    EmailTextField(controller: _emailController),
                    const SizedBox(height: 20),
                    PasswordTextField(
                      controller: _passwordController,
                      obscureText: _showPassword,
                      toggle: () =>
                          setState(() => _showPassword = !_showPassword),
                    ),
                    const SizedBox(height: 20),
                    ForgotPassword(onTap: () {}),
                    const SizedBox(height: 30),
                    LoginButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.reset();
                      }
                    }),
                    const SizedBox(height: 25),
                    CreateNewAccount(onTap: () {}),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
