import 'package:dartz/dartz.dart';
import 'package:flutter_task/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_task/core/utils/error_handler.dart';
import 'package:flutter_task/features/home/data/models/product.dart';
import 'package:flutter_task/features/home/domain/repo/home_repo.dart';

import 'get_product_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late GetProductsUseCase useCase;
  late MockHomeRepo mockHomeRepo;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    useCase = GetProductsUseCase(mockHomeRepo);
  });

  group('GetProductsUseCase', () {
    test('should return Right(List<Product>) when repo returns right', () async {
      final mockProducts = [
        Product(id: 1, title: 'Test Product', price: 10),
      ];
      when(mockHomeRepo.getProducts())
          .thenAnswer((_) async => Right(mockProducts));

      final result = await useCase();

      expect(result, isA<Right>());
      result.fold(
            (failure) => fail('Expected Right but got Left'),
              (products) => expect(products, equals(mockProducts)),
      );
      verify(mockHomeRepo.getProducts()).called(1);
    });

    test('should return Left(ServerFailure) when repo returns Left', () async {
      final failure = ServerFailure(errorMessage: 'Server Error');
      when(mockHomeRepo.getProducts())
          .thenAnswer((_) async => Left(failure));

      final result = await useCase();

      expect(result, isA<Left>());
      result.fold(
            (failure) => expect(failure.errorMessage, 'Server Error'),
            (_) => fail('Expected Left but got Right'),
      );
      verify(mockHomeRepo.getProducts()).called(1);
    });
  });
}
