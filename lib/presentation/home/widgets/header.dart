import 'package:ennatodo/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profile(),
        //_citySelector(), // future feature
        _favorites(),
      ],
    );
  }

  Widget _profile() {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle
      ),
    );
  }

  //Widget _citySelector(){}

  Widget _favorites(){
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle
      ),
      child: Icon(
        Icons.favorite,
        color: AppColors.secondBackground,
      ),
    );
  }
}
