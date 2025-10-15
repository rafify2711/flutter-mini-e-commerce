import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cart',style: AppTextStyles.manropeExtraBold24,)),
    );
  }
}
