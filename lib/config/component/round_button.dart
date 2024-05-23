import 'package:bloc_clean_arch/config/colors/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final double height;
  const RoundButton({super.key, required this.onPress, required this.title, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width -10,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(title,style: TextStyle(color: AppColors.buttonTitleColor),)),
      ),
    );
  }
}
