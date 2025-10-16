import 'package:injectable/injectable.dart';
import '../../../home/data/models/product.dart';
import '../repo/cart_repo.dart';

@injectable
class AddProductUseCase {
  final CartRepo repo;

  AddProductUseCase(this.repo);

  Future<void> call(Product product) async {
    repo.addProductToCart(product);
  }
}
