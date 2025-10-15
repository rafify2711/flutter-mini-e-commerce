import 'package:flutter/material.dart';

import '../../core/utils/app_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile',style: AppTextStyles.manropeExtraBold24,)),
    );
  }
}
