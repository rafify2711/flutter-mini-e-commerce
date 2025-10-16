import '../../../home/data/models/product.dart';
import '../entities/cart_entity.dart';

abstract class CartRepo {
  List<CartItem> getCart();
  void addProductToCart(Product product);
  void removeProductFromCart(Product product);
  void clearCart();
  double getTotalPrice();
}