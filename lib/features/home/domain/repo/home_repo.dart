import 'package:dartz/dartz.dart';
import 'package:flutter_task/features/home/data/models/product.dart';

import '../../../../core/utils/error_handler.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<String>>> getCategories();
}