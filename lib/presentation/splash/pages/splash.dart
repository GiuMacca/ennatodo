import 'package:ennatodo/core/configs/theme/app_colors.dart';
import 'package:ennatodo/presentation/auth/pages/signin.dart';
import 'package:ennatodo/presentation/splash/bloc/splash_cubit.dart';
import 'package:ennatodo/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  SigninPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text(
            "Enna ToDo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary ,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
