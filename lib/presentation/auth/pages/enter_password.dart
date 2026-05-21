import 'package:ennatodo/common/helper/navigator/app_navigator.dart';
import 'package:ennatodo/common/widgets/appBar/app_bar.dart';
import 'package:ennatodo/common/widgets/buttons/basic_button.dart';
import 'package:ennatodo/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            _continueButton(),
            const SizedBox(height: 20),
            _forgotPassword(context),
          ],
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Sign In',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(decoration: InputDecoration(hintText: 'Enter Password'));
  }

  Widget _continueButton() {
    return BasicButton(onPressed: () {}, title: 'Continue');
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      // Per Click
      text: TextSpan(
        children: [
          TextSpan(text: 'Forgot password? '),
          TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // fix: Forgot Password
                AppNavigator.push(context, const ForgotPasswordPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
