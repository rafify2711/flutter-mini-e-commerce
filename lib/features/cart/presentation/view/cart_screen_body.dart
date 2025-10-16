import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/config/routes_name.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import 'package:flutter_task/core/widgets/app_devider.dart';
import 'package:flutter_task/core/widgets/icon_builder.dart';
import 'package:flutter_task/features/cart/presentation/view/widgets/cart_item_list_section.dart';
import 'package:flutter_task/features/cart/presentation/view/widgets/shipping_info_section.dart';
import 'package:flutter_task/features/cart/presentation/view/widgets/checkout_section.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class CartScreenBody  extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text("cart".tr(),style: AppTextStyles.manropeSemiBold20,),
        centerTitle: true,
        leading: Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.dark0A,
              width: 1.5,
            ),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.layOut);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22,
                color: AppColors.navy,
              ),
              padding: EdgeInsets.all(4),

            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: iconBuilder(AssetsName.heart, false),
          )

        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartItemListSection(),
            AppDevider(),
            ShippingInfoSection(),
            CheckoutSection()
          ],
        ),
      ),
    );
  }
}
