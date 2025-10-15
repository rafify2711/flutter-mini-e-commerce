import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/error_handler.dart';
import '../../data/models/product.dart';
import '../repo/home_repo.dart';

@injectable
class GetProductsUseCase {
  final HomeRepo homeRepo;
  GetProductsUseCase(this.homeRepo);

  Future<Either<Failure, List<Product>>> call() async {
    return await homeRepo.getProducts();
  }

}