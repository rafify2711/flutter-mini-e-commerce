import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/core/utils/error_handler.dart';
import 'package:flutter_task/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_task/features/home/data/models/product.dart';
import 'package:flutter_task/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  late MockHomeDataSource mockDataSource;
  late HomeRepoImpl repo;

  setUp(() {
    mockDataSource = MockHomeDataSource();
    repo = HomeRepoImpl(mockDataSource);
  });

  group('HomeRepoImpl Tests', () {

    group('getProducts', () {
      test('should return Right(List<Product>) when data source succeeds', () async {
        final mockProducts = [
          Product(id: 1, title: 'Product 1', price: 100),
          Product(id: 2, title: 'Product 2', price: 200),
        ];
        when(mockDataSource.getProducts()).thenAnswer((_) async => mockProducts);

        final result = await repo.getProducts();

        expect(result, isA<Right>());
        result.fold(
              (failure) => fail('Expected Right but got Left'),
              (products) {
            expect(products, equals(mockProducts));
            expect(products.length, 2);
          },
        );
        verify(mockDataSource.getProducts()).called(1);
      });

      test('should return Left(ServerFailure) when DioException occurs', () async {
        when(mockDataSource.getProducts()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/products'),
            type: DioExceptionType.connectionError,
          ),
        );

        final result = await repo.getProducts();

        expect(result, isA<Left>());
        result.fold(
              (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.errorMessage, isNotEmpty);
          },
              (_) => fail('Expected Left but got Right'),
        );
        verify(mockDataSource.getProducts()).called(1);
      });

      test('should return Left(ServerFailure) when generic Exception occurs', () async {
        when(mockDataSource.getProducts()).thenThrow(Exception('Something went wrong'));

        final result = await repo.getProducts();

        expect(result, isA<Left>());
        result.fold(
              (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.errorMessage, contains('Something went wrong'));
          },
              (_) => fail('Expected Left but got Right'),
        );
        verify(mockDataSource.getProducts()).called(1);
      });
    });

    group('getCategories', () {
      test('should return Right(List<String>) when data source succeeds', () async {

        final mockCategories = ['Clothes', 'Shoes', 'Bags'];
        when(mockDataSource.getCategories()).thenAnswer((_) async => mockCategories);

        final result = await repo.getCategories();

        expect(result, isA<Right>());
        result.fold(
              (failure) => fail('Expected Right but got Left'),
              (categories) {
            expect(categories, equals(mockCategories));
            expect(categories.first, 'Clothes');
          },
        );
        verify(mockDataSource.getCategories()).called(1);
      });

      test('should return Left(ServerFailure) when DioException occurs', () async {
        when(mockDataSource.getCategories()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/categories'),
            type: DioExceptionType.badResponse,
          ),
        );

        final result = await repo.getCategories();

        expect(result, isA<Left>());
        result.fold(
              (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.errorMessage, isNotEmpty);
          },
              (_) => fail('Expected Left but got Right'),
        );
        verify(mockDataSource.getCategories()).called(1);
      });

      test('should return Left(ServerFailure) when generic Exception occurs', () async {
        when(mockDataSource.getCategories()).thenThrow(Exception('Cache error'));

        final result = await repo.getCategories();

        expect(result, isA<Left>());
        result.fold(
              (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.errorMessage, contains('Cache error'));
          },
              (_) => fail('Expected Left but got Right'),
        );
        verify(mockDataSource.getCategories()).called(1);
      });
    });
  });
}