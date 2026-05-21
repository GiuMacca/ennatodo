import 'package:ennatodo/common/widgets/buttons/basic_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(context),
            const SizedBox(height: 20),
            _emailField(context),
            const SizedBox(height: 20),
            _continueButton(),
            const SizedBox(height: 20),
            _createAccount(context)
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

  Widget _emailField(BuildContext context) {
    return TextField(decoration: InputDecoration(hintText: 'Enter Email'));
  }

  Widget _continueButton() {
    return BasicButton(
      onPressed: (){},
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context){
    return RichText(  // Per Click
      text: TextSpan(
        children: [
           TextSpan(
            text: 'Dont have an Account?'
           ),
            TextSpan(
            text: ' Create One',
            recognizer: TapGestureRecognizer()..onTap = () {
              // signup page soon
            },
            style: TextStyle(
              fontWeight: FontWeight.bold
            )
           )
        ]
      )
    );
  }
}
