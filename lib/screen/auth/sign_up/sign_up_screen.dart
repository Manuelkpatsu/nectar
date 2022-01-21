import 'package:flutter/material.dart';

import 'widget/full_name_text_field.dart';
import 'widget/login.dart';
import 'widget/register_email_text_field.dart';
import 'widget/register_password_text_field.dart';
import 'widget/sign_up_button.dart';
import 'widget/sign_up_logo.dart';
import 'widget/sign_up_screen_background.dart';
import 'widget/sign_up_sub_title_text.dart';
import 'widget/sign_up_title_text.dart';
import 'widget/terms_policy.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
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
          const SignUpScreenBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const SignUpLogo(),
                    const SizedBox(height: 100),
                    const SignUpTitleText(),
                    const SizedBox(height: 15),
                    const SignUpSubTitleText(),
                    const SizedBox(height: 40),
                    FullNameTextField(controller: _fullNameController),
                    const SizedBox(height: 20),
                    RegisterEmailTextField(controller: _emailController),
                    const SizedBox(height: 20),
                    RegisterPasswordTextField(
                      controller: _passwordController,
                      obscureText: _showPassword,
                      toggle: () =>
                          setState(() => _showPassword = !_showPassword),
                    ),
                    const SizedBox(height: 20),
                    TermsPolicy(
                      onTapTerms: () {},
                      onTapPolicy: () {},
                    ),
                    const SizedBox(height: 30),
                    SignUpButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.reset();
                      }
                    }),
                    const SizedBox(height: 25),
                    Login(onTap: () {}),
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
