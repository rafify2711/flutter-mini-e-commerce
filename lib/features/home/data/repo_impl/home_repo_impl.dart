
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/core/utils/error_handler.dart';
import 'package:flutter_task/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_task/features/home/data/models/product.dart';
import 'package:flutter_task/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final data = await homeDataSource.getProducts();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final data = await homeDataSource.getCategories();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
