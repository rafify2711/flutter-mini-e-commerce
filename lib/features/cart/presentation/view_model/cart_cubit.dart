import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/add_product_use_case.dart';
import '../../domain/use_cases/clear_cart_use_case.dart';
import '../../domain/use_cases/get_cart_use_case.dart';
import '../../domain/use_cases/get_total_price_use_case.dart';
import '../../domain/use_cases/remove_product_use_case.dart';
import '../../../home/data/models/product.dart';
import 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddProductUseCase addProductUseCase;
  final RemoveProductUseCase removeProductUseCase;
  final ClearCartUseCase clearCartUseCase;
  final GetCartUseCase getCartUseCase;
  final GetTotalPriceUseCase getTotalPriceUseCase;

  CartCubit(
      this.addProductUseCase,
      this.removeProductUseCase,
      this.clearCartUseCase,
      this.getCartUseCase,
      this.getTotalPriceUseCase,
      ) : super(CartInitial());

  void addProduct(Product product) async {
    emit(CartLoading());
    await addProductUseCase(product);
    final cartItems = await getCartUseCase();
    final totalPrice = await getTotalPriceUseCase();
    emit(CartLoaded(cartItems, totalPrice));
  }

  void removeProduct(Product product) async {
    emit(CartLoading());
    await removeProductUseCase(product);
    final cartItems = await getCartUseCase();
    final totalPrice = await getTotalPriceUseCase();
    emit(CartLoaded(cartItems, totalPrice));
  }

  void clearCart() async {
    emit(CartLoading());
    await clearCartUseCase();
    emit(CartLoaded([], 0));
  }

  void loadCart() async {
    final cartItems = await getCartUseCase();
    final totalPrice = await getTotalPriceUseCase();
    emit(CartLoaded(cartItems, totalPrice));
  }
}
