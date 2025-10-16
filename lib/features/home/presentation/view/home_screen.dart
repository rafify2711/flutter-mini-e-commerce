import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/di.dart';
import 'package:flutter_task/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:flutter_task/features/home/presentation/view_model/home_cubit.dart';

import 'home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<HomeCubit>(
    create: (_) => getIt<HomeCubit>()
      ..fetchProducts()
      ..fetchCategories()
      ..detectLocation(),
    child: const HomeScreenBody(),
    ),
      BlocProvider<CartCubit>(
    create: (_) => getIt<CartCubit>())
    ], child: const HomeScreenBody(),);
  }
}
