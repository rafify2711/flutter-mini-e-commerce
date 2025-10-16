import 'package:injectable/injectable.dart';
import '../repo/cart_repo.dart';
import '../entities/cart_entity.dart';

@injectable
class GetCartUseCase {
  final CartRepo repo;

  GetCartUseCase(this.repo);

  Future<List<CartItem>> call() async {
    return repo.getCart();
  }
}
