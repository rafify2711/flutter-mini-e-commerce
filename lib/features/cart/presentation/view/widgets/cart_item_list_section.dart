import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flutter_task/features/cart/presentation/view_model/cart_cubit.dart';

import '../../view_model/cart_state.dart';

class CartItemListSection extends StatelessWidget {
  const CartItemListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {

            if (state is CartLoaded) {
              log("CartLoaded in cart screen: ${state.cartItems}");
              final cartList = state.cartItems;
              if (cartList.isEmpty){
                return Center(child: Text("Cart_is_empty".tr()));
              }else{
              return SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartList[index];
                    return CartItemWidget(product: cartItem.product,quantity: cartItem.quantity);
                  }
                            ),
              );
            }
            }
            else if(state is CartInitial){
              return CircularProgressIndicator(
                color: AppColors.blue,
              );
            }
            else{
              return(Center(child: Text("Cant_Load_Cart".tr())));
            }

          }
      ),
    );
  }
}
