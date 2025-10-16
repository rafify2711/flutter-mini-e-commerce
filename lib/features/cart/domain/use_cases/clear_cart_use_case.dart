import 'package:injectable/injectable.dart';
import '../repo/cart_repo.dart';

@injectable
class ClearCartUseCase {
  final CartRepo repo;

  ClearCartUseCase(this.repo);

  Future<void> call() async {
    repo.clearCart();
  }
}
