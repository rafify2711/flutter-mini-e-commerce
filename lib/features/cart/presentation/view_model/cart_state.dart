import '../../domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  final double totalPrice;

  CartLoaded(this.cartItems, this.totalPrice);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
