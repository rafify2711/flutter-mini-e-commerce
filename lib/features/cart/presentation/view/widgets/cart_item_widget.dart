import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_text_style.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import 'package:flutter_task/features/home/data/models/product.dart';

import '../../view_model/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;
   const CartItemWidget({super.key, required this.product, required this.quantity});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(product.image??"",
              width: 80,
              height: 80,),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.category??"",style: AppTextStyles.manropeSemiBold12.copyWith(color: AppColors.dark52),),
                Text(product.title??"",style: AppTextStyles.manropeSemiBold14.copyWith(color: AppColors.dark), maxLines: 3,),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      context.read<CartCubit>().removeProduct(product);
                    }, icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.dark52)
                        ),
                        child: Icon(Icons.remove))),
                    SizedBox(width: 10,),
                    Text(quantity.toString(),style: AppTextStyles.manropeSemiBold16.copyWith(color: AppColors.dark)),
                    SizedBox(width: 10,),
                    IconButton(onPressed: (){
                      context.read<CartCubit>().addProduct(product);
                    }
                        ,icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.dark52)
                        ),
                        child: Icon(Icons.add)))

                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetsName.heart),

                    Spacer(),
                    Text("\$ ${product.price!*quantity}"),
                  ],
                )
              ],

            ),
          ),
        ),

      ],
    );
  }
}
