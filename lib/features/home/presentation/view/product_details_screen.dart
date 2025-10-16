import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/di/di.dart';
import 'package:flutter_task/features/home/presentation/view/product_details_screen_body.dart';
import '../../../cart/presentation/view_model/cart_cubit.dart';
import '../../data/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.title ?? "Product Details"),
          centerTitle: true,
        ),
        body: ProductDetailsBody(product: product),
      ),
    );
  }
}
