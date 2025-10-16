import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/config/routes_name.dart';
import 'package:flutter_task/core/utils/app_text_style.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import 'package:flutter_task/core/widgets/app_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../cart/presentation/view_model/cart_cubit.dart';
import '../../../../cart/presentation/view_model/cart_state.dart';
import '../../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RoutesName.productDetails,
            arguments: product);
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(product.image ?? ""),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? "",
                      style: AppTextStyles.manropeSemiBold12,
                      maxLines: 3,
                    ),
                  ),
                  SvgPicture.asset(AssetsName.ratingIcon),
                  Text(
                    product.rating?.rate.toString() ?? "",
                    style: AppTextStyles.manropeMedium14,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$ ${product.price}",
                    style: AppTextStyles.manropeSemiBold16,
                    maxLines: 3,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "\$49.99",
                    style: AppTextStyles.manropeSemiBold12.copyWith(
                      color: AppColors.dark52,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,

            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const CircularProgressIndicator();
                }
                return AppButton(
                  onPress: () {
                    context.read<CartCubit>().addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart')),
                    );
                  },
                  text: "Add to Cart",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
