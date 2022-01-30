import 'dart:async';

import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'sign_up_event.dart';
import 'sign_up_notifier.dart';
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
  final eventController = StreamController<SignUpEvent>();
  late final SignUpNotifier notifier;

  @override
  void initState() {
    notifier = get<SignUpNotifier>(param1: context);
    notifier.init(eventController);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    notifier.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      onTapTerms: () {
                        eventController.add(TermsEvent());
                      },
                      onTapPolicy: () {
                        eventController.add(PolicyEvent());
                      },
                    ),
                    const SizedBox(height: 30),
                    SignUpButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        eventController.add(GoToHomeScreenEvent(
                          _fullNameController.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        ));
                        _formKey.currentState!.reset();
                      }
                    }),
                    const SizedBox(height: 25),
                    Login(onTap: () {
                      eventController.add(LoginEvent());
                    }),
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
