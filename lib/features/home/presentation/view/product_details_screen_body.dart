import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/widgets/app_button.dart';
import '../../data/models/product.dart';
import '../../../cart/presentation/view_model/cart_cubit.dart';
import '../../../../core/utils/app_text_style.dart';

class ProductDetailsBody extends StatelessWidget {
  final Product product;
  const ProductDetailsBody({required this.product, super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 9),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    product.image ?? "",
                    scale: 3,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "${product.title}",
                  style: AppTextStyles.manropeSemiBold16,
                ),

                const SizedBox(height: 20),

                Text("description".tr(),
                    style: AppTextStyles.manropeSemiBold16),
                const SizedBox(height: 4),
                Text(
                  product.description ?? "No description found.",
                  style: AppTextStyles.manropeMedium14,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("\$", style: AppTextStyles.manropeSemiBold20),
                    Text("${product.price}",
                        style: AppTextStyles.manropeSemiBold20),
                    const Spacer(),
                    Text("${'status'.tr()}:",
                        style: AppTextStyles.manropeMedium16),
                    Text("in_stock".tr(), style: AppTextStyles.manropeMedium14),
                  ],
                ),
                const SizedBox(height: 60),
                AppButton(onPress: () {
                    context.read<CartCubit>().addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Product_added_to_cart'.tr()),
                    ));
                  },
                  text: "Add_to_Cart".tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
