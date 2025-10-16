import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPress, required this.text});
  final VoidCallback onPress;
  final String text;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child:  Text(
          text,
          style: AppTextStyles.manropeMedium16.copyWith(color: AppColors.white)
      ),
    );
  }
}
