import 'package:ennatodo/common/bloc/button/button_cubit.dart';
import 'package:ennatodo/common/bloc/button/button_state.dart';
import 'package:ennatodo/common/helper/navigator/app_navigator.dart';
import 'package:ennatodo/common/widgets/appBar/app_bar.dart';
import 'package:ennatodo/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';
import 'package:ennatodo/domain/auth/usecases/signup_usecase.dart';
import 'package:ennatodo/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createAccountText(context),
              const SizedBox(height: 20),
              _firstNameField(context),
              const SizedBox(height: 20),
              _lastNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              _submitButton(context),
              const SizedBox(height: 20),
              _useYourAccount(context),
            ],
          ),
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

  Widget _firstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameCon,
      decoration: InputDecoration(hintText: 'Firstname'),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameCon,
      decoration: InputDecoration(hintText: 'Lastname'),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            // call signup usecase
            context.read<ButtonCubit>().execute(
              usecase: SignupUsecase(),
              params: UserCreationReq(
                firstName: _firstNameCon.text,
                lastName: _lastNameCon.text,
                email: _emailCon.text,
                password: _passwordCon.text,
              ),
            );
          },
          title: 'Submit',
        );
      }
    );
  }

  Widget _useYourAccount(BuildContext context) {
    return RichText(
      // Per Click
      text: TextSpan(
        children: [
          TextSpan(text: 'Do you have an Account?'),
          TextSpan(
            text: ' SignIn',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, const SigninPage());
              },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
