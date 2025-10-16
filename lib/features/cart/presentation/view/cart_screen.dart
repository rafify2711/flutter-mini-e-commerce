import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/di.dart';
import 'package:flutter_task/features/cart/presentation/view_model/cart_cubit.dart';

import 'cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(create:(_) => getIt<CartCubit>()
        ..loadCart(),
      child: const CartScreenBody(),

    );
  }
}
