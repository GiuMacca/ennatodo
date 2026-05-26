import 'package:ennatodo/core/configs/theme/app_colors.dart';
import 'package:ennatodo/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ennatodo/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profile(),
                _citySelector(), // future feature
                _favorites(),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _profile() {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _citySelector(){
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _favorites() {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.favorite, color: AppColors.secondBackground),
    );
  }
}
