import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/utils/error_handler.dart';
import 'package:flutter_task/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_product_use_case_test.mocks.dart';

void main(){
  late GetCategoriesUseCase useCase;
  late MockHomeRepo mockHomeRepo;

  setUp((){
    mockHomeRepo = MockHomeRepo();
    useCase = GetCategoriesUseCase(mockHomeRepo);
  });

  group('GetCategoriesUseCase', (){
    test('should return Right(List<String>) when repo return right', () async{
      final mockCategories = ['Clothes', 'Shoes', 'Bags'];
      when(mockHomeRepo.getCategories())
          .thenAnswer((_) async => Right(mockCategories));
      final result =  await useCase();
      expect(result, isA<Right>());
      result.fold(
            (failure) => fail('Expected Right but got Left'),
            (categories) => expect(categories, equals(mockCategories)),

      );
        verify(mockHomeRepo.getCategories()).called(1);

    });});

  test('should return Left(ServerFailure) when repo returns Left', () async {

    final failure = ServerFailure(errorMessage: 'Cache Error');
    when(mockHomeRepo.getCategories())
        .thenAnswer((_) async => Left(failure));

    final result = await useCase();

    expect(result, isA<Left>());
    result.fold(
          (failure) => expect(failure.errorMessage, 'Cache Error'),
          (_) => fail('Expected Left but got Right'),
    );
    verify(mockHomeRepo.getCategories()).called(1);
  });
}