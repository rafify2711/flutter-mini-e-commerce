import 'dart:developer';
import '../../../home/data/models/product.dart';
import '../../domain/entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/cart_repo.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final List<CartItem> cart = [];

  @override
  void addProductToCart(Product product) {
    try {
      final index = cart.indexWhere((item) => item.product.id == product.id);
      if (index != -1) {
        cart[index].quantity += 1;
      } else {
        cart.add(CartItem(product: product));
        log("Item added to cart: ${product.title}");
        log("Cart: $cart");
      }
    } catch (e) {
      log("Error adding item to cart: $e");
    }
  }

  @override
  void removeProductFromCart(Product product) {
    try {
      final index = cart.indexWhere((item) => item.product.id == product.id);
      if (index != -1) {
        if (cart[index].quantity > 1) {
          cart[index].quantity -= 1;
        } else {
          cart.removeAt(index);
        }
      }
    } catch (e) {
      log("Error removing item from cart: $e");
    }
  }

  @override
  List<CartItem> getCart() => cart;

  @override
  double getTotalPrice() =>
      cart.fold(0, (sum, item) => sum + item.totalPrice);

  @override
  void clearCart() {
    cart.clear();
  }
}
