import 'package:ennatodo/common/helper/navigator/app_navigator.dart';
import 'package:ennatodo/common/widgets/appBar/app_bar.dart';
import 'package:ennatodo/common/widgets/buttons/basic_button.dart';
import 'package:ennatodo/presentation/auth/pages/enter_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createAccountText(context),
            const SizedBox(height: 20),
            _emailField(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _createAccountText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(decoration: InputDecoration(hintText: 'Enter Email'));
  }

  Widget _continueButton(BuildContext context) {
    return BasicButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      // Per Click
      text: TextSpan(
        children: [
          TextSpan(text: 'Dont have an Account?'),
          TextSpan(
            text: ' Create One',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // signup page soon
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
