import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/widgets/app_button.dart';
import 'package:flutter_task/core/widgets/app_devider.dart';
import 'package:flutter_task/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter_task/features/cart/presentation/view_model/cart_state.dart';

import '../../../../../core/utils/app_text_style.dart';

class CheckoutSection extends StatelessWidget {

  const CheckoutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double shippingFee = 10.00;
    final double taxes = 5.00;

    return BlocBuilder<CartCubit,CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
    final double subtotal = shippingFee + taxes + state.totalPrice;
          return Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Items
            _buildRow("Total (${state.cartItems.length} Items)", "\$${state.totalPrice.toStringAsFixed(2)}"),
            const SizedBox(height: 8),

            // Shipping Fee
            _buildRow("Shipping Fee", "\$${shippingFee.toStringAsFixed(2)}"),
            const SizedBox(height: 8),

            // Taxes
            _buildRow("Taxes", "\$${taxes.toStringAsFixed(2)}"),
            const SizedBox(height: 50),

            // Divider
            const AppDevider(),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total",
                      style: AppTextStyles.manropeSemiBold14,
                    ),
                    Text(
                      "\$${subtotal.toStringAsFixed(2)}",
                      style: AppTextStyles.manropeSemiBold20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                AppButton(onPress: (){}, text: "Checkout")

              ],
        )],
      ));
        }
      else {
        return CircularProgressIndicator();
        }}
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}