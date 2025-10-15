import 'package:flutter/material.dart';

import '../../core/utils/app_text_style.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Favorite',style: AppTextStyles.manropeExtraBold24,)),
    );
  }
}
