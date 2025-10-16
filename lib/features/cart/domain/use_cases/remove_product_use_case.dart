import 'package:injectable/injectable.dart';
import '../../../home/data/models/product.dart';
import '../repo/cart_repo.dart';

@injectable
class RemoveProductUseCase {
  final CartRepo repo;

  RemoveProductUseCase(this.repo);

  Future<void> call(Product product) async {
    repo.removeProductFromCart(product);
  }
}
