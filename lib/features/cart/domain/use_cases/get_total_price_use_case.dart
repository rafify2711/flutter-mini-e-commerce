import 'package:injectable/injectable.dart';
import '../repo/cart_repo.dart';

@injectable
class GetTotalPriceUseCase {
  final CartRepo repo;

  GetTotalPriceUseCase(this.repo);

  Future<double> call() async {
    return repo.getTotalPrice();
  }
}
