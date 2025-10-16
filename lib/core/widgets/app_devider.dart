import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppDevider extends StatelessWidget {
  const AppDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(height: 2,color: AppColors.dark14,),
    );
  }
}
